/*

    Question: What skills are required for the top-paying data analyst jobs
        -Use the top 10 highest paying data from the first inquiry
        -Add Specific Skills required for those roles
        -Why? It povides a detailed look at which high paying jobs demand certain skills, 
        helping  job seekers understand which skills to develop that align with top salaries

*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim AS company
        ON job_postings_fact.company_id = company.company_id
    WHERE job_location = 'Anywhere'
      AND job_title_short = 'Data Analyst'
      AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    only_skills.skills as Top_Skills
FROM top_paying_jobs
INNER JOIN skills_job_dim as Skills_to_job
    ON top_paying_jobs.job_id = Skills_to_job.job_id
INNER JOIN  skills_dim as only_skills
    ON Skills_to_job.skill_id = only_skills.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC
