#!/usr/bin/python3
"""
MySQLServer.py
Script to create database 'alx_book_store' in MySQL server
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    connection = None
    try:
        # Connect to MySQL Server
        connection = mysql.connector.connect(
            host="localhost",
            user="root",               # change if your username is different
            password="sosnagemechu1"  # replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        if connection is not None and connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_database()
