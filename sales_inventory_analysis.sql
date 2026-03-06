-- 1. Select all data from the Customers table.
SELECT * FROM defaultdb.assignment.customers;

-- 2. Total number of products from the Products table.
SELECT COUNT(*) AS total_products FROM defaultdb.assignment.products;

-- 3. Product name and price where price > 500.
SELECT product_name, price FROM defaultdb.assignment.products WHERE price > 500;

-- 4. Average price of all products.
SELECT AVG(price) AS average_price FROM defaultdb.assignment.products;

-- 5. Total sales amount from the Sales table.
SELECT SUM(total_amount) AS total_sales_revenue FROM defaultdb.assignment.sales;

-- 6. Distinct membership statuses.
SELECT DISTINCT membership_status FROM defaultdb.assignment.customers;

-- 7. Concatenate first and last names as full_name.
SELECT first_name || ' ' || last_name AS full_name FROM defaultdb.assignment.customers;

-- 8. Products where category is Electronics.
SELECT * FROM defaultdb.assignment.products WHERE category = 'Electronics';

-- 9. Highest price from the Products table.
SELECT MAX(price) AS highest_price FROM defaultdb.assignment.products;

-- 10. Number of sales (transactions) for each product.
SELECT product_id, COUNT(*) AS number_of_sales 
FROM defaultdb.assignment.sales 
GROUP BY product_id;

-- 11. Total quantity sold for each product.
SELECT product_id, SUM(quantity_sold) AS total_quantity_sold 
FROM defaultdb.assignment.sales 
GROUP BY product_id;

-- 12. Lowest price of products.
SELECT MIN(price) AS lowest_price FROM defaultdb.assignment.products;

-- 13. Customers who purchased products with a price > 1000.
SELECT DISTINCT c.* FROM defaultdb.assignment.customers c
JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
JOIN defaultdb.assignment.products p ON s.product_id = p.product_id
WHERE p.price > 1000;

-- 14. Product name and total sales amount (Revenue).
SELECT p.product_name, SUM(s.total_amount) AS total_revenue
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
GROUP BY p.product_name;

-- 15. Total amount spent by each customer.
SELECT c.customer_id, c.first_name, c.last_name, SUM(COALESCE(s.total_amount, 0)) AS total_spent
FROM defaultdb.assignment.customers c
LEFT JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 16. Customer name, product name, and quantity sold.
SELECT c.first_name, c.last_name, p.product_name, s.quantity_sold
FROM defaultdb.assignment.customers c
JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
JOIN defaultdb.assignment.products p ON s.product_id = p.product_id;

-- 17. Self-join: pairs of customers with the same membership status.
SELECT a.first_name AS customer_1, b.first_name AS customer_2, a.membership_status
FROM defaultdb.assignment.customers a
JOIN defaultdb.assignment.customers b ON a.membership_status = b.membership_status
WHERE a.customer_id < b.customer_id;

-- 18. Total number of sales (transactions) for each product.
SELECT p.product_name, COUNT(s.sale_id) AS sales_count
FROM defaultdb.assignment.products p
LEFT JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
GROUP BY p.product_name;

-- 19. Products where stock quantity < 10.
SELECT * FROM defaultdb.assignment.products WHERE stock_quantity < 10;

-- 20. Products with total quantity sold > 5.
SELECT p.product_name, SUM(s.quantity_sold) AS total_sold
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
GROUP BY p.product_name
HAVING SUM(s.quantity_sold) > 5;

-- 21. Customers who bought Electronics or Appliances.
SELECT DISTINCT c.*
FROM defaultdb.assignment.customers c
JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
JOIN defaultdb.assignment.products p ON s.product_id = p.product_id
WHERE p.category IN ('Electronics', 'Appliances');

-- 22. Total sales amount per product name.
SELECT p.product_name, SUM(s.total_amount) AS total_sales
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
GROUP BY p.product_name;

-- 23. Customers who made a purchase in 2023.
SELECT DISTINCT c.*
FROM defaultdb.assignment.customers c
JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
WHERE s.sale_date >= '2023-01-01' AND s.sale_date <= '2023-12-31';

-- 24. Customers with highest total sales in 2023.
SELECT c.customer_id, c.first_name, SUM(s.total_amount) AS total_2023_sales
FROM defaultdb.assignment.customers c
JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
WHERE s.sale_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.customer_id, c.first_name
ORDER BY total_2023_sales DESC;

-- 25. Most expensive product sold.
SELECT p.product_name, p.price
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
ORDER BY p.price DESC
LIMIT 1;

-- 26. Number of customers who purchased products worth > 500.
SELECT COUNT(DISTINCT customer_id) AS high_value_customers
FROM defaultdb.assignment.sales 
WHERE total_amount > 500;

-- 27. Total number of sales made by Gold members.
SELECT COUNT(s.sale_id) AS gold_sales_count
FROM defaultdb.assignment.sales s
JOIN defaultdb.assignment.customers c ON s.customer_id = c.customer_id
WHERE c.membership_status = 'Gold';

-- 28. Products in inventory with low stock (< 10).
SELECT p.product_name, i.stock_quantity
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.inventory i ON p.product_id = i.product_id
WHERE i.stock_quantity < 10;

-- 29. Customers who bought > 5 total products.
SELECT c.first_name, c.last_name, SUM(s.quantity_sold) AS total_qty
FROM defaultdb.assignment.customers c
JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(s.quantity_sold) > 5;

