/* Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? 
The final output contains these fields: channel, gross_sales_mln and percentage*/ 
 WITH channelwise_gross_sales AS (
 SELECT 
    c.channel, 
	ROUND(SUM(s.sold_quantity*gp.gross_price)/1000000,2) AS gross_sales_mln
 FROM fact_sales_monthly s 
 JOIN fact_gross_price gp
 ON s.product_code = gp.product_code
 JOIN dim_customer c
 ON s.customer_code = c.customer_code
 WHERE s.fiscal_year = 2021
 GROUP BY c.channel) 
 SELECT 
    channel, gross_sales_mln, 
    ROUND(gross_sales_mln*100/SUM(gross_sales_mln) OVER(),2) AS percentage
 FROM channelwise_gross_sales
 ORDER BY percentage DESC;