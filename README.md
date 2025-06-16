BookHub SQL Mock Project – Beginner Level 

Welcome to the BookHub SQL Mock Test project! This case study simulates a real-world scenario of managing and analyzing data for an online bookstore named BookHub. The project is designed to test and strengthen your SQL skills through table creation, data insertion, and query writing.

Database Overview

BookHub tracks its operations using a structured relational database with the following 4 tables:

Authors: Information about book authors

Books: Details of books available for sale

Customers: Registered customer data

Orders: Records of book purchases

Step 1 – Table Setup

Authors

CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY,
  Name VARCHAR(100),
  Country VARCHAR(50),
  BirthYear INT
);

Books

CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100),
  AuthorID INT,
  Genre VARCHAR(50),
  Price DECIMAL(10, 2),
  Stock INT,
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

Customers

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  JoinDate DATE,
  Country VARCHAR(50)
);

Orders

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  BookID INT,
  OrderDate DATE,
  Quantity INT,
  TotalPrice DECIMAL(10, 2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

Step 2 – SQL Practice Questions Overview
Basic Queries
Display all authors.
Customers who joined after Feb 1, 2023.
All books in 'Fantasy' genre.
Total number of books in stock.
Intermediate Queries
Total revenue from all orders.
Orders placed by 'Alice Johnson'.
Book with the highest price.
Books with stock less than 50.

Joins
List all books with their author's name.
Display orders with customer name and book title.

Aggregations
Number of orders per customer.
Average price of 'Fiction' books.
Author with highest total book stock.

Filtering
Authors born before 1950.
Customers from the 'United Kingdom'.

Advanced Queries
Books that were ordered more than once.
Top-selling book by quantity.
Total stock value for each book.

Subqueries
Name of customer who placed the most expensive order.
Books that have not been ordered yet.
Sample Data Included
Sample INSERT statements for each table are provided to simulate a real dataset.
Use these SQL questions to test your foundational knowledge and become confident in:
SELECT, WHERE, GROUP BY, JOIN, and subqueries
Writing clean, optimized SQL
Understanding database relationships