-- 30. Average quantity sold per product.
SELECT product_id, AVG(quantity_sold) AS avg_qty_sold
FROM defaultdb.assignment.sales
GROUP BY product_id;

-- 31. Number of sales in December 2023.
SELECT COUNT(*) AS dec_2023_sales
FROM defaultdb.assignment.sales 
WHERE sale_date >= '2023-12-01' AND sale_date <= '2023-12-31';

-- 32. Total spent by each customer in 2023 (sorted by price).
SELECT c.first_name, SUM(s.total_amount) AS total_spent
FROM defaultdb.assignment.customers c
JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
WHERE s.sale_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.customer_id, c.first_name
ORDER BY total_spent DESC;

-- 33. Products sold but < 5 units left in stock.
SELECT p.product_name, i.stock_quantity
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.inventory i ON p.product_id = i.product_id
JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
WHERE i.stock_quantity < 5
GROUP BY p.product_name, i.stock_quantity;

-- 34. Total sales for each product ordered by highest sales.
SELECT p.product_name, SUM(s.total_amount) AS total_sales
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

-- 35. Customers who bought products within 7 days of registration.
SELECT DISTINCT c.first_name, c.last_name
FROM defaultdb.assignment.customers c
JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
WHERE s.sale_date <= (c.registration_date + INTERVAL '7 days');

-- 36. Sales and Products filter by price 100-500.
SELECT s.*, p.product_name, p.price
FROM defaultdb.assignment.sales s
JOIN defaultdb.assignment.products p ON s.product_id = p.product_id
WHERE p.price BETWEEN 100 AND 500;

-- 37. Most frequent customer.
SELECT customer_id, COUNT(*) AS purchase_count
FROM defaultdb.assignment.sales
GROUP BY customer_id
ORDER BY purchase_count DESC
LIMIT 1;

-- 38. Total quantity of products sold per customer.
SELECT customer_id, SUM(quantity_sold) AS total_qty
FROM defaultdb.assignment.sales
GROUP BY customer_id;

-- 39. Products with highest and lowest stock together.
(SELECT product_name, stock_quantity, 'Highest' AS status FROM defaultdb.assignment.products ORDER BY stock_quantity DESC LIMIT 1)
UNION ALL
(SELECT product_name, stock_quantity, 'Lowest' AS status FROM defaultdb.assignment.products ORDER BY stock_quantity ASC LIMIT 1);

-- 40. Products containing Phone and their total sales.
SELECT p.product_name, SUM(COALESCE(s.total_amount, 0)) AS total_sales
FROM defaultdb.assignment.products p
LEFT JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
WHERE p.product_name LIKE '%Phone%'
GROUP BY p.product_name;

-- 41. Total sales and product names for Gold members.
SELECT p.product_name, SUM(s.total_amount) AS total_sales
FROM defaultdb.assignment.sales s
JOIN defaultdb.assignment.customers c ON s.customer_id = c.customer_id
JOIN defaultdb.assignment.products p ON s.product_id = p.product_id
WHERE c.membership_status = 'Gold'
GROUP BY p.product_name;

-- 42. Total sales by category.
SELECT p.category, SUM(s.total_amount) AS total_sales
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
GROUP BY p.category;

-- 43. Total sales per product grouped by month and year.
SELECT p.product_name, 
       EXTRACT(YEAR FROM s.sale_date) AS sale_year, 
       EXTRACT(MONTH FROM s.sale_date) AS sale_month, 
       SUM(s.total_amount) AS monthly_sales
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
GROUP BY p.product_name, sale_year, sale_month;

-- 44. Sold products that still have stock remaining.
SELECT DISTINCT p.product_name, i.stock_quantity
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
JOIN defaultdb.assignment.inventory i ON p.product_id = i.product_id
WHERE i.stock_quantity > 0;

-- 45. Top 5 customers by highest purchase amount.
SELECT c.first_name, c.last_name, SUM(s.total_amount) AS total_spent
FROM defaultdb.assignment.customers c
JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

-- 46. Total number of unique products sold in 2023.
SELECT COUNT(DISTINCT product_id) AS unique_products_sold_2023
FROM defaultdb.assignment.sales 
WHERE sale_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 47. Products not sold in the last 6 months.
SELECT product_id, product_name 
FROM defaultdb.assignment.products
WHERE product_id NOT IN (
    SELECT product_id 
    FROM defaultdb.assignment.sales 
    WHERE sale_date >= CURRENT_DATE - INTERVAL '6 months'
);

-- 48. Products priced $200-$800 and total quantity sold.
SELECT p.product_name, SUM(COALESCE(s.quantity_sold, 0)) AS total_qty
FROM defaultdb.assignment.products p
LEFT JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
WHERE p.price BETWEEN 200 AND 800
GROUP BY p.product_name;

-- 49. Customers who spent the most in 2023.
SELECT c.first_name, c.last_name, SUM(s.total_amount) AS total_2023
FROM defaultdb.assignment.customers c
JOIN defaultdb.assignment.sales s ON c.customer_id = s.customer_id
WHERE s.sale_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_2023 DESC
LIMIT 1;

-- 50. Products sold > 100 times (total quantity) and price > 200.
SELECT p.product_name, SUM(s.quantity_sold) AS total_qty
FROM defaultdb.assignment.products p
JOIN defaultdb.assignment.sales s ON p.product_id = s.product_id
WHERE p.price > 200
GROUP BY p.product_name
HAVING SUM(s.quantity_sold) > 100;