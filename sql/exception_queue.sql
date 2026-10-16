-- Reference schema for future production integration (not used by static demos).
CREATE TABLE IF NOT EXISTS exception_queue (
  idempotency_key TEXT PRIMARY KEY,
  exception_type TEXT NOT NULL,
  subject_ref TEXT NOT NULL,
  assigned_to TEXT,
  payload JSONB NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  state TEXT NOT NULL DEFAULT 'pending' CHECK (state IN ('pending','processing','completed','failed')),
  external_task_id TEXT,
  attempts INTEGER NOT NULL DEFAULT 0,
  last_error TEXT
);
-- Enqueue atomically: only newly inserted rows are eligible for downstream writes.
-- Example with bound query parameters:
INSERT INTO exception_queue
 (idempotency_key, exception_type, subject_ref, assigned_to, payload)
VALUES ($1,$2,$3,$4,$5::jsonb)
ON CONFLICT (idempotency_key) DO NOTHING
RETURNING idempotency_key;
-- Use an authenticated worker to process pending rows and persist external task IDs.
-- Idempotency at the external API may also be needed in case a response is lost.
