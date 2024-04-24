SELECT * FROM Orders
where ShipVia=3 and ShipCountry = 'Brazil';

SELECT OrderID,OrderDate FROM Orders
where ShippedDate is null; 

SELECT * FROM Employees; #(TO FIND THE EMPLOYEE Anne Dodsworth ID)

SELECT * FROM Orders
where EmployeeID=9;

SELECT * FROM Categories
where CategoryName='Meat/Poultry'; #TO KNOW THE CATEGORYID

SELECT ProductID,ProductName,QuantityPerUnit,UnitPrice FROM Products
where CategoryID=6;

select * from Products
where ProductName='Boston Crab Meat'; #(TO KNOW THE PRODUCTID)

select OrderID,Quantity from `Order Details`
where ProductID=40;

select CustomerID from Customers
where Country='USA';


