-- Time windows use [start,end), in UTC; render in Asia/Kolkata.
-- Cash received in reporting window vs invoice issued in reporting window:
SELECT date_trunc('month',paid_at AT TIME ZONE 'Asia/Kolkata') AS month_ist,
       SUM(amount_inr) AS paid_revenue_inr
FROM payment GROUP BY 1 ORDER BY 1;
-- Eligible unpaid balance includes partial payments:
SELECT i.invoice_id, i.amount_inr-COALESCE(SUM(p.amount_inr),0) AS unpaid_inr
FROM invoice i LEFT JOIN payment p USING(invoice_id)
GROUP BY i.invoice_id,i.amount_inr
HAVING i.amount_inr>COALESCE(SUM(p.amount_inr),0);
-- Acquisition-cohort qualification percentage:
WITH cohort AS (
 SELECT lead_id FROM lead
 WHERE created_at >= :start_utc AND created_at < :end_utc
), qualified AS (
 SELECT DISTINCT lead_id FROM lead_stage_event
 WHERE stage='qualified'
)
SELECT COUNT(*) AS leads,COUNT(q.lead_id) AS qualified_leads,
ROUND(100.0*COUNT(q.lead_id)/NULLIF(COUNT(*),0),2) AS qualified_rate_pct
FROM cohort c LEFT JOIN qualified q USING(lead_id);
-- Study task completion among active date rows:
SELECT ROUND(100.0*SUM(tasks_completed)/NULLIF(SUM(tasks_due),0),2) AS task_completion_pct
FROM student_daily WHERE activity_date BETWEEN :start_date AND :end_date;
-- Ad CTR and cost per qualified lead should use SUM(clicks)/SUM(impressions)
-- and SUM(spend)/COUNT(DISTINCT qualified lead_id) at agreed attribution grain.
