create database GenZ;
use GenZ;
drop table genz;

select * from genz_clean;

-- 1. What is the gender distribution of respondents from India?

SELECT 
    country, gender, COUNT(gender) AS Gender_distribution
FROM
    genz_clean
WHERE
    country = 'India'
GROUP BY gender; 

-- 2. What percentage of respondents from India are interested in education abroad and sponsorship?


SELECT 
    country,
    (COUNT(CASE
        WHEN `higher education` = 'Needs a Sponser' THEN 1
        ELSE NULL
    END) / COUNT(*)) * 100 AS Percentage_Needs_Sponsor,
    (COUNT(CASE
        WHEN `higher education` = 'Yes' THEN 1
        ELSE NULL
    END) / COUNT(*)) * 100 AS Percentage_Yes
FROM
    genz_clean
WHERE
    country = 'India'
GROUP BY country;


-- 3. What are the 6 top influences on career aspirations for respondents in India?

SELECT 
    country,
    `influencing factors`,
    COUNT(`influencing factors`) AS Top_influencers
FROM
    genz_clean
WHERE
    country = 'India'
GROUP BY `influencing factors`
ORDER BY Top_influencers DESC
LIMIT 6;



-- 4. How do career aspiration influences vary by gender in India?

SELECT 
    gender,
    `influencing factors`,
    COUNT(`influencing factors`) AS influencers
FROM
    genz_clean
GROUP BY gender , `influencing factors`;

-- 5. What percentage of respondents are willing to work for a company for at least 3 years?

SELECT 
    (SUM(CASE WHEN `Work for one employer for 3 years or more ?` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percent_willing_to_work
FROM 
    genz_clean;
    
-- 6. How many respondents prefer to work for socially impactful companies?

SELECT 
    `Work with Unsocial Company`,
    COUNT(`Work with Unsocial Company`) AS total_ratings_to_work_for_socially_impactful_companies,
    case when `Work with Unsocial Company` between 1 and 5 then 'Will WOrk for socially impactful comapny'
    else 'Will not work for socially impactful comapny' end as Work_preference
FROM
    genz_clean
GROUP BY `Work with Unsocial Company`
ORDER BY total_ratings_to_work_for_socially_impactful_companies;



-- 7. How does the preference for socially impactful companies vary by gender?


SELECT gender,
    `Work with Unsocial Company`,
    COUNT(`Work with Unsocial Company`) AS total_ratings_to_work_for_socially_impactful_companies,
    case when `Work with Unsocial Company` between 1 and 5 then 'Will WOrk for socially impactful comapny'
    else 'Will not work for socially impactful comapny' end as Work_preference
FROM
    genz_clean
GROUP BY gender, `Work with Unsocial Company`
ORDER BY total_ratings_to_work_for_socially_impactful_companies;

-- 8. What is the distribution of minimum expected salary in the first three years among respondents?

SELECT 
    `Expected Monthly Salary for First 3 Years`,
    COUNT(`Expected Monthly Salary for First 3 Years`) AS monthly_salary_for_first_three_years
FROM
    genz_clean
GROUP BY `Expected Monthly Salary for First 3 Years`;

-- 9. What is the expected minimum monthly salary in hand?

SELECT 
    MIN(`Fresher Monthly Salary`) AS Minimum_Fresher_Salary
FROM 
    genz_clean;
    
    
-- 10. What percentage of respondents prefer remote working?


SELECT 'Fully remote' as `work environment`,
    (COUNT(CASE WHEN `work environment` = 'Fully Remote' THEN 1 ELSE NULL END) / COUNT(*)) * 100 AS Percentage_Fully_Remote
FROM 
    genz_clean;

-- 11. What is the preferred number of daily work hours?

SELECT 
    `everyday working hours`,
    COUNT(`everyday working hours`) AS daily_workin_hours
FROM
    genz_clean
GROUP BY `everyday working hours`;


-- 12. What are the common work frustrations among respondents?

SELECT 
    `Frustration at work ?`,
    COUNT(`Frustration at work ?`) AS common_work_frustations
FROM
    genz_clean
GROUP BY `Frustration at work ?`;

-- 13. How does the need for work-life balance interventions vary by gender?

SELECT 
    gender, 
    `break to stay healthy`, 
    COUNT(*) AS count
FROM 
    genz_clean
GROUP BY 
    gender, 
    `break to stay healthy`
ORDER BY 
    gender, 
    `break to stay healthy`;

-- 14. How many respondents are willing to work under an abusive manager?

SELECT 
    `Work at Toxic Workspace`,
    COUNT(`Work at Toxic Workspace`) AS willing_to_work_under_abusive_manager
FROM
    genz_clean
GROUP BY `Work at Toxic Workspace`;

-- 15. What is the distribution of minimum expected salary after five years?

SELECT 
    `Expected Monthly Salary for First 5 Years`,
    COUNT(`Expected Monthly Salary for First 5 Years`) AS salary_after_5_years
FROM
    genz_clean
GROUP BY `Expected Monthly Salary for First 5 Years`;

-- 16. What are the remote working preferences by gender?

SELECT 
    gender, COUNT(gender) AS total_gender, `work environment`
FROM
    genz_clean
WHERE
    `work environment` = 'Fully remote'
GROUP BY gender , `work environment`;

-- 17. What are the top work frustrations for each gender?

SELECT 
    gender,
    `Frustration at work ?`,
    COUNT(`Frustration at work ?`) AS work_frustations
FROM
    genz_clean
GROUP BY gender , `Frustration at work ?`;

-- 18. What factors boost work happiness and productivity for respondents?

SELECT 
    `Happier and productive at work`,
    COUNT(`Happier and productive at work`) AS factors_boosting_work_happiness_and_productivity
FROM
    genz_clean
GROUP BY `Happier and productive at work`;

-- 19. What percentage of respondents need sponsorship for education abroad?

SELECT country,
    (COUNT(CASE
        WHEN `higher education` = 'Needs a Sponser' THEN 1
        ELSE NULL
    END) / COUNT(*)) * 100 AS Percentage_interested
FROM
    genz_clean
WHERE
    country = 'India';