SELECT
    j.job_title_short,
    c.name AS company_name,
    j.salary_year_avg AS salary,
CASE
    WHEN j.salary_year_avg > 200000 THEN 'ELITE'
    WHEN j.salary_year_avg BETWEEN 100000 AND 200000 THEN 'SENIOR'
    WHEN j.salary_year_avg BETWEEN 60000 AND 99999 THEN 'MID'
    WHEN j.salary_year_avg < 60000 THEN 'ENTRY'
    ELSE 'Not Disclosed'
     END AS salary_category
FROM job_postings_fact j
INNER JOIN company_dim c
ON j.company_id = c.company_id
ORDER BY j.salary_year_avg DESC
