sql
--Query revenue by each product
SELECT product_name, sold, COUNT(sales.product_id), 
	(sold * COUNT(sales.product_id)) AS product_revenue
FROM products
JOIN sales
On products.product_id = sales.product_id
GROUP BY sales.product_id, product_name, sold;

