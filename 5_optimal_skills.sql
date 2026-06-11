WITH skill_data AS (
SELECT
s.skills,
COUNT(DISTINCT j.job_id) AS demand_count,
AVG(j.salary_year_avg) AS average_salary
FROM job_postings_fact j
INNER JOIN skills_job_dim sj
ON j.job_id = sj.job_id
INNER JOIN skills_dim s 
ON sj.skill_id = s.skill_id
WHERE j.job_title_short = 'Data Analyst'
AND j.salary_year_avg IS NOT NULL
GROUP BY s.skills)

SELECT 
sd.skills,
sd.demand_count,
sd.average_salary
FROM skill_data sd
WHERE demand_count >= 10
ORDER BY average_salary DESC, demand_count DESC
LIMIT 10