  SELECT 
        count(jpf.job_id) as job_count,
        sd.skills

     FROM     job_postings_fact AS jpf  

        INNER JOIN skills_job_dim as sjd on jpf.job_id = sjd.job_id
        INNER JOIN skills_dim as sd ON sjd.skill_id=sd.skill_id

        WHERE salary_year_avg is NOT NULL and jpf.job_title_short = 'Data Analyst' and jpf.job_country ='India'

        group by 
         sd.skills

         order by
         job_count desc

    limit 5