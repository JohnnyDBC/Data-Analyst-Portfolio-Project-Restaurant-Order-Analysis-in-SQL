USE restaurant_db;
-- 1. Combine the mennu_items and order_details tables into a single table.
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT *
FROM order_details od LEFT JOIN menu_items mi
	ON od.items_id = mi.menu_item_id;
    
-- 2. What were the least and most ordered items? What categories were they in?
SELECT item_name, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.items_id = mi.menu_item_id
GROUP BY item_name
ORDER BY num_puchases;

SELECT item_name, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.items_id = mi.menu_item_id
GROUP BY item_name
ORDER BY num_puchases DESC;

SELECT item_name, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.items_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_puchases;

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;

-- 4. View the details o the highest spend order. What insights can you gather from your findings?
SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.items_id = mi.menu_item_id
WHERE order_id = 440
GROUP by category;

-- 5. 
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.items_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP by order_id, category;

'440',	'192.15'
'2075', '191.05'
'1957', '190.10'
'330',	'189.70'
'2675', '185.10'