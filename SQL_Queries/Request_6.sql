/*Generate a report which contains the top 5 customers who received an average high  pre_invoice_discount_pct  
for the  fiscal  year 2021  and in the Indian  market. The final output contains these fields, 
customer_code, customer, average_discount_percentage */ 
 SELECT 
    c.customer_code, 
    c.customer, 
    ROUND(AVG(pid.pre_invoice_discount_pct),4) AS average_discount_percentage
 FROM dim_customer c
 JOIN fact_pre_invoice_deductions pid
 ON c.customer_code = pid.customer_code
 WHERE pid.fiscal_year=2021 AND c.market= 'India'
 GROUP BY c.customer_code, c.customer
 ORDER BY average_discount_percentage DESC 
 LIMIT 5;