SELECT
    job_title_short,
    c.name AS company_name,
    salary_year_avg,
    (SELECT ROUND(AVG(salary_year_avg),0)
    FROM job_postings_fact
    WHERE salary_year_avg IS NOT NULL) AS overall_salary
FROM job_postings_fact j
INNER JOIN company_dim c
ON j.company_id = c.company_id
WHERE salary_year_avg > 
    (SELECT ROUND(AVG(salary_year_avg),0)
    FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL)
AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC
