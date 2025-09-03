/*

    Answer: What are the most optimal skills to learn(High demand AND High Paying)
        -Identify salaries with high average salaries
        -Concentrate on remote locations
        -Why?Targets skills that are high in demand but also high in average salary.

*/

WITH  high_demand_jobs AS(
    SELECT  
        skills,
        COUNT(only_skills.skill_id) as Demand_Count
    FROM    
        job_postings_fact
    INNER JOIN skills_job_dim as Skills_to_job
        ON job_postings_fact.job_id = Skills_to_job.job_id
    INNER JOIN  skills_dim as only_skills
        ON Skills_to_job.skill_id = only_skills.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND
        job_work_from_home = TRUE
    GROUP BY
        skills
    ORDER BY
        Demand_Count DESC
    LIMIT
        5
)

SELECT  
    high_demand_jobs.*
FROM
    high_demand_jobs