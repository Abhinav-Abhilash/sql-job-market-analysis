SELECT 
s.skills,
ROUND(AVG(salary_year_avg),0) AS rounded_salary
FROM job_postings_fact j
INNER JOIN skills_job_dim sj
ON j.job_id = sj.job_id
INNER JOIN skills_dim s
ON sj.skill_id = s.skill_id
WHERE j.job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
GROUP BY s.skills
HAVING COUNT(DISTINCT j.job_id) >=10
ORDER BY rounded_salary DESC
LIMIT 25
