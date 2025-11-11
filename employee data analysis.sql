-- Basic Analysis Questions
-- 1. How many employees are in the dataset?
SELECT
	COUNT(EMPLOYEEID)
FROM
	USERS;

-- 2. What is the average salary of all employees?
SELECT
	ROUND(AVG(SALARY), 0)
FROM
	USERS;

-- 3. What is the minimum and maximum salary in the dataset?
SELECT
	MIN(SALARY) AS MINIMUM_SALARY,
	MAX(SALARY) AS MAXIMUM_SALARY
FROM
	USERS;

-- 4. How many male and female employees are there?
select gender , count(gender) from users
group by(gender);


-- 5. Which gender has a higher average salary?
SELECT
	GENDER,
	AVG(SALARY)
FROM
	USERS
GROUP BY
	GENDER
ORDER BY
	AVG(SALARY) DESC;


-- Date of Birth / Age Analysis
-- 6. What is the average age of employees?
SELECT
	NAME,
	DATE_OF_BIRTH,
	AGE (CURRENT_DATE, DATE_OF_BIRTH) AS AGE
FROM
	USERS;
-- 7. Who is the youngest and oldest employee?
(
    SELECT 'Oldest' AS category, name, date_of_birth,
           AGE(CURRENT_DATE, date_of_birth) AS age
    FROM users
    ORDER BY date_of_birth ASC
    LIMIT 1
)
UNION ALL
(
    SELECT 'Youngest', name, date_of_birth,
           AGE(CURRENT_DATE, date_of_birth)
    FROM users
    ORDER BY date_of_birth DESC
    LIMIT 1
);

-- 8. Group employees by decade of birth (e.g., 1980s, 1990s) — which decade has the most
-- employees?
SELECT
	NAME,
	DATE_OF_BIRTH
FROM
	USERS
WHERE
	DATE_OF_BIRTH BETWEEN '1980-01-01' AND '1990-01-01'
ORDER BY
	DATE_OF_BIRTH ASC;
-- 9. How many employees are younger than 30 years old?
select name , age(current_date, date_of_birth) from users 
where Extract(year from age(current_date,date_of_birth))<'30'
order by age desc;

-- 10. Find the correlation between employee age and salary (does salary increase with age?).
select corr(age,salary) from users ;
-- here the correlation = 0.6 this show salary increase with age .
