-- What instrument ID is played by the most number of band members?
SELECT TOP 1 Instrument_Id, COUNT(Member_Id) AS 'Member Count'
FROM [UA_HALLUX].[dbo].[Member_Instrument]
GROUP BY Instrument_Id
ORDER BY 'Member Count' DESC

-- How many agents make more than $40K?
SELECT COUNT(Agent_Id)
FROM [UA_HALLUX].[dbo].[Agent]
WHERE Salary > 40000

-- What's the most popular first name?
SELECT [First_Name], COUNT(*) AS 'Name_Count'
FROM [UA_HALLUX].[dbo].[Customer]
WHERE First_Name IS NOT NULL
GROUP BY First_Name
ORDER BY Name_Count DESC

-- How many customers have the same first name?
SELECT SUM(Name_Count)
FROM (
	SELECT [First_Name], COUNT(*) AS 'Name_Count'
	FROM [UA_HALLUX].[dbo].[Customer]
	WHERE First_Name IS NOT NULL
	GROUP BY First_Name
	HAVING COUNT(*) > 1
) subt

-- What's the most common band genre?
SELECT TOP 1 Genre_Id
FROM [UA_HALLUX].[dbo].[Band_Genre]
GROUP BY Genre_Id
ORDER BY COUNT(Band_Id) DESC

-- How many line items are on Order ID 1450813
SELECT COUNT(Line_Number)
FROM [UA_HALLUX].[dbo].[Order_Detail]
WHERE Order_Id = 1450813

-- What's the average product price?
SELECT AVG([Unit_Price])
FROM [UA_HALLUX].[dbo].[Order_Detail]

-- What's the average price per product?
SELECT Item_ID, AVG([Unit_Price])
FROM [UA_HALLUX].[dbo].[Order_Detail]
GROUP BY Item_ID
ORDER BY AVG([Unit_Price]) DESC
