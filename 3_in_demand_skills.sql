SELECT
    COUNT(j.job_id) AS job_count,
    s.skills
FROM job_postings_fact j
INNER JOIN skills_job_dim sj
ON j.job_id = sj.job_id
INNER JOIN skills_dim s
ON s.skill_id = sj.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY s.skills 
ORDER BY job_count DESC
LIMIT 10