# Alcovia | Student app adoption and retention strategy
**Candidate assessment · 16 October 2026 · Evidence-based proposal, not a completed experiment**

## 1. Decision in one paragraph
I would **not redesign all 25 features or immediately optimize for 30 minutes of screen time**. I would test one joined-up daily loop: **Home → suggested study action → Focus Timer / chapter milestone → Realm reward → progress feedback**. The bet is that a popular destination (Realm) can reinforce a valuable behavior (learning). First validate event definitions, interview a small student sample, run an opt-in pilot, and then scale only if useful study activity and repeat engagement both improve without worsening well-being.

## 2. Observed facts (source: assignment brief, Mixpanel 30 Aug–13 Oct 2026; 20 students; 2 test devices excluded)
| Observation | Meaning / caution |
|---|---|
| Reported average app usage: 2.15 minutes; long-term aspiration: 30 minutes | Verify unit (per session, per user per day, or averaging all users?) before choosing a target; 2.15→30 is approximately 14x and is not an appropriate short-term forecast. |
| 20 students active in 45 days; 11–17 active in a given week | Very small cohort, large sampling noise. |
| 7 have not opened the app for two weeks | A reactivation segment, not necessarily churn. |
| All 20 used Home; 13 used Realm | Popular path; evidence of discovery, not learning outcomes. |
| 11 tried Focus Timer; 5 use it regularly | Activation-to-habit gap; “regularly” requires an operational definition. |
| 10 opened Syllabus, only 1 in latest week | Low repeat value or discoverability; root cause unknown. |
| No Study Planner / Academic History use in latest week; one Goals completion in 45 days | Prioritize simplification/validation instead of more feature construction. |
| Wellness: one WHOOP connection; Streak/Rankings one student each | Strong signals of low adoption; device ownership and consent likely constrain wellness. |

**Do not infer:** exact retention rate, causal effects, session-length distribution, or whether low engagement is due to usability, insufficient syllabus data, motivation, seasonality, timetable pressure or poor instrumentation.

## 3. Diagnosing the behavior (Days 1–7 after Nov 1)
1. **Instrumentation audit:** Trace real Mixpanel event names/IDs for app_open, home_view, realm_open, focus_start, focus_complete, chapter_view, chapter_complete, task_add, task_complete, quest_reward, push_received/opened. Ensure background/idle time is excluded; separate active vs passive time, dedupe users and exclude test devices.
2. **Funnel:** Active students → meaningful action opened → action completed → same meaningful action on a second day within seven days. Segment by new/existing student, Android/iOS, advisor, onboarding completeness, and current Realm/focus behaviors; suppress tiny segments in shared reports.
3. **Qualitative checks:** Talk to 5–7 students (with appropriate permissions) and 2–3 advisors. Watch completion of “choose a chapter, start a focus session, see progress.” Ask about motivation, timetable fit, app confusion and content gaps, not leading questions.
4. **Completeness audit:** Verify syllabus, exams, task/mentor info exists and is up-to-date. An empty Study Planner cannot become habitual.
5. **Technical baseline:** Keep a lightweight performance/crash dashboard; “zero failures” in a short brief is not evidence of flawless UX.

## 4. Prioritized bets
| Rank | Product bet | Why | Smallest implementation |
|---|---|---|---|
| P0 | One useful daily action on Home | All recent users access Home; avoid choice overload | One “Today’s next step” card personalized from upcoming chapter/task |
| P0 | Focus-to-Realm bridge | Realm = 13/20; only five recurring focus users | Reward completed, qualified focus activity with modest Realm progress, plus learning-progress feedback |
| P1 | Advisor-supported activation | Existing advisor cadence can provide context | Assign a specific 7-day focus or chapter goal at advisor meeting and review completion |
| Defer | More wellness integrations, ranking redesign, new planner module | Low adoption, high integration cost/privacy risk | Discovery only until core loop works |

**Guardrail:** Do not pay coins for merely keeping the screen open. Require user-confirmed action or meaningful focus completion, allow breaks, avoid punitive streaks and public comparisons among minors.

## 5. Measurement contract
**Primary metric:** Weekly Meaningful Learning Active Students (WMLAS) = distinct enrolled students with ≥1 qualifying completed focus session (e.g., ≥10 verified minutes) OR a validated chapter/quiz/task completion during the week. Definition is a proposal requiring agreement with advisors.

**Supporting metrics:** qualified focus sessions per weekly active student, weekly returning learners, first-week meaningful-action activation, chapter rigor progression, week-over-week completeness of adviser-assigned actions.

**Guardrails:** self-reported usefulness, unwanted notifications, crashes, battery drain, session dropouts, support complaints, unplanned screen time. **Diagnostic:** median active app minutes/day, not the success metric alone.

**Denominator discipline:** Show counts AND percentages, e.g. 5/20 not just 25%. Do not publish individual wellness or private student narratives in marketing dashboards.

## 6. Pilot and decision
- **Week 1:** instrumentation and interviews; agree on valid learning actions.
- **Week 2:** introduce “Today's next step” to a consenting subgroup; verify events / usability.
- **Weeks 3–4:** run within-subject baseline vs intervention or phased rollout (randomized only if feasible). With n≈20 this is directional learning, not a statistically powered A/B test.
- **Weeks 5–6:** compare student-level changes and qualitative feedback. Expand only if at least 3–5 additional students consistently perform meaningful learning activity and median useful study activity rises, without deterioration in guardrails. These are **illustrative decision thresholds**, to be finalized after baseline.

**Failure response:** If Realm activity rises but study completions do not, reject the reward mechanism or change the study utility—not the success metric. If students report content/timetable issues, fix data completeness and task relevance before more gamification.

## 7. Team ownership, starting November 1
| Owner | Deliverables |
|---|---|
| Product, Systems & Analytics Lead | Problem framing, interviews, priority decisions, metric dictionary, privacy/ethics guardrails, experiment analysis |
| Full-stack engineer | Event audit, data joins, next-action API/card, Focus→Realm logic, QA, rollbacks |
| Process/systems designer | Advisor goal templates, content completeness audit, onboarding prompts, feedback collection and exception follow-up |

**Operational rhythm:** 15-minute daily unblock; twice-weekly product check; weekly decision memo (what changed, what evidence, next action). Every shipped change has owner, instrumentation, QA, rollback and post-launch review.

## 8. Dependencies and unresolved questions
Verify 2.15-minute metric definition, actual cohort and event export, platform limitations for focus restrictions, student/parent permissions, WHOOP ownership, availability of syllabus/task data, and whether a week contains school/exam breaks. No claims of real student interviews, live experimentation or production app usage are made here.
