-- task_2.sql

USE alx_book_store;

CREATE TABLE IF NOT EXISTS Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Bio TEXT
);

CREATE TABLE IF NOT EXISTS Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(130) NOT NULL,
    AuthorID INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE IF NOT EXISTS Order_Details (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert sample data
INSERT INTO Authors (Name, Bio) VALUES ('George Orwell', 'Author of dystopian novels.');
INSERT INTO Books (Title, AuthorID, Price) VALUES ('1984', 1, 9.99);
INSERT INTO Customers (Name, Email, Address, Phone) VALUES ('Alice Smith', 'alice@example.com', '123 Main St', '1234567890');
INSERT INTO Orders (CustomerID, OrderDate) VALUES (1, '2025-08-20');
INSERT INTO Order_Details (OrderID, BookID, Quantity) VALUES (1, 1, 2);
