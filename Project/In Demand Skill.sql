/*

    Question: Most in demand skills for DA's
        -join job postings to inner join table similar to the "Top Paying Job's Skills.sql"
        -identify the top 5 most in - demand skills
        - focus on all job postings
        -Why? Retrieves the top 5 skills witht the most demand in the job market,
        providing insights into the most valuable skills for job seekers

*/

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
    job_work_from_home = FALSE
    AND
    job_location LIKE '%Philippines%'
GROUP BY
    skills
ORDER BY
    Demand_Count DESC
LIMIT
    5