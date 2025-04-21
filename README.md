             <img width="269" alt="image" src="https://github.com/user-attachments/assets/a7ef3ba8-9a9d-4744-abee-d231e8aa762e" />

# 🛍️ Chanel Retail Data Management System

A SQL-based relational database system designed to simulate the operations of a luxury retail brand, focusing on customer insights, appointment scheduling, service usage, and sales analysis across multiple store locations.

---

## 📌 Project Overview

Luxury retailers like Chanel manage vast volumes of structured data—from customer profiles and product inventories to service appointments and store operations. This project creates a scalable, normalized relational database to streamline operations and uncover business insights.

---

## 🗂️ Database Schema

- **Entities**: Customer, Order, Product, Service, Employee, Store Location, Appointment, etc.
- **Relationships**:
  - One-to-Many: Customer → Orders, Employee → Services
  - Many-to-Many: Product ↔ Store, Order ↔ Order Details
- **Design**: Normalized to 3NF for efficiency and integrity

You can view the ER diagram [here](link-to-pdf-or-image).

---

## 🛠️ Tools & Technologies

- **Database**: MySQL
- **Design**: Lucidchart (ERD)
- **Data**: Mock data generated via Excel and manual entry
- **Language**: SQL (DDL, DML, and Analytical Queries)

---

## 📊 Sample Business Insights via SQL

This project includes advanced SQL queries that answer key business questions such as:

- Who are the top customers by lifetime spend?
- Which stores generate the highest revenue?
- What services are most popular by gender and age group?
- When are peak appointment hours?
- How effective are referral programs?

## 📈 Sample Query Highlight

```sql
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
