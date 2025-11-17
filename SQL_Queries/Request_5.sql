/*Get the products that have the highest and lowest manufacturing costs. 
The final output should contain these fields:product_code, product and manufacturing_cost */ 
SELECT 
   p.product_code, 
   p.product, 
   c.manufacturing_cost AS max_min_manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost c
ON p.product_code = c.product_code
WHERE c.manufacturing_cost IN (
	(SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost),
    (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost)
    )
ORDER BY max_min_manufacturing_cost DESC; 
