CREATE DATABASE ecommerce_rfm;
USE ecommerce_rfm;

SELECT count(*) FROM superstore;
SELECT COUNT(*) FROM rfm_segments;

# Overall Sales Summary
select
	count(distinct`Order ID`) as Total_Orders,
    count(distinct`Customer ID`)as Total_Customers,
    round(sum(Sales),2) as Total_Sales,
    round(sum(profit),2) as Total_profit,
    round(avg(Sales),2) as AVG_order_value
from superstore;

#Sales by Category
select
	category,
    count(distinct `Order ID`) as Total_Orders,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(sum(profit)/sum(sales)*100,2) as profit_margin
from superstore
group by category
order by total_sales desc;

#Sales by Region
select
	region,
    count(distinct `Order ID`) as Total_Orders,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(sum(profit)/sum(sales)*100,2) as profit_margin
from superstore
group by region
order by total_sales desc;

#segment
select
	segment,
    count(distinct `Order ID`) as Total_Orders,
    round(sum(sales),2) as total_sales,
    round(sum(profit),2) as total_profit,
    round(sum(profit)/sum(sales)*100,2) as profit_margin
from superstore
group by segment
order by total_sales desc;


#Top 10 Customers by Sales
SELECT 
    `Customer ID`,
    `Customer Name`,
    Segment,
    Region,
	count(distinct `Order ID`) as total_orders,
    round(sum(sales),2) as Total_sales,
    round(sum(profit),2) as total_profit
from superstore
group by `Customer ID`, `Customer Name`, Segment, Region
order by Total_sales desc
limit 10;

# Most Profitable Sub-Categories
select
	`Sub-Category`,
    Category,
	ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin
from superstore
group by `Sub-Category`, Category
order by total_profit desc
limit 10;

#loss making sub-category
select
	`Sub-Category`,
    Category,
	ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin
from superstore
group by `Sub-Category`, Category
order by total_profit asc
limit 5; 

#RFM Segment Distribution
select 
	segment,
    count(*) as total_customers,
    round(avg(recency),2) as avg_recency,
    round(avg(frequency),2) as avg_frequency,
    round(avg(monetary),2) as avg_monetary
from rfm_segments
group by segment
order by avg_monetary desc;

#Champions vs Lost Customers
SELECT 
    Segment,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Recency), 2) AS Avg_Recency,
    ROUND(AVG(Frequency), 2) AS Avg_Frequency,
    ROUND(AVG(Monetary), 2) AS Avg_Monetary
FROM rfm_segments
where segment in ('champions','lost customers')
group by segment;


#High Value At Risk Customers
SELECT 
	`Customer ID`,
    Recency,
    Frequency,
    ROUND(Monetary, 2) AS Monetary,
    Segment
FROM rfm_segments
where segment='At Risk' and Monetary> (select avg(monetary) from rfm_segments)
order by monetary desc
limit 10;

#yearly  sales growth 
SELECT 
    YEAR(`Order Date`) AS year,
    COUNT(distinct `Order ID`) AS Total_Orders,
    round(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(profit), 2) AS Total_Profit
FROM superstore
GROUP BY YEAR(`Order Date`)
order by year;

#Discount Impact on Profit
select
	case 
		when Discount = 0 THEN 'No Discount'
        when  Discount <= 0.2 THEN 'Low (0-20%)'
        WHEN Discount <= 0.4 THEN 'Medium (20-40%)'
        ELSE 'High (>40%)'
	end as discount_group,
	count(*) as total_orders,
    round(avg(sales),2) as avg_sales,
    round(avg(profit),2) as avg_profit,
    round(sum(profit),2) as total_profit
from superstore
group by discount_group
order by total_profit desc;


# ================================================
# SUPERSTORE E-COMMERCE - SQL INSIGHTS
# ================================================

# 1. Overall Summary:
# 5009 orders from 793 customers with 2.29M total sales
# and 286K total profit with 12.47% overall profit margin.

# 2. Category and Region Performance:
# Technology best margin (17.4%), Furniture worst (2.49%).
# West strongest region (14.94%), Central weakest (7.92%).

# 3. Discount Impact:
# Discounts above 20% generating negative profit of 135K.
# No discount orders alone contribute 320K profit.
# Company must cap discounts at 20% to stop revenue loss.

# 4. Loss Making Sub-Categories:
# Tables losing 17.7K and Bookcases losing 3.4K despite high sales.
# Excessive discounting on Furniture is the root cause.

# 5. RFM Customer Segments:
# 101 At Risk customers with high spend (avg 4413) gone inactive.
# Need Attention group (199 customers) largest risk to revenue.
# Immediate re-engagement needed before they become Lost Customers.

# FINAL CONCLUSION:
# Discounts above 20% and loss making Furniture sub-categories
# are the two biggest profit problems to fix immediately.
# West region and Technology are strongest — replicate their strategy.
# Re-engaging 101 At Risk high value customers is highest priority.