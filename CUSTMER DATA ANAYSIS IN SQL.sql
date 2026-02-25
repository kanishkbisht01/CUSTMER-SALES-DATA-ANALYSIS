CREATE TABLE Customers (
    Custom_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    City VARCHAR(30),
    Email VARCHAR(50),
    Phone_Number VARCHAR(15),
    Last_Purchase_Date DATE,
    Lifetime_Value INT
);

SELECT * FROM Customers;


SELECT Name, Age, City, Lifetime_Value 
FROM Customers;

-- Sirf Mumbai ke customers
SELECT * FROM Customers 
WHERE City = 'Mumbai';

-- 30 se zyada age wale
SELECT * FROM Customers 
WHERE Age > 30;

-- Female customers
SELECT * FROM Customers 
WHERE Gender = 'Female';

-- Lifetime Value ke hisaab se (high to low)
SELECT * FROM Customers 
ORDER BY Lifetime_Value DESC;

-- Age ke hisaab se (young to old)
SELECT * FROM Customers 
ORDER BY Age ASC;

-- Average age
SELECT AVG(Age) as Average_Age FROM Customers;

-- Total Lifetime Value
SELECT SUM(Lifetime_Value) as Total_Revenue FROM Customers;

-- City wise average spending
SELECT City, AVG(Lifetime_Value) as Avg_Spending
FROM Customers
GROUP BY City;

-- City wise customer count
SELECT City, COUNT(*) as Customer_Count
FROM Customers
GROUP BY City;

-- Gender wise average lifetime value
SELECT Gender, AVG(Lifetime_Value) as Avg_LTV
FROM Customers
GROUP BY Gender;


-- November mein purchase karne wale
SELECT * FROM Customers 
WHERE MONTH(Last_Purchase_Date) = 11;

-- 2023 ke customers
SELECT * FROM Customers 
WHERE YEAR(Last_Purchase_Date) = 2023;

-- Mumbai ke male customers with LTV > 5000
SELECT * FROM Customers 
WHERE City = 'Mumbai' 
  AND Gender = 'Male' 
  AND Lifetime_Value > 5000;


-- Top 5 customers by lifetime value
SELECT TOP 5 Name, City, Lifetime_Value
FROM Customers
ORDER BY Lifetime_Value DESC;


SELECT 
    Name,
    Age,
    CASE 
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 40 THEN 'Middle'
        ELSE 'Senior'
    END as Age_Group
FROM Customers;


SELECT 
    City,
    COUNT(*) as Total_Customers,
    AVG(Lifetime_Value) as Avg_LTV,
    SUM(Lifetime_Value) as Total_Revenue
FROM Customers
GROUP BY City
ORDER BY Total_Revenue DESC;

