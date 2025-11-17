/* Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
The final output contains these fields, division, product_code, product, total_sold_quantity, rank_order */ 

WITH product_sales_2021 AS(
SELECT p.division, p.product_code, p.product, 
SUM(s.sold_quantity) AS total_sold_quantity
FROM dim_product p 
JOIN fact_sales_monthly s     
ON p.product_code = s.product_code
WHERE s.fiscal_year = 2021
GROUP BY p.division, p.product_code, p.product),
ranked_products_by_division AS(
SELECT division, product_code, product, total_sold_quantity,
dense_rank() OVER(partition by division ORDER BY total_sold_quantity DESC) AS rank_order
FROM product_sales_2021) 

SELECT division, product_code, product, total_sold_quantity, rank_order
FROM ranked_products_by_division
WHERE rank_order<=3;

