#!/usr/bin/python3
"""
task_2.py
Create all tables for alx_book_store using Python and handle exceptions
"""

import mysql.connector
from mysql.connector import Error

def create_tables():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",          # change if needed
            password="your_password",
            database="alx_book_store"
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Authors table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS authors (
                author_id INT AUTO_INCREMENT PRIMARY KEY,
                name VARCHAR(100) NOT NULL,
                email VARCHAR(100)
            );
            """)

            # Books table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS books (
                book_id INT AUTO_INCREMENT PRIMARY KEY,
                title VARCHAR(130) NOT NULL,
                author_id INT,
                price DECIMAL(10,2),
                stock INT DEFAULT 0,
                FOREIGN KEY (author_id) REFERENCES authors(author_id)
            );
            """)

            # Customers table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS customers (
                customer_id INT AUTO_INCREMENT PRIMARY KEY,
                name VARCHAR(100) NOT NULL,
                email VARCHAR(100),
                phone VARCHAR(20)
            );
            """)

            # Orders table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS orders (
                order_id INT AUTO_INCREMENT PRIMARY KEY,
                customer_id INT,
                order_date DATE,
                total_amount DECIMAL(10,2),
                FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
            );
            """)

            # Order details table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS order_details (
                order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
                order_id INT,
                book_id INT,
                quantity INT DEFAULT 1,
                price DECIMAL(10,2),
                FOREIGN KEY (order_id) REFERENCES orders(order_id),
                FOREIGN KEY (book_id) REFERENCES books(book_id)
            );
            """)

            print("All tables created successfully!")

    except Error as e:
        print(f"Error while creating tables: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_tables()
