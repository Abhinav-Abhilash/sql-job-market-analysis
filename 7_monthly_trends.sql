SELECT
    EXTRACT(MONTH FROM job_posted_date) AS month_number,

    CASE 
        WHEN EXTRACT(MONTH FROM job_posted_date) = 1 THEN 'January'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 2 THEN 'February'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 3 THEN 'March'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 4 THEN 'April'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 5 THEN 'May'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 6 THEN 'June'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 7 THEN 'July'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 8 THEN 'August'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 9 THEN 'September'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 10 THEN 'October'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 11 THEN 'November'
        WHEN EXTRACT(MONTH FROM job_posted_date) = 12 THEN 'December'
    END AS month_name,
COUNT(*) AS job_count 
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
  AND EXTRACT(YEAR FROM job_posted_date) = 2023

GROUP BY month_number, month_name
ORDER BY month_number;