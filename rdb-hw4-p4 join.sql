USE hw03;

-- 4.1 COUNT
SELECT COUNT(*) AS total_rows
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id;

-- 4.2 LEFT/RIGHT JOIN
SELECT COUNT(*) AS total_rows
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
LEFT JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
LEFT JOIN suppliers ON products.supplier_id = suppliers.id;

-- 4.3 employee_id > 3 AND ≤ 10
SELECT *
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
WHERE employees.employee_id > 3 AND employees.employee_id <= 10;

-- 4.4  GROUP BY
SELECT 
    categories.name AS category_name,
    COUNT(*) AS row_count,
    AVG(order_details.quantity) AS avg_quantity
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
GROUP BY categories.name;

-- 4.5 HAVING avg_quantity > 21
SELECT 
    categories.name AS category_name,
    COUNT(*) AS row_count,
    AVG(order_details.quantity) AS avg_quantity
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
GROUP BY categories.name
HAVING avg_quantity > 21;

-- 4.6 ORDER BY
SELECT 
    categories.name AS category_name,
    COUNT(*) AS row_count,
    AVG(order_details.quantity) AS avg_quantity
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
GROUP BY categories.name
HAVING avg_quantity > 21
ORDER BY row_count DESC;

-- 4.7 
SELECT 
    categories.name AS category_name,
    COUNT(*) AS row_count,
    AVG(order_details.quantity) AS avg_quantity
FROM order_details
INNER JOIN orders ON order_details.order_id = orders.id
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN categories ON products.category_id = categories.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
GROUP BY categories.name
HAVING avg_quantity > 21
ORDER BY row_count DESC
LIMIT 4 OFFSET 1;