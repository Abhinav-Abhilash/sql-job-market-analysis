WITH top_jobs AS(
SELECT
    job_id,
    c.name AS company_name,
    job_title_short,
    salary_year_avg,
    job_location,
    job_work_from_home 
FROM job_postings_fact j
INNER JOIN company_dim c 
ON j.company_id = c.company_id
WHERE j.job_title_short = 'Data Analyst'
AND j.salary_year_avg IS NOT NULL
ORDER BY j.salary_year_avg DESC
LIMIT 10)
SELECT
    t.job_id,
    t.job_title_short,
    t.company_name,
    t.salary_year_avg,
    s.skills 
FROM top_jobs t 
INNER JOIN skills_job_dim sj ON t.job_id = sj.job_id
INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
ORDER BY t.salary_year_avg DESC
