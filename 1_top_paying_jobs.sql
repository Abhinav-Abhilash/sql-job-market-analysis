SELECT
    c.name,
    job_title_short,
    salary_year_avg,
    job_location,
    job_work_from_home 
FROM job_postings_fact j
INNER JOIN company_dim c 
ON j.company_id = c.company_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10