-- --------------------------------------------------------------------------
-- -------------------------------------SF Salaries--------------------------
-- Show all columns and rows in the table

SELECT * FROM sf_salaries.salaries;

-- Show only the EmployeeName and JobTitle column

SELECT
	EmployeeName,
	JobTitle
 FROM sf_salaries.salaries;   
 
-- Show the number of employees in the table

SELECT
	COUNT(*)
FROM sf_salaries.salaries;
-- Show the unique job titles in the table
SELECT 
	DISTINCT JobTitle
FROM sf_salaries.salaries;

-- Show the job title and overtime pay for all empoyees with over pay greater than 50000

SELECT
	JobTitle,
    OvertimePay
FROM sf_salaries.salaries
WHERE OvertimePay > 50000
;

-- Show the average base pay for all employees

SELECT
	AVG(basepay) AS "Avg BasePay"
  FROM sf_salaries.salaries;  

-- Show the top 10 highest paid employees

SELECT
	EmployeeName,
    TotalPay
FROM sf_salaries.salaries
ORDER BY TotalPay DESC
limit 10;

-- SHow the average of BasePay, OvertimePaay and otherPay for each employee

SELECT
	EmployeeName,
    (BasePay + OvertimePay + OtherPay)/3 AS avg_bp_op_otherpay
FROM sf_salaries.salaries;

-- Show all employees who have the word "Nanager" in their job title

SELECT
	EmployeeName,
    JobTitle
FROM sf_salaries.salaries
WHERE JobTitle Like'%Manager%'
;

-- Show all employees with a job title not equal to "Manager"
SELECT
	EmployeeName,
    JobTitle
FROM sf_salaries.salaries
WHERE JobTitle !='Manager'
;

SELECT
	EmployeeName,
    JobTitle
FROM sf_salaries.salaries
WHERE JobTitle <>'Manager'
;

-- Show all employees with a total pay between 50000 and 75000
-- ---first way
SELECT
	*
FROM sf_salaries.salaries
WHERE TotalPay BETWEEN 50000 AND 75000
;
-- ----other way
SELECT
	*
FROM sf_salaries.salaries
WHERE TotalPay>= 50000 AND TotalPay<=75000
;

-- Show all employees with a basepay less than 50000 or a total pay greater than 100000

SELECT
	*
FROM sf_salaries.salaries
WHERE BasePay < 50000 AND TotalPay > 100000
;

-- Show all employees with  a total pay benefits value between 125000 and 150000 
-- and a job title containing the word "director"

SELECT
	*
FROM sf_salaries.salaries
WHERE TotalPayBenefits BETWEEN 125000 AND 150000
AND JobTitle LIKE "%Director%"
;

-- Show all employeees ordered bytheir total pay benefits in descending order
SELECT
	*
FROM sf_salaries.salaries
ORDER BY TotalPayBenefits DESC
;

-- Show all job tiltes with an average base pay of at least 100000 and 
-- order them by the avrage base pay in descending order

SELECT
	JobTitle,
    AVG(BasePay) AS avgbasepay
FROM sf_salaries.salaries
GROUP BY JobTitle
HAVING AVG(BasePay) >= 100000 
ORDER BY AVG(BasePay) DESC
;

-- Delete the notes column
SELECT * 
FROM sf_salaries.salaries
;
ALTER TABLE sf_salaries.salaries
DROP COLUMN Notes;

SELECT * 
FROM sf_salaries.salaries
;
ALTER TABLE sf_salaries.salaries
DROP COLUMN Benefits;


-- Update the basepay of all employees with the jobtitle 
-- containing "Manager" by increasing it by 10%

UPDATE sf_salaries.salaries
SET BasePay = BasePay * 1.1
WHERE JobTitle LIKE "%Manager%";
SELECT * 
FROM sf_salaries.salaries
;

-- Delete all employees who have no overtimepay

SELECT COUNT(*) 
FROM sf_salaries.salaries
WHERE OvertimePay = 0;
DELETE FROM sf_salaries.salaries

;







































































