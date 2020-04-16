-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.productname, p.categoryid, c.categoryid, c.categoryname FROM Products as p
join categories as c on c.categoryid = p.productid;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id, o.shipName FROM [Order] as o  where o.OrderDate < '2012-08-09'
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, o.Quantity FROM OrderDetail AS o JOIN Product AS p 
ON o.productid = p.id WHERE o.OrderID = '10251' ORDER BY p.productname
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.Id as "Order ID", C.CompanyName as "Ordered By", E.LastName as "Employee Name"
FROM [Order] as O
JOIN Employee as E ON O.EmployeeId = E.id
JOIN Customer as C on O.CustomerId = C.id

-- ----------stretch -----------------------------------------

--   Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT Category.CategoryName as "Category", count(*) as "Total Products"
FROM Product
JOIN Category
WHERE Product.CategoryID = Category.ID
GROUP BY Product.CategoryID

--   Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT OrderID, count(*) as "ItemCount" from OrderDetail
GROUP BY OrderID