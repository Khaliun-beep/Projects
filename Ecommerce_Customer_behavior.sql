SELECT "Customer ID", gender, age, city, "Membership Type", "Total Spend", "Items Purchased", "Average Rating", "Discount Applied", "Days Since Last Purchase", "Satisfaction Level"
FROM public.ecommerce_data;

--Customer spending segmentation: Query will categorize customers into high, medium, and low spenders based on their total spending.
SELECT 
    "Customer ID",
    CASE
        WHEN "Total Spend" > 1000 THEN 'High Spender'
        WHEN "Total Spend" BETWEEN 500 AND 1000 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS SpendCategory,
    SUM("Total Spend") AS TotalSpend
FROM public.ecommerce_data
GROUP BY "Customer ID", SpendCategory;

--Analyze the impact of discounts on spending: How discounts affect the average spend of customers.
SELECT 
    "Discount Applied",
    AVG("Total Spend") AS AvgSpend
FROM public.ecommerce_data
GROUP BY "Discount Applied";

--Find customers who haven’t purchased recently: List customers who haven’t made a purchase in the last 60 days.
SELECT 
    "Customer ID",
    "Days Since Last Purchase"
FROM public.ecommerce_data
WHERE "Days Since Last Purchase" > 60;

--Satisfaction levels by membership type: How customer satisfaction levels vary by membership type.
SELECT 
    "Membership Type",
    "Satisfaction Level",
    COUNT("Customer ID") AS CustomerCount
FROM public.ecommerce_data
GROUP BY "Membership Type", "Satisfaction Level";
--Average spending and age by city: Insights into spending patterns and average age across different cities.
SELECT 
    city,
    AVG("Total Spend") AS AvgSpend,
    AVG(age) AS AvgAge
FROM public.ecommerce_data
GROUP BY city;