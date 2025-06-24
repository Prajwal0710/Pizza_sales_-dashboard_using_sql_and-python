SELECT * FROM pizza_sales;

SELECT pizza_id,pizza_name_id, quantity FROM pizza_sales
WHERE quantity > 1;

SELECT pizza_size, COUNT(*) AS total_orders, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_size
ORDER BY total_quantity DESC;

SELECT pizza_category, COUNT(order_id) AS Total_orders FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_name , SUM(unit_price)  AS Total_unit_price, sum(total_price) AS Total_price
FROM pizza_sales 
GROUP BY pizza_name;

SELECT SUM(total_price)/ COUNT(DISTINCT order_id)  AS AVerge_order_value FROM pizza_sales;

SELECT SUM(quantity) AS total_quantity FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Toatl_orders FROM pizza_sales;

SELECT DATENAME(DW,order_date) AS Order_day ,COUNT(DISTINCT order_id)
FROM pizza_sales
GROUP BY DATENAME(DW,order_date);

SELECT DATENAME(MONTH,order_date) AS Order_day ,COUNT(DISTINCT order_id) AS TOTAL_order
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date);

SELECT DISTINCT pizza_category, SUM(total_price) *100 / (SELECT SUM(total_price) FROM pizza_sales ) AS percenatge,SUM(total_price) AS Total_price
FROM pizza_sales
WHERE MONTH(order_id) =3
GROUP BY pizza_category;

SELECT DISTINCT pizza_size, CAST(SUM(total_price) *100 / (SELECT SUM(total_price) FROM pizza_sales )AS DECIMAL(10,2)) AS percenatge,CAST(SUM(total_price)AS DECIMAL(10,2)) AS Total_price
FROM pizza_sales
WHERE MONTH(order_id) =3
GROUP BY pizza_size;

SELECT TOP 5 pizza_name ,SUM(total_price) AS Total_price 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_price DESC;