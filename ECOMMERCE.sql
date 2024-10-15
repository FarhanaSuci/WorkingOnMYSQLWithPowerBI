create schema ECOMMERCE;

USE ECOMMERCE;

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    join_date DATE
);

-- Insert data into the Customers table
INSERT INTO Customers (customer_id, name, country, join_date) VALUES
(1, 'Alice', 'USA', '2021-01-15'),
(2, 'Bob', 'UK', '2020-12-01'),
(3, 'Charlie', 'USA', '2022-02-20'),
(4, 'David', 'Canada', '2021-06-11'),
(5, 'Eve', 'Australia', '2023-01-25');

-- Create the Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    category VARCHAR(50)
);

-- Insert data into the Products table
INSERT INTO Products (product_id, product_name, price, category) VALUES
(101, 'Laptop', 1200, 'Electronics'),
(102, 'Smartphone', 800, 'Electronics'),
(103, 'Headphones', 100, 'Accessories'),
(104, 'Keyboard', 50, 'Accessories'),
(105, 'Monitor', 300, 'Electronics');

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert data into the Orders table
INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(1001, 1, '2021-03-10', 1300),
(1002, 2, '2020-12-15', 2000),
(1003, 3, '2022-03-05', 900),
(1004, 4, '2021-08-21', 350),
(1005, 5, '2023-02-10', 1250);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price_at_time DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert data into the OrderDetails table
INSERT INTO OrderDetails (order_id, product_id, quantity, price_at_time) VALUES
(1001, 101, 1, 1200),  -- Alice buys 1 Laptop for 1200
(1001, 103, 1, 100),   -- Alice buys 1 Headphones for 100
(1002, 102, 2, 800),   -- Bob buys 2 Smartphones each for 800
(1003, 105, 3, 300),   -- Charlie buys 3 Monitors each for 300
(1004, 104, 2, 50),    -- David buys 2 Keyboards each for 50
(1005, 101, 1, 1200),  -- Eve buys 1 Laptop for 1200
(1005, 103, 1, 50);    -- Eve buys 1 Headphones for 50