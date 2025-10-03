-- 1. Resturants Table
DROP TABLE IF  EXISTS restaurants;
CREATE TABLE restaurants(
             restaurant_id SERIAL PRIMARY KEY,
			 restaurant_name VARCHAR (100),
			 location VARCHAR(100)
);

-- 2. Insert Sample Restaurants
INSERT INTO restaurants(restaurant_name, location)
VALUES ('Pizza Hut','Delhi'),
('Burger King','Mumbai'),
('Dominos','Banglore'),
('KFC','Hyderabad'),
('Subway','Chennai');

SELECT *FROM restaurants;

-- 3.Orders Table
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
                order_id SERIAL PRIMARY KEY, 
				customer_id INT,
				restaurant_id INT,
				order_date DATE,
				item_name VARCHAR(100),
				quantity INT,
				price NUMERIC(10,2)
);
SELECT * FROM orders;

-- 4. Insert Sample Orders
INSERT INTO orders(customer_id, restaurant_id, order_date, item_name, quantity,price)
VALUES(101,1,'2025-09-10','Veg Pizza',2,250),
(102,2,'2025-09-10','Chicken Burger',1,180),
(103,3,'2025-09-11','Chees Pizza',3,220),
(104,4,'2025-09-11','Fried Chicken',2,300),
(105,5,'2025-09-12','Veg Sub',1,150),
(106,6,'2025-09-12','Panner Pizza',1,227),
(107,7,'2025-09-13','Veg Burger',2,160),
(108,8,'2025-09-13','Peppy Panner Pizza',1,240),
(109,9,'2025-09-14','Zinger Burger',2,200),
(110,5,'2025-09-14','Chicken Sub',1,180);

-- 5. Queries
-- (a)Total Sales
SELECT SUM(quantity  * price) As total_sales FROM orders;

-- (b) Daily Sales
SELECT order_date, SUM (quantity * price) AS daily_sales
FROM orders
GROUP BY order_date
ORDER BY order_date;


-- (c) Top Restaurants by Sales
SELECT r.restaurant_name, SUM(o.quantity * o.price) AS total_sales
FROM orders o
RIGHT JOIN restaurants r ON
o.restaurant_id= r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_sales DESC
LIMIT 5;

-- (d) Most Ordered Item
SELECT item_name, SUM(quantity)AS total_quantity
FROM orders
GROUP BY item_name
ORDER BY total_quantity DESC
LIMIT 5;

-- (e) Customer Wise Spending
SELECT customer_id, SUM(quantity * price) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;
