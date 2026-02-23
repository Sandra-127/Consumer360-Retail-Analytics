Use sales;
#Count total orders from table
SELECT COUNT(*) AS Total_Orders FROM orders;

#Count total sales
SELECT SUM(orders.quantity*products.price) AS Total_sales 
from orders join products on orders.Product_ID=products.Product_ID;

#Average order value of customers
SELECT AVG(orders.quantity*products.price) AS Average_order_value 
from orders join products on orders.Product_ID=products.Product_ID;

ALTER TABLE orders ADD COLUMN Revenue DECIMAL(10,2);

UPDATE orders o join products p on o.product_id=p.product_id
SET o.Revenue=o.quantity*p.price;

#Find the top spending customer
SELECT c.Name,o.Revenue from customers c join orders o on c.Customer_ID=o.Customer_ID order by o.revenue DESC limit 10;

#Find the top  sales by cities
SELECT c.city,SUM(o.Revenue) AS Totalsales from customers c join orders o on c.Customer_ID=o.Customer_ID GROUP BY c.city order by Totalsales desc limit 10; 