SELECT 
    sd.skills,
    ROUND(sum(jpf.salary_year_avg), 0) AS total_salary,
    count(jpf.job_id) as job_count  

FROM job_postings_fact AS jpf

INNER JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id

INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id

WHERE 
    jpf.salary_year_avg IS NOT NULL
    AND jpf.job_country = 'India'
    AND jpf.job_title_short = 'Data Engineer'

GROUP BY 
    sd.skills

ORDER BY 
    job_count DESC

LIMIT 10;