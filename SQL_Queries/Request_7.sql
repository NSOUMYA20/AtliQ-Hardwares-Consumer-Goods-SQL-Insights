/*Get the complete report of the Gross sales amount for the customer  “Atliq Exclusive”  for each month. 
This analysis helps to  get an idea of low and high-performing months and take strategic decisions. 
The final report contains these columns: Month, Year, Gross sales Amount*/ 
 SELECT 
	MONTHNAME(s.date) AS Month, 
    s.fiscal_year, 
    ROUND(SUM(s.sold_quantity * gp.gross_price),2) AS Gross_sales_Amount
 FROM fact_sales_monthly s
 JOIN fact_gross_price gp
	ON s.product_code = gp.product_code
 JOIN dim_customer c
    ON c.customer_code = s.customer_code
 WHERE c.customer = 'Atliq Exclusive' 
 GROUP BY s.fiscal_year, MONTH(s.date), MONTHNAME(s.date); 

