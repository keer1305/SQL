#1. List the names of customer who placed order online and customer first name start with A. Show the last name in ascending order.

SELECT CustomerFirstName, CustomerLastName
FROM Customer c 
JOIN `Order` o ON o.Customer_Customer_ID = c.Customer_ID
WHERE Mode_of_purchase = 'Online' AND CustomerFirstName LIKE 'A%'
ORDER BY CustomerLastName;

#2 What is the name of the customer that had an appointment on 2024-04-10 and placed an order on the same day. 

SELECT CustomerFirstName, CustomerLastName
FROM Customer c 
INNER JOIN `Order` o ON o.Customer_Customer_ID = c.Customer_ID
INNER JOIN Appointment a ON a.Customer_Customer_ID=c.Customer_ID
WHERE a.Date = '2024-04-10' AND `Order_date`="2024-04-10";

#3. Which products had a total quantity ordered greater than 5? List the product ID, product name, and total quantity starting with the highest total quantity orederd.

SELECT Product_Product_ID, Product_name, sum(Order_Quantity) AS TotalQty  
FROM `Order Details` d INNER JOIN Product p ON p.Product_ID = d.Product_Product_ID
GROUP BY Product_Product_ID, Product_name
HAVING sum(Order_Quantity) > 5
ORDER BY 1 desc;

#4 what is the average price per product 

select avg(Price) as AveragePrice,Product_name from Product 
group by Product_name;


#5 employees who are not engaged in service

select Employee_ID, EmployeeFirstName, EmployeeLastName, Service_ID
from Employee e
left join Service s on e.Employee_ID = s.Employee_Employee_ID
where s.Employee_Employee_ID is null;

#6 Monthly Revenue Trend - Showcases time-based trend analysis.
SELECT 
    DATE_FORMAT(o.Order_date, '%Y-%m') AS Month,
    SUM(p.Price * od.Order_Quantity) AS Total_Revenue
FROM 
    Order o
JOIN Order_Details od ON o.Order_ID = od.Order_Order_ID
JOIN Product p ON od.Product_Product_ID = p.Product_ID
GROUP BY Month
ORDER BY Month;

#7 High-Traffic Appointment Hours - Optimize staffing and promotions by identifying peak times for appointments.
SELECT 
    HOUR(Time) AS Appointment_Hour,
    COUNT(*) AS Appointment_Count
FROM Appointment
GROUP BY Appointment_Hour
ORDER BY Appointment_Count DESC;

#8 Sales by Location - Identify which store locations are generating the most revenue.
SELECT 
    sl.Address AS Store_Location,
    SUM(p.Price * od.Order_Quantity) AS Store_Revenue
FROM 
    Order o
JOIN Order_Details od ON o.Order_ID = od.Order_Order_ID
JOIN Product p ON od.Product_Product_ID = p.Product_ID
JOIN Product_Store ps ON p.Product_ID = ps.Product_Product_ID
JOIN Store_Location sl ON ps.Store_Location_StoreID = sl.StoreID
GROUP BY sl.Address
ORDER BY Store_Revenue DESC;

#9 Personalized Service Insights by Gender & Age Group - Understand which services are most popular 
#across gender and age segments to help Chanel tailor luxury offerings (e.g., perfume, handbags, etc.).

SELECT 
    s.Service_name,
    c.Gender,
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(c.DateOfBirth, '%Y-%m-%d'), CURDATE()) < 25 THEN 'Under 25'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(c.DateOfBirth, '%Y-%m-%d'), CURDATE()) BETWEEN 25 AND 40 THEN '25–40'
        ELSE '40+'
    END AS Age_Group,
    COUNT(*) AS Booking_Count
FROM 
    Service_Details sd
JOIN Service s ON sd.Service_Service_ID = s.Service_ID
JOIN Customer c ON sd.Customer_Customer_ID = c.Customer_ID
GROUP BY s.Service_name, c.Gender, Age_Group
ORDER BY Booking_Count DESC;

#10  Referral Impact: How Customers Heard About Us -Track and personalize campaigns based on referral sources.

SELECT 
    c2.CustomerFirstName AS Referred_By,
    COUNT(*) AS Total_Referrals
FROM 
    Customer c1
JOIN Customer c2 ON c1.ReferredBy = c2.Customer_ID
GROUP BY c2.Customer_ID
ORDER BY Total_Referrals DESC;


