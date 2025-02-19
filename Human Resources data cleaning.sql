SELECT * FROM hr.`human resources`;

USE hr;

SELECT * FROM hr;
-- ------------------------------------------------------------------------------
-- --------------data cleaning-------------------------------------------------

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE hr;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;
SELECT birthdate FROM hr;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END
;

SELECT hire_date FROM hr;
UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END
;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;


SELECT termdate 
FROM hr 
WHERE termdate = '' OR termdate IS NULL;
UPDATE hr 
SET termdate = NULL 
WHERE termdate = '';
SELECT termdate FROM hr WHERE termdate = '';
ALTER TABLE hr MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR,birthdate, CURDATE());

SELECT birthdate,age FROM hr;
SELECT
	MIN(age) AS youngest,
    MAX(age) AS oldest
FROM hr;

SELECT COUNT(*) FROM hr WHERE age < 18;




























































































































































































