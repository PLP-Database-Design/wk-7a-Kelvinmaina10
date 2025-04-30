-- Question 1: Achieving 1NF (First Normal Form)

-- Transforming ProductDetail table into 1NF
-- Each row will represent a single product for an order

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- The above query separates multiple products into individual rows, achieving 1NF.


-- Question 2: Achieving 2NF (Second Normal Form)

-- Transforming OrderDetails table into 2NF
-- We will create two tables to remove partial dependencies

-- 1. Create a Customer table to store unique customer information
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100)
);

-- 2. Create an Order table to store order details
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    CustomerID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Inserting unique customers into the Customer table
INSERT INTO Customer (CustomerName)
VALUES 
    ('John Doe'),
    ('Jane Smith'),
    ('Emily Clark');

-- Inserting into OrderDetails_2NF table
INSERT INTO OrderDetails_2NF (OrderID, CustomerID, Product, Quantity)
VALUES 
    (101, 1, 'Laptop', 2),
    (101, 1, 'Mouse', 1),
    (102, 2, 'Tablet', 3),
    (102, 2, 'Keyboard', 1),
    (102, 2, 'Mouse', 2),
    (103, 3, 'Phone', 1);

-- The above queries create a separate Customer table to eliminate partial dependencies, achieving 2NF.
