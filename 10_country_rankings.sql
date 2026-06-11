WITH country_counts AS
    (SELECT 
    job_country,
    COUNT(*) AS job_count
    FROM job_postings_fact
    WHERE job_title_short = 'Data Analyst'
    GROUP BY job_country
    HAVING COUNT(*) >=5),

ranked_jobs AS
(SELECT 
    job_title_short,
    c.name AS company_name,
    job_country,
    salary_year_avg,
    DENSE_RANK() OVER(PARTITION BY job_country
    ORDER BY salary_year_avg DESC) AS salary_rank,
    AVG(salary_year_avg) OVER(PARTITION BY job_country) AS country_avg
FROM job_postings_fact j
INNER JOIN company_dim c
ON j.company_id = c.company_id
WHERE j.job_title_short = 'Data Analyst'
AND j.salary_year_avg IS NOT NULL
AND j.job_country IN (SELECT job_country FROM country_counts))

SELECT * FROM ranked_jobs
ORDER BY job_country, salary_rank
LIMIT 50
