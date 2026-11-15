SELECT
    
    job_title_short,
    round(avg(salary_year_avg),0) AS avg_salary,
    sd.skills
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim as sjd on jpf.job_id = sjd.job_id
INNER JOIN skills_dim as sd ON sjd.skill_id=sd.skill_id
WHERE   jpf.job_title_short = 'Data Analyst'
     and salary_year_avg IS NOT NULL
     and jpf.job_country ='India'
GROUP BY
    job_title_short,
    sd.skills
ORDER BY avg_salary DESC
LIMIT 25;
            