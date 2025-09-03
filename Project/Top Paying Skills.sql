/*

 Answer: What are the top skills based on salary?
    -Look for average salary  for data analyst positions
    -focus on roles with specified salaries, regardless of locations
    -Why? it reveals how different skills impact salary levels for DA's and help
    identify the financially awarding skills to acquire or improve

*/

SELECT  
    skills,
    ROUND(AVG(salary_year_avg),0) as Salary
FROM    
    job_postings_fact
INNER JOIN skills_job_dim as Skills_to_job
    ON job_postings_fact.job_id = Skills_to_job.job_id
INNER JOIN  skills_dim as only_skills
    ON Skills_to_job.skill_id = only_skills.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    Salary DESC
LIMIT
    25