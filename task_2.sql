-- task_2.sql

USE alx_book_store;

CREATE TABLE IF NOT EXISTS authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    bio TEXT
);

CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Insert sample data
INSERT INTO authors (author_name, bio) VALUES
('George Orwell', 'Author of dystopian classics'),
('Jane Austen', 'Author of romantic novels');

INSERT INTO books (title, author_id, price) VALUES
('1984', 1, 9.99),
('Pride and Prejudice', 2, 12.50);

INSERT INTO customers (customer_name, email, address, phone) VALUES
('Alice Smith', 'alice@example.com', '123 Main St', '1234567890'),
('Bob Johnson', 'bob@example.com', '456 Elm St', '0987654321');

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-08-20'),
(2, '2025-08-21');

INSERT INTO order_details (order_id, book_id, quantity) VALUES
(1, 1, 2),
(2, 2, 1);
