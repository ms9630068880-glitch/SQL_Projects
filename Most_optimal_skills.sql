WITH job_count AS (
    SELECT
        sd.skill_id,
        COUNT(jpf.job_id) AS job_count,
        sd.skills

    FROM job_postings_fact AS jpf

    INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id

    INNER JOIN skills_dim AS sd
        ON sjd.skill_id = sd.skill_id

    WHERE
        salary_year_avg IS NOT NULL
        AND jpf.job_title_short = 'Data Analyst'

    GROUP BY
        sd.skills,
        sd.skill_id
),

avg_salary AS (
    SELECT
        ROUND(AVG(salary_year_avg), 0) AS avg_salary,
        sd.skill_id

    FROM job_postings_fact AS jpf

    INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id

    INNER JOIN skills_dim AS sd
        ON sjd.skill_id = sd.skill_id

    WHERE
        jpf.job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL

    GROUP BY sd.skill_id
)

SELECT
    avg_salary.*,
    job_count.*

FROM avg_salary

INNER JOIN job_count
    ON avg_salary.skill_id = job_count.skill_id;
