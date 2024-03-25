--zapytanie do tabeli Employee

SELECT * FROM Employee;

SELECT * FROM Employee ORDER BY FirstName;

SELECT * FROM Employee ORDER BY FirstName DESC;

-- ASC od A do Z, DESC od Z do A
SELECT * FROM Employee ORDER BY Title DESC, FirstName ASC;

SELECT Title, FirstName, LastName FROM Employee ORDER BY Title ASC,FirstName DESC;

-- Moge zastapic rowniez indexami od 1 !!!
SELECT Title, FirstName, LastName FROM Employee ORDER BY 1 ASC,2 DESC;

SELECT * FROM Product;

SELECT * FROM Product ORDER BY UnitPrice;

SELECT * FROM Product ORDER BY UnitPrice DESC;

SELECT * FROM Customer ORDER BY FAX NULLS FIRST;

SELECT * FROM Customer ORDER BY FAX NULLS LAST;

SELECT CompanyName, ContactName, Fax FROM Customer ORDER BY FAX DESC; -- lub NULLS LAST ZAMIAST DESC


-- LIMIT

SELECT ProductName, UnitPrice FROM Product ORDER BY UnitPrice DESC LIMIT 10;

-- najdrozszy produkt
SELECT ProductName, 
	   UnitPrice 
FROM Product 
ORDER BY UnitPrice DESC 
LIMIT 1;

-- OFFSET

SELECT ProductName, UnitPrice FROM Product ORDER BY UnitPrice DESC;

SELECT ProductName, 
       UnitPrice 
FROM Product 
ORDER BY UnitPrice DESC 
LIMIT 1 
OFFSET 4;

SELECT DISTINCT Country FROM Customer;

SELECT DISTINCT Country, City FROM Customer ORDER BY 1, 2;

SELECT * FROM CUSTOMER WHERE Country == "Poland";
SELECT * FROM CUSTOMER WHERE Country == "USA";

SELECT DISTINCT Region FROM CUSTOMER;

SELECT * FROM Customer WHERE Region == 'Scandinavia';

SELECT ProductName,UnitPrice FROM Product WHERE UnitPrice > 40 ORDER BY UnitPrice DESC;

SELECT ProductName,UnitPrice FROM Product WHERE UnitsInStock == 0 ORDER BY UnitPrice DESC;

-- IN oraz NOT IN

SELECT * FROM Customer WHERE Country IN ('UK', 'Italy', 'Poland');

SELECT * FROM Customer WHERE Country NOT IN ('UK', 'Italy', 'Poland');

-- BETWEEN oraz NOT BETWEEN

SELECT ProductName, UnitPrice FROM Product WHERE UnitPrice BETWEEN 15 and 20;

SELECT ProductName, UnitPrice FROM Product WHERE UnitPrice NOT BETWEEN 15 and 20;

-- IS NULL oraz NOT NULL

SELECT * FROM Customer WHERE Fax IS NULL;

SELECT * FROM Customer WHERE Fax IS NOT NULL;

-- LIKE

SELECT CompanyName, ContactName, Country FROM Customer WHERE CompanyName == 'Bon app';

SELECT CompanyName, ContactName, Country FROM Customer WHERE CompanyName LIKE '%co%';

SELECT CompanyName, ContactName, Country FROM Customer WHERE CompanyName LIKE 'B%';

SELECT CompanyName, 
	   ContactName, 
	   Country 
FROM Customer 
WHERE Country
LIKE '___';

SELECT CompanyName, 
	   ContactName, 
	   Country 
FROM Customer 
WHERE ContactName
LIKE 'J__n %';

-- GLOB

SELECT CompanyName, 
	   ContactName, 
	   Country 
FROM Customer 
WHERE ContactName
GLOB 'An? *';

SELECT CompanyName, 
	   ContactName, 
	   Country 
FROM Customer 
WHERE CompanyName
GLOB '[A-D] *';

SELECT CompanyName, 
	   ContactName, 
	   Country 
FROM Customer 
WHERE CompanyName
GLOB '[^A-C]*';

-- ilosc wierszy
SELECT COUNT(*) FROM Product;
SELECT COUNT(*) AS TotalRows FROM Product;

SELECT SupplierId FROM Product;
SELECT COUNT(DISTINCT SupplierId) AS NumOfSuppliers FROM Product;

--niepuste wartosci
SELECT COUNT(Fax) FROM Customer;

--SUM
SELECT UnitPrice FROM PRODUCT;
SELECT SUM(UnitPrice) FROM PRODUCT;

SELECT SUM(UnitPrice) AS TotalSUM FROM PRODUCT;


--avg
SELECT AVG(UnitPrice) AS AvgPrice FROM PRODUCT;

SELECT AVG(DISTINCT UnitPrice) AS AvgPrice FROM PRODUCT;

SELECT MIN(UnitPrice) AS AvgPrice FROM Product;

SELECT UPPER(CategoryName) AS CategoryName, Description FROM Category;

SELECT LOWER(CategoryName) AS CategoryName, Description FROM Category;

SELECT CategoryName, LENGTH(CategoryName) AS LenCategoryName, Description FROM Category;

