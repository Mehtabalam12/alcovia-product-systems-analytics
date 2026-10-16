# Alcovia — Product, Systems & Analytics Assessment

Interactive candidate prototype for the **Product, Systems & Analytics Lead** practical assignment.

## Demo links (once GitHub Pages is enabled)

- [GTM Control Center](https://mehtabalam12.github.io/alcovia-product-systems-analytics/dashboard/)
- [Student Progress Intelligence](https://mehtabalam12.github.io/alcovia-product-systems-analytics/student-dashboard/)
- [Landing page](https://mehtabalam12.github.io/alcovia-product-systems-analytics/)

The links require **Settings → Pages → Deploy from a branch → main → /(root)**. Publishing is not confirmed until GitHub Pages reports success.

## Scope

**Problem 1 — Student app adoption:** Current reported app usage averages 2.15 minutes against a 30-minute aspirational target; 20 users in the last 45 days. Hypothesis: connect useful focus/study behavior to Realm rewards, then validate with small cohorts, measured retention and qualitative feedback before scaling. Do not optimize screen time without learning value.

**Problem 2 — GTM analytics:** Revenue (program, trial, workshop, invoices), acquisition funnel, campaign KPIs, and RCA. Interactive synthetic-data demo in `dashboard/index.html`.

**Problem 3 — Delivery operating system:** Every change requires a brief, owner, baseline, acceptance criteria, instrumentation, QA, controlled release and post-launch decision. Responsibilities: lead PM/analytics, one full-stack engineer, one process/systems designer.

**Problem 4 — Student outcome measurement:** Quantity, quality and student performance lens; daily/weekly/monthly progress, advisor follow-up and academic rigor. Interactive synthetic-data demo in `student-dashboard/index.html`.

## Architecture direction

Source systems: ClickUp (leads/processes), Razorpay (payments), Meta Ads (campaigns), product event analytics, student app, advisor inputs. Connect using versioned ingestion workflows, consistent IDs, UTC source timestamps with IST reporting, staging validations, and a reporting database. n8n should handle replayable, idempotent workflows with error alerts rather than becoming the system of record.

Recommended tables include lead, lead_stage_event, ad_daily, campaign, invoice, payment, enrollment, student, focus_session, chapter_stage_event, session, session_attendance, feedback, and roadmap_milestone. Distinguish invoice issued from cash received, and acquisition-cohort conversion from selected-period cash conversion.

## Data and privacy

**All in-browser records are generated / synthetic.** They are not connected to production systems. The student prototype is not a production health-record system. Avoid publicly uploading real students’ profiles, health readings or Alcovia API secrets.

## Run locally

Open `index.html` in a modern browser. Follow links to `dashboard/index.html` or `student-dashboard/index.html`. No backend is required for the interactive prototypes.

## Next steps

- Enable Pages for a public URL; verify both dashboards.
- Extend repository with SQL definitions, scripts, workflows and executive documentation from the complete assessment ZIP.
- Validate metrics with Alcovia’s metric owners, app telemetry and real integration access before production rollout.
