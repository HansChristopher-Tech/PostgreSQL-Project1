/*
    Question: Top paying Data Analyst JObs
        - Top 10 highest paying DA jobs available remotely.
        - Must have salaries (No NUlls)
        -Highlight top paying opportunities for DA's
*/
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim as company
    ON job_postings_fact.company_id = company.company_id
WHERE
    (job_location = 'Anywhere')
    AND
    (job_title_short = 'Data Analyst') 
    AND 
    (salary_year_avg IS NOT NULL)
ORDER BY   
    salary_year_avg DESC
LIMIT 
    10

