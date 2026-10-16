# n8n exception-queue demonstrations

All three workflows are **importable, non-production demos**. They use a Manual Trigger and inline **fictional sample records**, require **no credentials**, make **no outbound calls**, and do **not** update ClickUp/Razorpay or contact minors.

## Import and inspect

1. In n8n create a workflow, choose **Import from file**, and upload one of the JSON files in this folder.
2. Select **Execute workflow**. Inspect the outputs of the three Code nodes.
3. Keep workflow **inactive**. Use the last node's `idempotency_key` and action record to simulate an exception queue.

## Examples & decision rules

| Workflow | Trigger in demo | Exception rule | Destination after integration |
|---|---|---|---|
| `01_lead_stage_sla_demo.json` | Manual, synthetic lead-stage records | Qualified / scheduled over 2 days; ambition / architect over 3 days | ClickUp owned follow-up task |
| `02_invoice_exception_demo.json` | Manual, synthetic invoice and payment records | Past due date and amount - allocated payments > 0 | Finance exception queue |
| `03_student_engagement_demo.json` | Manual, synthetic anonymized activity | 60%+ weekly focus decline and >=2 missed deadlines | Advisor-only review queue |

## Production design (not implemented in demos)

**Schedule & data ingestion:** Replace Manual Trigger and Synthetic Inputs with a scheduled trigger plus authenticated ingestion of ClickUp lead history, Razorpay invoice/payment webhooks and student events. Log last successful sync and time zone, retry on 429/5xx and pause/escalate on missing critical fields.

**Persisted deduplication:** The sample `idempotency_key` field is illustrative and **does not deduplicate by itself**. Before creating an action, atomically `INSERT INTO exception_queue(idempotency_key, ...) VALUES(...) ON CONFLICT DO NOTHING RETURNING ...` in Postgres (unique key), then only write downstream for newly inserted records.

**Delivery:** Create ClickUp task using API credentials sourced from n8n's secret store. Record external task ID and update send status. Replay failed records via dead-letter queue and an operator dashboard. Avoid firing student or parent messages without review.

**Health & privacy:** Alert on error rates, backlog age, duplicate attempts, source freshness and invalid ID joins. Student records are aliases; real school and health data require role-based access and retention policies.

**Metric contracts:** An invoice may be partially paid; never equate invoice issued with collected revenue. A lead's stage age uses first/last verified stage transition based on the agreed metric contract. Declines are screening signals, not evidence of student failure.

## Tests

Expect **2 lead exceptions**, **2 invoice exceptions** and **2 student exceptions** with the bundled synthetic fixtures. Re-running the workflow produces the same outputs, which is expected in a pure demo; it would **not** be safe to repeatedly run production writes without persisted deduplication.
