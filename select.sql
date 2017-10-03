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

-- How many genres are there?
SELECT COUNT(*)
FROM [UA_HALLUX].[dbo].[Genre]

-- How many customers have a first name that starts with the letter J?
SELECT COUNT(*)
FROM [UA_HALLUX].[dbo].[Customer]
WHERE First_Name LIKE 'J%'

-- Which zip code has the most number of customers?
SELECT Zip_Code, COUNT(Customer_Id) AS 'count_of_customers'
FROM [UA_HALLUX].[dbo].[Customer]
WHERE Zip_Code IN ('72701', '90210', '30096', '33024')
GROUP BY Zip_Code
ORDER BY 'count_of_customers' DESC

-- How many customers have a phone number in area code 479?
SELECT COUNT(*)
FROM [UA_HALLUX].[dbo].[Customer]
WHERE Phone_Number LIKE '479%'

-- What's the most common customer last name?
SELECT Last_Name, COUNT(*) AS 'count_of_customers'
FROM [UA_HALLUX].[dbo].[Customer]
WHERE Last_Name IS NOT NULL
GROUP BY Last_Name
ORDER BY 'count_of_customers' DESC

-- How many bands are inactive?
SELECT COUNT(*)
FROM [UA_HALLUX].[dbo].[Band]
WHERE Band_Status_Code = 'A'

-- How many active bands are there?
SELECT COUNT(*)
FROM [UA_HALLUX].[dbo].[Band]
WHERE Band_Status_Code = 'A'

-- What's the most number of bands in a single zip code?
SELECT Zip_Code, COUNT(*) 'count_of_bands'
FROM [UA_HALLUX].[dbo].[Band]
GROUP BY Zip_Code
ORDER BY 'count_of_bands' DESC

-- Which of the following is the oldest band?
SELECT *
FROM [UA_HALLUX].[dbo].[Band]
WHERE Band_Name IN ('The Data Posse','Catch The Class','The Resolute Fools','Fabulous Class')
ORDER BY Formation_Date ASC

-- How many contracts have no end date?
SELECT COUNT(*)
FROM [Contract]
WHERE End_Date IS NULL

-- What's the average contractual album revenue percentage?
SELECT AVG(Album_Rev_Pct)
FROM [Contract]

-- What is the total amount sold?
SELECT SUM(Total_Amount)
FROM [UA_HALLUX].[dbo].[Order_Header]

-- How many orders were made in August 2012?
SELECT *
FROM [UA_HALLUX].[dbo].[Order_Header]
WHERE Order_Date BETWEEN '2012-08-01' AND '2012-08-31'
ORDER BY Order_Date

-- How many videos were produced by the most productive producer?
SELECT TOP 1 COUNT(*) AS 'count_of_videos'
FROM [UA_HALLUX].[dbo].[Video]
GROUP BY Producer_ID
ORDER BY 'count_of_videos' DESC

-- Which venue had the least number of performances?
SELECT Venue_Id, COUNT(Performance_Id) AS 'count_of_performances'
FROM [UA_HALLUX].[dbo].[Performance]
GROUP BY Venue_Id
ORDER BY 'count_of_performances'

-- What's the average price for items ordered in quantities greater than 5?
SELECT AVG(Unit_Price)
FROM [UA_HALLUX].[dbo].[Order_Detail]
WHERE Quantity > 5

-- Which item has sold most often having a unit price greater than $10?
SELECT Item_Id, COUNT(Order_Id) AS 'count_orders'
FROM [UA_HALLUX].[dbo].[Order_Detail]
WHERE Unit_Price > 10
GROUP BY Item_Id
ORDER BY 'count_orders' DESC
