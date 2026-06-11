WITH company_stats AS(
SELECT
    c.name AS company_name,
    COUNT(*) AS job_count,
    AVG(salary_year_avg) AS average_salary,
    MAX(salary_year_avg) AS max_salary,
    ROUND(AVG(salary_year_avg) / MAX(salary_year_avg) * 100, 1) AS salary_consistency
FROM job_postings_fact j
INNER JOIN company_dim c
ON j.company_id = c.company_id
GROUP BY c.name)
SELECT *
FROM company_stats cs
WHERE cs.job_count > 5
ORDER BY cs.average_salary DESC
LIMIT 15
