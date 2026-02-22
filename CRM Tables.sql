create database CRM_system;

use CRM_system;

create table Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_number VARCHAR(20),
    position VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from Employees;

create table Customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone_number VARCHAR(20),
    address CHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from Customers;

create table Interactions (
	interaction_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    employee_id INT,
    interaction_type VARCHAR(30),
    notes CHAR (100),
    interaction_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

select * from Interactions;

create table Sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    employee_id INT,
    product_name VARCHAR(50),
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount FLOAT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

select * from Sales;

create table Tickets (
     ticket_id INT PRIMARY KEY AUTO_INCREMENT,
     customer_id INT,
     issue_description CHAR(100),
     status VARCHAR(30),
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     resolved_at TIMESTAMP,
     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

select * from Tickets;

show tables;
describe Tickets;

select * from sales where product_name = 'Washing Machine';