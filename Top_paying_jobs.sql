SELECT
    job_id,
    job_title_short,
    salary_year_avg

FROM job_postings_fact AS jpf

WHERE
    jpf.job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC

LIMIT 25;