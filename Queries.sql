use CRM_system;

#1 Find all cutomers who have active tickets.
select distinct customer_id
from tickets
where status = 'open';

#2 Find customers who haven’t had any interactions.
SELECT c.customer_id, c.first_name
FROM Customers c
LEFT JOIN Interactions i ON c.customer_id = i.customer_id
WHERE i.interaction_id IS NULL;

#3 Find the top 3 employees with the highest sales.
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    SUM(s.amount) AS total_sales
FROM Employees e
JOIN  Sales s ON e.employee_id = s.employee_id
GROUP BY  e.employee_id, e.first_name, e.last_name
ORDER BY total_sales DESC
LIMIT 3;

#4 Change the email of customer ID 5 to 'newemail@example.com' and phone number to '9876543210'
UPDATE customers
SET email = 'newemail@example.com',
    phone_number = '9876543210'
WHERE customer_id = 5;

#5 Increase the amount of sales for the product 'Washing Machine' by 10%.
UPDATE sales
SET amount = amount * 1.10
WHERE product_name = 'Washing Machine';
SET SQL_SAFE_UPDATES = 0;

#6 Create a view to display open tickets with column names ticket_id, customer_name, employee_name, and status from customer and employee details tables.
CREATE VIEW open_ticket_details AS
SELECT 
    t.ticket_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    t.status
FROM tickets t
JOIN customers c ON t.customer_id = c.customer_id
JOIN interactions i ON c.customer_id = i.customer_id
JOIN employees e ON i.employee_id = e.employee_id
WHERE t.status = 'Open';

#7 Find the top-performing employee (who made the highest number of sales).
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(*) AS total_sales_count
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY total_sales_count DESC
LIMIT 1;

#8 Find the total number of employees working in each position.
select position, count(*) as total_employees
from employees
group by position;

#9 Retrieve all customers who have spent more than ₹10,000.
select c.customer_id, c.first_name, c.last_name, sum(s.amount) as total_spent
from customers c
join sales s on c.customer_id = s.customer_id
group  by c.customer_id, c.first_name, c.last_name
having total_spent > 10000;

#10  Retrieve all customers who have made at least one purchase.
select distinct c. customer_id, c.first_name, c.last_name 
from customers c
join sales s on c.customer_id = s.customer_id;