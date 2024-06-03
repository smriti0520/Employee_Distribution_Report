CREATE DATABASE projects;
USE projects;
SELECT * FROM hr;

ALTER TABLE hr
  CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE hr;

SELECT birthdate FROM hr;

SET sql_safe_updates=0;

UPDATE hr
SET birthdate= CASE
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

SELECT birthdate FROM hr;

UPDATE hr
SET hire_date= CASE
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL
END;

SELECT hire_date FROM hr;
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

SELECT termdate FROM hr;

UPDATE hr
SET termdate = NULL
WHERE termdate = '';

UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL;

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());

SELECT birthdate, age FROM hr;

SELECT 
    MIN(age) AS youngest,
    MAX(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age<18;

--
SELECT gender, count(*) AS count
FROM hr
WHERE age>=18
GROUP BY gender;

SELECT race, count(*) AS count
FROM hr
WHERE age>=18 
GROUP BY race 
ORDER BY count(*) DESC;

SELECT 
    MIN(age) AS youngest,
    MAX(age) AS oldest
FROM hr
WHERE age > 18;

SELECT 
	CASE 
    WHEN age>=18 AND age<=24 THEN '18-24'
    WHEN age>=25 AND age<=34 THEN '25-34'
    WHEN age>=35 AND age<=44 THEN '35-44'
    WHEN age>=45 AND age<=54 THEN '35-44'
    WHEN age>=55 AND age<=64 THEN '55-64'
    ELSE '65+'
END AS age_group,
count(*) AS count
FROM hr
WHERE age>=18
GROUP BY age_group
ORDER BY age_group;
    
    
SELECT 
	CASE 
    WHEN age>=18 AND age<=24 THEN '18-24'
    WHEN age>=25 AND age<=34 THEN '25-34'
    WHEN age>=35 AND age<=44 THEN '35-44'
    WHEN age>=45 AND age<=54 THEN '35-44'
    WHEN age>=55 AND age<=64 THEN '55-64'
    ELSE '65+'
END AS age_group,gender,
count(*) AS count
FROM hr
WHERE age>=18
GROUP BY age_group, gender
ORDER BY age_group, gender;

SELECT location, count(*) AS count
FROM hr
WHERE age>=18
GROUP BY location;

SELECT department, gender, count(*) AS count
FROM hr
WHERE age>=18
GROUP BY department, gender
ORDER BY department;

SELECT jobtitle, count(*) AS count
FROM hr
WHERE age>=18
GROUP BY jobtitle
ORDER BY jobtitle DESC;

SELECT location_state, count(*) AS count
FROM hr
WHERE age>=18
GROUP BY location_state
ORDER BY count DESC; 