SELECT TYPEOF(3);

SELECT TYPEOF('py');

SELECT TYPEOF(NULL);

SELECT CategoryName, TYPEOF(CategoryName), Description FROM Category;

--utworzenie tabeli
CREATE TABLE website.sales (
	id          INTEGER PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    amount      REAL    NOT NULL
);

-- Wstawienie kilku rekordów do tabeli
INSERT INTO website.sales (employee_id, amount)
VALUES (325, 109.0),
       (335, 9.89),
       (336, 40.0),
       (325, 210.0),
       (336, 39.50),
       (431, 15.99),
       (325, 10.99),
       (431, 32.00);
	   
--wyswietlanie tabeli
SELECT * FROM website.sales;

--grupowanie po employee_Id



SELECT employee_id, 
	   SUM(amount) as total_sales,
	   COUNT(employee_id) AS transactions,
	   AVG(amount) AS avg_amount,
	   MIN(amount) AS min_amount,
	   MAX(amount) AS max_amount
FROM website.sales 
GROUP BY employee_id
ORDER BY total_sales DESC;


SELECT employee_id,
       SUM(amount) AS total_sales,
       COUNT(employee_id) AS transactions
FROM website.sales
WHERE employee_id != 336
GROUP BY employee_id
HAVING total_sales > 50
ORDER BY total_sales DESC;

SELECT DISTINCT CustomerId FROM "Order";

SELECT CustomerId ,
	   COUNT(CustomerId) AS Counter_of_id
FROM "Order" 
GROUP BY CustomerId
ORDER BY Counter_of_id DESC
LIMIT 10
OFFSET 3;


SELECT OrderId,
	   COUNT(OrderId) AS Num_of_order_id
FROM OrderDetail	   
GROUP BY OrderId
ORDER BY Num_of_order_id DESC ;

-- HMM CZY TE 2 nizej są rownowazne??
SELECT OrderId FROM OrderDetail;

SELECT DISTINCT OrderId FROM OrderDetail;


SELECT *
FROM OrderDetail	   
WHERE OrderId == 11077;

SELECT *, UnitPrice * Quantity * (1 - Discount) AS TotalSale FROM OrderDetail;

SELECT * FROM OrderDetail;

SELECT OrderId, 
	   SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalSale
FROM OrderDetail
GROUP BY OrderId
ORDER BY TotalSale DESC;

SELECT ShipCountry,
	   COUNT(ShipCountry) AS Num_of_nat
FROM "Order"
GROUP BY ShipCountry
ORDER BY Num_of_nat DESC;


SELECT ShipCountry,Freight,
	   COUNT(ShipCountry) AS Num_of_nat,
	   AVG(Freight) AS Avg_freight,
	   MIN(Freight) AS MinFreight,
	   MAX(Freight) AS MaxFreight
FROM "Order"
WHERE ShipCountry GLOB '[A-C]*'
GROUP BY ShipCountry
HAVING MaxFreight > 300
ORDER BY Avg_freight DESC;

--SELECT CASE

SELECT CompanyName, ContactName, ContactTitle,
	   CASE
			WHEN ContactTitle LIKE 'Owner' THEN 'Owner'
			ELSE 'Other'
	   END AS IsOwner		
FROM Customer;


SELECT ProductName, UnitPrice,
	   CASE
			WHEN UnitPrice < 10 THEN 'low'
			WHEN UnitPrice BETWEEN 10 AND 30 THEN 'medium'
			ELSE 'high'
	   END AS PriceSummary		
FROM Product;

SELECT * FROM "Order";

SELECT ShipRegion,
	   CASE
			WHEN ShipRegion LIKE '%EUROPE' THEN 'Europe'
			WHEN ShipRegion LIKE '%America' THEN 'America'
			WHEN ShipRegion LIKE 'Scandinavia' THEN 'Europe'
			WHEN ShipRegion LIKE 'British Isles' THEN 'Europe'
	   END AS Continent	
FROM "Order";

-- PODZAPYTANIA


SELECT Id FROM Product WHERE UnitsInStock > 0;

SELECT *FROM Product;
SELECT *FROM OrderDetail;


SELECT *
FROM OrderDetail
WHERE ProductId IN
	 (SELECT Id 
	 FROM Product 
	 WHERE UnitsInStock > 0)
	
--NIZEJ LEPSZY PRZYKLAD !!
	
SELECT * FROM Customer;
	 
SELECT * 
FROM Customer
WHERE Country LIKE 'U%'
;

--wyswietlam kraje zaczynajace sie literka U
SELECT Country FROM Customer WHERE Country LIKE 'U%';

-- ID klientow z krajow zaczynajacych sie na literke U
SELECT Id FROM Customer WHERE Country LIKE 'U%';

SELECT * FROM "Order";

--WYCIAGAM KONKRETNYCH KLINETOW Z TABELI Order
--TUTAJ BEDA TYLKO KLIENCIZ USA I UK Z TABELI Order
SELECT * 
FROM "Order"
WHERE CustomerId IN
	  (SELECT Id 
	  FROM Customer 
	  WHERE Country LIKE 'U%');


-- CROSS JOIN

