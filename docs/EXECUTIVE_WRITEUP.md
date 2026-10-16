# Alcovia | Executive submission
**Product, Systems & Analytics Lead · Candidate proposal · 16 October 2026**
**Assessment:** 72-hour demonstration | **Execution plan begins:** 1 November 2026

## Executive decision
Alcovia should **reuse its existing stack** (ClickUp, n8n, Smallest.ai) while adding a carefully defined reporting layer, not replace tools during rapid scale-up. I would deliver two small operating dashboards backed by metric definitions and exception queues, then pilot a specific student learning-retention loop. The priority is **observable business outcomes and low manual effort**, not the number of features shipped.

**Submission demonstrations:** [GTM dashboard](https://mehtabalam12.github.io/alcovia-product-systems-analytics/dashboard/) · [Student dashboard](https://mehtabalam12.github.io/alcovia-product-systems-analytics/student-dashboard/) · [GitHub repository](https://github.com/Mehtabalam12/alcovia-product-systems-analytics).

These are **live interactive prototypes using synthetic data**. n8n JSON files contain manual-trigger demonstrations, **not tested production integrations**. I have not claimed app hands-on testing, live ClickUp/Razorpay connections or a controlled cohort experiment.

## Problem 1 | Student app adoption: target useful engagement
**Evidence:** 20 students used the app during Aug 30–Oct 13; Home used by all, Realm by 13, Focus Timer opened by 11 but regularly used by five; only one syllabus user in latest week; seven inactive for two weeks. Alcovia reports 2.15 minutes average vs 30-minute aspiration; time unit needs clarification.

**Hypothesis / recommended bet:** A daily Home next-action card linked to a qualified Focus Timer session, measurable syllabus progress and restrained Realm rewards may create an enduring learning habit. First audit Mixpanel and observe students completing tasks; do not mistake screen time for academic success.

**Pilot:** define Weekly Meaningful Learning Active Students, validate events, talk with 5–7 students, test a limited release, and assess changed learning behavior plus student wellbeing. Small cohort means directional decisions, not statistical significance. Full analysis: [App adoption plan](./APP_ADOPTION_STRATEGY.md).

## Problem 2 | GTM control center
**Decision questions:** Are we on monthly cash-revenue target? Which trial and full-program conversions are real? Where does discovery/ambition/architect funnel lose students? Which Meta ads merit scale, refresh or pause?

**Sources / ownership:** ClickUp owns lead stage history and follow-up tasks; Razorpay owns payment events; Meta owns campaigns; n8n moves data; Postgres reporting model defines audited metrics.

**Contracts:** Cash collected ≠ invoices issued; outstanding = invoiced minus applied payments; distinguish cohort acquisition conversion from period payment conversion; aggregate CPC/CTR ratios from sums; show freshness and data reconciliation status. Synthetic dashboard is an interface prototype, not a production system.

**Operating decisions:** Review campaign frequency ≥3 for refresh; pause only when spend/conversion evidence and learning-stage confidence support it. Small cohorts and attribution uncertainty make hard rules risky.

## Problem 3 | Reliable product/system delivery
Use one 8-stage gate: **intake → baseline → prioritize → design → build → QA → controlled release → impact review**. In ClickUp each request has accountable owner, hypothesis, baseline metric, metric denominator, dependencies, exact acceptance tests, instrumentation plan, customer/privacy impact, rollback and review date. Weekly demos and decision logs make delivery inspectable; exception queues with retries/idempotency prevent invisible failures.

**Team of three:** PM/analytics lead owns scope, metrics, decisions and QA sign-off; full-stack engineer owns code, integrations, schema, reliability; commerce process designer owns ClickUp journey design, advisor inputs, workflow SOPs, reconciliation and training. Do not let an n8n workflow become the source of truth.

## Problem 4 | Student progress intelligence
Three views: **Quantity** (planned vs delivered activities), **Quality** (attendee feedback, perceived value), and **Student performance** (task/deadline adherence, quiz results, chapter rigor, roadmap goals, engagement and skill rubrics). Display cohort and role-limited individual views. Define chapter milestones as reading → recollection → practice >70% → timed prior-paper → exam-readiness >80%. A stage is not completed solely because a check box was clicked; preserve evidence and date.

Data capture priority: auto-ingest app and attendance events when available; weekly advisor validation only for qualitative scores and exceptions; use user-confirmed feedback and opt-in wearable measures, never inferred health diagnoses. Pilot with one advisor cohort.

## Six-week timeboxes from November 1
| Window | Decision / delivery | Lead / support |
|---|---|---|
| W1 · Nov 1–7 | Access audit, working metric contracts, 5–7 student interviews, data maps, instrumentation QA | PM / Engineer / Systems |
| W2 · Nov 8–14 | GTM MVP: revenue/funnel reporting, ClickUp-Razorpay matching and discrepancy queue | Engineer / Systems / PM |
| W3 · Nov 15–21 | Student pilot dashboard with advisor input templates, quantity/quality/performance, permissions | Systems / Engineer / PM |
| W4 · Nov 22–28 | One daily student action + Focus/Realm pilot, owner-visible feature events, failure rollback | Engineer / PM |
| W5 · Nov 29–Dec 5 | n8n error handling, stale-data/exception alerts, advisor workflow hardening, training | Systems / Engineer |
| W6 · Dec 6–12 | Evaluate cohort shifts, commercial metrics, quality and effort saved; approve scale/iterate/stop | PM / all |

Dates are planning assumptions, not commitments that production access is already available.

## Resource and risk allocation
Keep **one engineer** focused on critical-path data plumbing and the narrow app experiment. Keep **one systems designer** focused on ClickUp state hygiene, parent/advisor workflows and input quality. PM/analytics lead verifies each outcome with data and avoids speculative rewrites. Integrations may require credentials and vendor APIs; prototype dashboards must not be presented as live operations.

**Risks:** small student denominator; inconsistent payment attribution; duplicated events; unvalidated data quality; student minors' privacy; wearable consent; Android/iOS focus-blocking limits. No production child data is included in GitHub.

## Success after six weeks
A reconciled weekly GTM review from one data definition, advisor review work no longer scattered among documents, an auditable exception backlog, and directional evidence that more students complete genuinely helpful learning actions. Decisions to scale must be based on observed outcomes, not demo appearance.
