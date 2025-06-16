
-- queries to create table

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50),
    BirthYear INT
);

-- Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE,
    Country VARCHAR(50)
);

-- Orders Table
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


-- insert queries 

-- Insert data into Author
INSERT INTO Authors (AuthorID, Name, Country, BirthYear) VALUES
(1, 'J.K. Rowling', 'United Kingdom', 1965),
(2, 'George R.R. Martin', 'United States', 1948),
(3, 'Haruki Murakami', 'Japan', 1949);

-- Insert data into Books
INSERT INTO Books (BookID, Title, AuthorID, Genre, Price, Stock) VALUES
(1, 'Harry Potter and the Sorcerer''s Stone', 1, 'Fantasy', 19.99, 120),
(2, 'A Game of Thrones', 2, 'Fantasy', 24.99, 80),
(3, 'Norwegian Wood', 3, 'Fiction', 14.99, 50);

-- Insert data into Customers
INSERT INTO Customers (CustomerID, Name, Email, JoinDate, Country) VALUES
(1, 'Alice Johnson', 'alice@example.com', '2023-01-15', 'United States'),
(2, 'Bob Smith', 'bob@example.com', '2023-02-20', 'Canada'),
(3, 'Charlie Brown', 'charlie@example.com', '2023-03-05', 'United Kingdom');

-- Insert data into Orders
INSERT INTO Orders (OrderID, CustomerID, BookID, OrderDate, Quantity, TotalPrice) VALUES
(1, 1, 1, '2023-03-10', 2, 39.98),
(2, 2, 2, '2023-03-15', 1, 24.99),
(3, 3, 3, '2023-03-20', 3, 44.97);
 

--  Queries - Basic 

-- 1. Write a query to display all the authors in the database.

select name from Authors ;

-- 2. Retrieve the names and emails of all customers who joined after February 1, 2023.

select Name, Email from Customers where JoinDate>'2023-02-01';

-- 3. Find all books in the 'Fantasy' genre.

select Title from Books where Genre ="Fantasy";

-- 4. Display the total number of books available in stock.

select SUM(Stock) from Books;

-- Intermediate Queries


-- 5. Show the total revenue generated from all orders.

select SUM(TotalPrice) from Orders;


-- 6. List the details of orders placed by the customer named 'Alice Johnson.'

select Orders.CUstomerId, Name ,Email ,JoinDate , Country  from Customers LEFT JOIN Orders ON Customers.CustomerID=Orders.CustomerId;


-- 7. Identify the book with the highest price.

select MAX(Price) from Books;


-- 8. Retrieve the details of books that have less than 50 units in stock.
select * from Books where stock<50;


-- Joins


-- 9. Write a query to list all books along with their author's name.

select Name , Title from Books JOIN Authors ON Books.AuthorID=Authors.AuthorID;

-- 10. Display all orders with the customer name and book title included.

SELECT  Orders.OrderID,Orders.BookID, Orders.OrderDate,  Orders.Quantity,Orders.TotalPrice,  Customers.Name,      
Books.Title FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Books ON Orders.BookID = Books.BookID;


-- Aggregations


-- 11. Calculate the total number of orders placed by each customer.

select Name , Quantity from Orders JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
-- 12. Find the average price of books in the 'Fiction' genre.

select AVG(Price) from Books;


-- 13. Determine the author whose books have the highest combined stock.
SELECT Authors.AuthorID,Authors.Name,SUM(Books.Stock) AS TS
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID
GROUP BY Authors.AuthorID, Authors.Name
ORDER BY TS DESC
LIMIT 1;


-- Filtering

-- 14. Retrieve the names of authors born before 1950.

select Name from Authors where BirthYear<1950;

-- 15. Find all customers from the 'United Kingdom.'

Select Name from Customers where Country="United Kingdom";
-- Advanced Queries

-- 16. Write a query to list all books that have been ordered more than once.
select Title, Orders.BookID ,COUNT(OrderID) as Timesordered 
from Orders JOIN Books ON Orders.BookID=Books.BookID 
group by title,Orders.BookID 
having Timesordered>1;

-- 17. Identify the top-selling book based on the quantity sold.
Select Title ,Orders.BookID, 
SUM(Quantity) as maxsale from Orders 
JOIN Books ON Orders.BookID = Books.BookID 
group by Orders.BookID , Title 
order by maxsale DESC limit 1;

-- 18. Calculate the total stock value for each book (price * stock).
select Title, Price*Stock from Books;

-- Subqueries

-- 19. Write a query to find the name of the customer who placed the most expensive order.
select Name from Customers where CustomerID = 
(select CustomerID from Orders where TotalPrice =
(Select MAX(TotalPrice) from Orders ));

-- 20. Retrieve all books that have not been ordered yet.
SELECT Title FROM Books 
WHERE BookID NOT IN (
    SELECT BookID 
    FROM Orders
);
