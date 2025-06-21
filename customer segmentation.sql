-- October 2019 table
CREATE TABLE oct_clickstream_2019 (
    event_time TIMESTAMP,
    event_type VARCHAR(10),
    product_id BIGINT,
    category_id NUMERIC(20, 0),
    category_code VARCHAR(100),
    brand VARCHAR(50),
    price NUMERIC(10,2),
    user_id BIGINT,
    user_session VARCHAR(50)
);

-- November 2019 table
CREATE TABLE nov_clickstream_2019 (
    event_time TIMESTAMP,
    event_type VARCHAR(10),
    product_id BIGINT,
    category_id NUMERIC(20, 0),
    category_code VARCHAR(100),
    brand VARCHAR(50),
    price NUMERIC(10,2),
    user_id BIGINT,
    user_session VARCHAR(50)
);


SELECT * FROM nov_clickstream_2019 LIMIT 5;

SELECT * FROM oct_clickstream_2019 LIMIT 5;

SELECT COUNT(*) FROM nov_clickstream_2019; --- there is 67,501,970 rows in nov_2019

SELECT COUNT(*) FROM oct_clickstream_2019; --- there is 42,448,764 rows in oct_2019


--  Checking nulls in both tables 
-- oct_2019
SELECT 
COUNT(*) FILTER(WHERE event_time IS NULL) as null_event_time,
COUNT(*) FILTER(WHERE event_type IS NULL) as null_event_type,
COUNT(*) FILTER(WHERE product_id IS NULL) as null_product_id,
COUNT(*) FILTER(WHERE category_code IS NULL) as null_category_code,  -- there is 13,515,609 null values in category code 
COUNT(*) FILTER(WHERE brand IS NULL) as null_brand,   ---- there is 6,113,008 null values in brand.
COUNT(*) FILTER(WHERE price IS NULL) as null_price,
COUNT(*) FILTER(WHERE user_id IS NULL) as null_user_id,
COUNT(*) FILTER(WHERE user_session IS NULL) as null_user_session --- there is 2 null values in user session
FROM oct_clickstream_2019;


-- nov_2019
SELECT 
COUNT(*) FILTER(WHERE event_time IS NULL) as null_event_time,
COUNT(*) FILTER(WHERE event_type IS NULL) as null_event_type,
COUNT(*) FILTER(WHERE product_id IS NULL) as null_product_id,
COUNT(*) FILTER(WHERE category_code IS NULL) as null_category_code, --- there is 21,898,171 null values in category code 
COUNT(*) FILTER(WHERE brand IS NULL) as null_brand,   --- there is 9,218,235 null values in brand
COUNT(*) FILTER(WHERE user_id IS NULL) as null_user_id,
COUNT(*) FILTER(WHERE user_session IS NULL) as null_user_session -- there is 10 null values in user session.
FROM nov_clickstream_2019;

--- dealing with null values 


--- dealing with user sessions null values.
DELETE FROM oct_clickstream_2019 WHERE user_session IS NULL;

DELETE FROM nov_clickstream_2019 WHERE user_session IS NULL;



-- dealing with brand nulls replacing with no_brand.


--- oct_2019
UPDATE oct_clickstream_2019
SET brand = 'no_brand'
WHERE brand IS NULL;



-- nov_2019

UPDATE nov_clickstream_2019
SET brand = 'no_brand'
WHERE brand IS NULL;


--- Moving to EDA with AI Assistance 

SELECT COUNT(*) FROM oct_clickstream_2019; --- there is remaining rows are 42,448,762 in oct_2019 


SELECT COUNT(*) FROM nov_clickstream_2019;  ---- there is remaining rows are 67,501,969 in nov_2019


-- event distribution by type 
-- oct_2019
SELECT event_type, COUNT(*)
FROM oct_clickstream_2019
GROUP BY event_type
ORDER BY COUNT(*) DESC;

-- nov_2019
SELECT event_type, COUNT(*)
FROM nov_clickstream_2019
GROUP BY event_type
ORDER BY COUNT(*) DESC;



--- daily events trend 
--- oct_2019
SELECT DATE(event_time) as day, COUNT(*) as total_events
FROM oct_clickstream_2019
GROUP BY day
ORDER BY day;


--- nov_2019
SELECT DATE(event_time) as day, COUNT(*) as total_events
FROM nov_clickstream_2019
GROUP BY day
ORDER BY day;



---- Top-Level User & Product Insights

---- Top 10 Active users 
--- oct_2019

SELECT user_id, COUNT(*) as event_count
FROM oct_clickstream_2019
GROUP BY user_id
ORDER BY event_count DESC
LIMIT 10;


---- nov_2019

SELECT user_id, COUNT(*) as event_count
FROM nov_clickstream_2019
GROUP BY user_id
ORDER BY event_count DESC
LIMIT 10;


--- most used brands/categories

-- top brands 


--- oct_2019
SELECT brand,COUNT(*) as views 
FROM oct_clickstream_2019
WHERE event_type = 'view'
GROUP BY brand 
ORDER BY views DESC
LIMIT 10;

--- nov_2019

SELECT brand,COUNT(*) as views 
FROM nov_clickstream_2019
WHERE event_type = 'view'
GROUP BY brand 
ORDER BY views DESC
LIMIT 10;


---- top categories 
---- oct_2019

SELECT category_code, COUNT(*) as top_views
FROM oct_clickstream_2019
WHERE event_type = 'view'
GROUP BY category_code
ORDER BY top_views DESC
LIMIT 10;


---- nov_2019

SELECT category_code, COUNT(*) as top_views
FROM nov_clickstream_2019 
WHERE event_type = 'view'
GROUP BY category_code
ORDER BY top_views DESC 
LIMIT 10;


----- getting daily traffic trend 
--- oct_2019
SELECT DATE(event_time) as day, COUNT(*) as total_events
FROM oct_clickstream_2019
GROUP BY day
ORDER BY day;


--- nov_2019
SELECT DATE(event_time) as day, COUNT(*) as total_events
FROM nov_clickstream_2019
GROUP BY day
ORDER BY day;




--- geting event type summary 
--- oct_2019

SELECT event_type, COUNT(*) as total
FROM oct_clickstream_2019
GROUP BY event_type
ORDER BY total DESC;

--- nov_2019

SELECT event_type, COUNT(*) as total
FROM nov_clickstream_2019
GROUP BY event_type
ORDER BY total DESC;


---- top 10 brands by views 

-- oct_2019
SELECT brand, COUNT(*) as views 
FROM oct_clickstream_2019
WHERE event_type = 'view'
GROUP BY brand 
ORDER BY views DESC
LIMIT 10;

-- nov_2019
SELECT brand, COUNT(*) as views 
FROM nov_clickstream_2019
WHERE event_type = 'view'
GROUP BY brand 
ORDER BY views DESC
LIMIT 10;


---- RFM Analysis Based On user transctions/purchase 

SELECT 
user_id,
price ,
event_time:: date as purchase_date
FROM oct_clickstream_2019
WHERE event_type = 'purchase'
AND user_id IS NOT NULL
AND price IS NOT NULL
UNION ALL
SELECT 
user_id,
price,
event_time::date as purchase_date
FROM nov_clickstream_2019
WHERE event_type = 'purchase'
AND user_id IS NOT NULL
AND price IS NOT NULL;

SELECT * FROM oct_clickstream_2019;