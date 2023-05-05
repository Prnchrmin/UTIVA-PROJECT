AZOISHI IFEANYI MIRACLE--- CAPSTONE PROJECT2--- DATA ANALYTICS

/* Sales & inventory data for a fictitious chain of toy stores in Mexico called Maven Toys,
including information about products, stores, daily sales transactions, and current
inventory levels at each location. */

-- Write queries to answer the following questions:

/*Q1. Which product categories drive the biggest profits? Is this the same across store
locations? */

-- Q1a
SELECT
	p."Product_Category",
	SUM(p."Product_Price" * s."Units") AS total_profit
FROM
	products p
INNER JOIN 
	inventory i 
ON 
	p."Product_ID" = i."Product_ID"
INNER JOIN
	sales s
ON
	i."Store_ID" = s."Store_ID"
INNER JOIN
	stores st
ON
	s."Store_ID" = st."Store_ID"
GROUP BY
	"Product_Category"
ORDER BY
	total_profit DESC;


-- Q1b
SELECT 
	"maven_toys"."Store_Location",
	"maven_toys"."Product_Category",
	MAX("total_profit") AS Maximum_Profit
FROM
	maven_toys
GROUP BY 
	"Store_Location",
	"Product_Category"
ORDER BY
	MAX("total_profit") DESC;


-- Q2. How much money is tied up in inventory at the toy stores? How long will it last?

-- Q2a

SELECT  
	SUM("total_profit") AS total_value_inventory
FROM 
	maven_toys;

	       OR

SELECT
	SUM(p."Product_Price" * i."Stock_On_Hand") AS total_value_inventory
FROM
	products p
INNER JOIN
	inventory i
ON
	p."Product_ID" = i."Product_ID";


-- Q2b

SELECT 
	SUM(i."Stock_On_Hand") / COUNT(DISTINCT s."Date") AS avg_daily_sales_volume,
    SUM(p."Product_Price" * i."Stock_On_Hand") AS total_inventory_value,
    SUM(p."Product_Price" * i."Stock_On_Hand") / (SUM(i."Stock_On_Hand") / COUNT(DISTINCT s."Date")) AS days_of_inventory
FROM 
	inventory i
JOIN
	products p
ON 
	i."Product_ID" = p."Product_ID"
JOIN 
	stores st
ON 
	i."Store_ID" = st."Store_ID"
JOIN 
	sales s
ON 
	st."Store_ID" = s."Store_ID";


-- Q3. Are sales being lost with out-of-stock products at certain locations?

SELECT 
	"Product_ID",
	"Product_Category",
	"Store_ID",
	SUM("Units") AS Quantity_Sold,
	MAX("Stock_On_Hand") AS lost_sales_Out_Of_Stock
FROM
	maven_toys
WHERE
	"Stock_On_Hand" = 0
GROUP BY
	"Product_ID",
	"Product_Category",
	"Store_ID"; 





