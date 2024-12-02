-- Ecommerce Customer behavior analysis

SELECT *
FROM ecommerce2024;



SELECT (`Gender`) AS Gender, `City`, `Membership Type`, `Satisfaction level`
FROM ecommerce2024
WHERE `satisfaction level` LIKE 'Satis%' AND `Membership Type` LIKE 'Gold'
;

SELECT gender, COUNT(*) AS satisfied_count
FROM ecommerce2024
WHERE `satisfaction level` = 'Satisfied' AND `Membership Type` LIKE 'Gold'
GROUP BY gender;


SELECT City, COUNT(*) AS satisfied_count
FROM ecommerce2024
WHERE`Membership Type` LIKE 'Gold'
GROUP BY City
;



SELECT city, AVG(`Average Rating`) AS avg_satisfaction
FROM ecommerce2024
GROUP BY city
ORDER BY avg_satisfaction DESC;




SELECT *
FROM ecommerce2024;


SELECT `Customer ID`, Gender,`Items Purchased`, `Total Spend`
FROM ecommerce2024
WHERE `Discount Applied` = 'TRUE'
GROUP BY  `Customer ID`,Gender, `Items Purchased`,`Total Spend`
ORDER BY `Items Purchased` DESC
LIMIT 10 ;


SELECT Gender, AVG(`age`) AS Avg_age, AVG(`Items Purchased`) AS Avg_purchase
FROM ecommerce2024
GROUP BY Gender;


SELECT `City`, SUM(`Items purchased`) AS Total_purchases, COUNT(*) AS Unsatisfied_clients
FROM ecommerce2024
WHERE `satisfaction level` LIKE 'Unsa%'
GROUP BY `city` ;


SELECT *
FROM ecommerce2024
WHERE `Items Purchased` <= 10 AND `Days Since Last Purchase` >10
ORDER BY `Days Since Last Purchase` DESC;



SELECT Gender, AVG(`Age`) AS Avg_age
FROM ecommerce2024
GROUP BY Gender;


SELECT COUNT(*) AS Unsatisfied_female_Customers, AVG(age)
FROM ecommerce2024
WHERE `gender` LIKE 'Female' AND `satisfaction level` LIKE 'Unsatis%'
GROUP BY gender ;

SELECT gender, AVG(age)
FROM ecommerce2024
WHERE `satisfaction level` LIKE 'Unsatis%'
GROUP BY gender ;


SELECT gender, SUM(`Total Spend`) AS Total_spend
FROM ecommerce2024
WHERE `satisfaction level` LIKE 'Unsatis%'
GROUP BY gender;


SELECT *
FROM ecommerce2024;

SELECT *
FROM ecommerce2024 
WHERE `Discount Applied` LIKE 'TRUE' AND `Days since last purchase` >20
ORDER BY `Days since last purchase` DESC;

SELECT *
FROM ecommerce2024 
WHERE `Discount Applied` LIKE 'FALSE' AND `Days since last purchase` >20
ORDER BY `Days since last purchase` DESC;


SELECT gender, AVG(`Average Rating`) AS Avg_rating
FROM ecommerce2024 
GROUP BY gender;



SELECT `Customer ID`, 
Gender,
City,
`Satisfaction level`,
CASE 
  WHEN `Discount Applied` LIKE 'FALSE' AND `Satisfaction level` LIKE 'Neutral%' THEN 'Send Discount'
  WHEN `Discount Applied` LIKE 'TRUE' AND `Satisfaction level` LIKE 'Unsatis%' THEN 'Send Discount'
  WHEN `Discount Applied` LIKE 'FALSE' AND `Satisfaction level` LIKE 'Satisfied' THEN 'loyal customers'
END AS Type_Customers
FROM ecommerce2024;



SELECT `Customer ID`, 
City,
`Satisfaction level`,
`Membership Type`,
CASE 
  WHEN City LIKE 'Chicago' AND `Satisfaction level` LIKE 'Unsatisfied' THEN 'Send Survey'
  WHEN City LIKE 'Miami'  AND `Satisfaction level` LIKE 'Unsatis%' THEN 'Send Survey'
  WHEN City LIKE 'Houston' AND `Satisfaction level` LIKE 'Neutral' THEN 'Send Survey'
END AS Customer_Retention
FROM ecommerce2024;

SELECT `Customer ID`, Gender, Age, City,
CASE 
    WHEN `membership type` LIKE 'Gold' AND gender LIKE 'Female' THEN 'Send Gift'
	WHEN `membership type` LIKE 'Gold' AND gender LIKE 'Male' THEN 'Send Merch'
END AS Loyal_customers,
CASE 

	WHEN City LIKE 'New York' THEN 'Send party invite'
    WHEN City LIKE 'Los Angeles' THEN 'Send beachparty invite'

END AS Guests_events2024
FROM ecommerce2024;


SELECT `Customer ID`, `Total Spend`,
(SELECT AVG(`Total Spend`) 
FROM ecommerce2024) AS Avg_Spend
FROM ecommerce2024;



SELECT `Customer ID`, `Total Spend`,
CASE
		WHEN `Total Spend` <= 600 THEN 'Low Spend behavior'
		WHEN `Total Spend` BETWEEN 600 AND 846 THEN 'Avg Spend behavior'
        WHEN `Total Spend` > 846 THEN 'High Spend behavior'
END AS Customer_behavior
FROM ecommerce2024
ORDER BY `Total spend` DESC;