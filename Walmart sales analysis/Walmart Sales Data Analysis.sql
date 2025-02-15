CREATE DATABASE IF NOT EXISTS Walmartsales;

CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2)  NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6, 4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10, 2) NOT Null,
    gross_margin_pct FLOAT(11, 9),
    gross_income DECIMAL(12, 4) NOT NULL,
    rating FLOAT(2, 1)

);

---------------------------------------------------------------------------------------------------------------------------------------
-- -----------------------Feature Engineering-------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
-- time_of_day

SELECT 
    time,
    CASE 
        WHEN time >= '00:00:00' AND time < '12:00:00' THEN 'Morning'
        WHEN time >= '12:00:00' AND time < '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
 CASE 
        WHEN time >= '00:00:00' AND time < '12:00:00' THEN 'Morning'
        WHEN time >= '12:00:00' AND time < '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END
    );
    
-- day_name

SELECT 
    date,
    DAYNAME(date) AS day_name
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);

-- month_name

SELECT 
	date,
    MONTHNAME(date)
    FROM sales;
    
ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);
-- ------------------------------------------------------------------------

-- -------------------------------------------------------------------------
-- -------------------------------generic questions -------------------------
-- How many unique cities does the data have?
SELECT 
	DISTINCT city
    FROM sales;

-- IN which city is each branch?
SELECT 
	DISTINCT branch
    FROM sales;
    
SELECT
	DISTINCT city,
    branch
FROM sales;

-- ---------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------
-- -----------------------Product--------------------------------------------------------
-- How many unique product lines does the data have?
SELECT
	DISTINCT product_line
FROM sales;
-- count
SELECT
	COUNT(DISTINCT product_line)
FROM sales;

-- what is the most common payment method?
SELECT
	payment_method
FROM sales;

-- count the different payment methods
SELECT
	payment_method,
    COUNT(payment_method) AS cnt
FROM sales
GROUP BY payment_method
ORDER BY cnt DESC;

-- what is the most selling product line?
SELECT
	product_line,
    COUNT(product_line) AS cnt
FROM sales
GROUP BY product_line 
ORDER BY cnt DESC;

-- what is the total revenue by month?
SELECT
	month_name AS month,
    SUM(total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;

-- what month had the largest cogs?
SELECT
	month_name AS month,
    SUM(cogs) AS cogs
FROM sales
GROUP BY month_name
ORDER BY cogs DESC;

-- what product line had the largest revenue?
SELECT 
product_line,
SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- what is the city with the largest revenue?
SELECT
branch, 
city,
SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue DESC;

-- what product line had the largest VAT?
SELECT
	product_line,
    AVG(VAT) AS avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- which branch sold more products than average product sold?
SELECT 
	branch,
    SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING  SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- what is the most product line by gender?
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

-- what is the average rating of each product line?
SELECT 
	AVG(rating) AS avg_rating,
    product_line
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;




































































































































































