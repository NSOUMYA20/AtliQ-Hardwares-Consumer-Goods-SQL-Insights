/* Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
The final output contains these fields:segment, product_count_2020, product_count_2021 and difference*/ 
 WITH unique_products_2020 AS(
 SELECT p.segment, COUNT(DISTINCT p.product_code) AS product_count_2020
 FROM dim_product p
 JOIN fact_sales_monthly s
 ON p.product_code = s.product_code
 WHERE s.fiscal_year =2020
 GROUP BY segment),
 unique_products_2021 AS(
 SELECT p.segment, COUNT(DISTINCT p.product_code) AS product_count_2021
 FROM dim_product p
 JOIN fact_sales_monthly s
 ON p.product_code = s.product_code
 WHERE s.fiscal_year =2021
 GROUP BY segment)
 SELECT U21.segment, U20.product_count_2020, U21.product_count_2021,
 (U21.product_count_2021 - U20.product_count_2020) AS unique_product_diff_21_20
 FROM unique_products_2020 U20
 JOIN unique_products_2021 U21
 ON U20.segment = U21.segment
 ORDER BY unique_product_diff_21_20 DESC;