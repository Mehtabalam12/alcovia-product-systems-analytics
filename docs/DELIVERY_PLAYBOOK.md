# Product delivery and control loop

1. **Intake**: Capture who has the problem, evidence, business effect, owner and deadline in ClickUp.
2. **Baseline**: Define metric, denominator, tracking events, data owner and a qualitative observation.
3. **Prioritize**: Score expected impact, confidence, effort, dependencies and student-safety risk.
4. **Design**: Agree smallest change, accessibility, acceptance criteria, operating handoffs and fallback.
5. **Build**: Full-stack engineer owns implementation, PM owns instrumentation/QA, systems designer owns operational flow and input design.
6. **Validate**: Unit tests, data reconciliation, advisor walkthrough, privacy review, synthetic test accounts and recovery scenario.
7. **Release**: Small cohort/feature flag; verify events and error alerts before broad launch.
8. **Observe**: Daily exceptions, weekly KPI review, predefined guardrails; investigate rather than assuming causality.
9. **Decide**: Scale / iterate / stop based on effectiveness and operational cost. Record decision and evidence.

## Six-week timeline, if joining November 1
- W1: user interviews, ClickUp/analytics audit, metric contracts and integration diagram.
- W2: reporting database and revenue/funnel MVP with reconciliation.
- W3: student dashboard pilot, quantity/quality/performance definitions and feedback flow.
- W4: Realm → focus/study experiment to test value, not screen time alone.
- W5: automation hardening, alert deduplication, access policy and process improvements.
- W6: cohort review, verified outcomes, incident playbook and prioritized roadmap.

## Guardrails
Only collect necessary student data; use aliases in shared reports. Opt-in health data with scoped permissions and retention. Human review before sending performance-related parent notifications. Implement idempotency keys, retries and exception queues on integrations.
