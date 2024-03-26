-- Utwórz zapytanie, które wyświetli wersję SQLite.
SELECT sqlite_version();
-- Utwórz zapytanie, które zwróci aktualny czas.
SELECT CURRENT_TIME;
-- Utwórz zapytanie, które zwróci wynik dzielenia 23 przez 4.
SELECT (23/4.0);
-- Wyświetl całą tabelę Employee (baza Northwind).
SELECT * FROM Employee;
-- Wyświetl całą tabelę Order.
SELECT * FROM "Order";
-- Wyświetl kolumny:
--     * FirstName
--     * LastName
--     * Country
--     * City
-- z tabeli Employee w podanej powyżej kolejności.
SELECT FirstName, LastName, Country, City FROM Employee;

-- Wyświetl całą tabelę Customer (zwróć uwagę na kolumnę Id).
SELECT * FROM Customer;
-- Wyświetl całą tabelę Customer razem z kolumną ROWID umieszczoną jako pierwszą.
SELECT ROWID, * FROM Customer;
-- Wyświetl kolumny:
--     * ProductName
--     * UnitPrice
-- z tabeli Product w podanej kolejności i posortuj rosnąco po kolumnie UnitPrice.
SELECT ProductName, 
       UnitPrice
FROM Product
ORDER BY UnitPrice ASC;
-- Wyświetl kolumny:
--     * ProductName
--     * UnitPrice
-- z tabeli Product w podanej kolejności i posortuj malejąco po kolumnie UnitPrice.
SELECT ProductName, 
       UnitPrice
FROM Product
ORDER BY UnitPrice DESC;
-- Wyświetl kolumny:
--     * CompanyName
--     * Country
--     * City
-- z tabeli Customer w podanej powyżej kolejności. Tabelę wynikową posortuj rosnąco
-- po kolumnie Country i następnie rosnąco po kolumnie City.
SELECT CompanyName, 
	   Country, 
	   City 
FROM Customer
ORDER BY Country, City;
-- Wyświetl kolumny:
--     * CompanyName
--     * Country
--     * City
-- z tabeli Customer w podanej powyżej kolejności. Tabelę wynikową posortuj rosnąco
-- po kolumnie Country i następnie malejąco po kolumnie City.
SELECT CompanyName, 
	   Country, 
	   City 
FROM Customer
ORDER BY Country, City DESC;
-- Wyświetl tabelę Order posortowaną po kolumnie ShippedDate rosnąco.
-- Zwróć uwagę na braki danych (NULL).
SELECT * 
FROM "Order"
ORDER BY ShippedDate;
-- Wyświetl tabelę Order posortowaną po kolumnie ShippedDate rosnąco.
-- Braki danych (NULL) pozostaw na końcu sortowania.
SELECT * 
FROM "Order"
ORDER BY ShippedDate NULLS LAST;

-- Wyświetl tabelę Order posortowaną po kolumnie ShippedDate malejąco.
-- Zwróć uwagę na braki danych (NULL).
SELECT * 
FROM "Order"
ORDER BY ShippedDate DESC;
-- Wyświetl tabelę Order posortowaną po kolumnie ShippedDate malejąco.
-- Braki danych (NULL) pozostaw na początku sortowania.
SELECT * 
FROM "Order"
ORDER BY ShippedDate DESC NULLS FIRST;
-- Wyświetl 5 wierszy z tabeli Supplier.
SELECT * FROM Supplier
LIMIT 5;
-- Wyświetl 5 najtańszych produktów (UnitPrice) z tabeli Product.
SELECT * 
FROM Product
ORDER BY UnitPrice ASC
LIMIT 5;
-- Wyświetl 10 najdroższych produktów (UnitPrice) z tabeli Product.

SELECT * 
FROM Product
ORDER BY UnitPrice DESC
LIMIT 10;
-- Wyświetl (tylko) nazwy 10 najdroższych produktów (UnitPrice) z tabeli Product.
SELECT ProductName 
FROM Product
ORDER BY UnitPrice DESC;
LIMIT 10;

-- 2


-- Pomiń 3 najtańsze produkty w tabeli Product i wyświetl kolejne 5 najtańszych 
-- produktów (UnitPrice) z tabeli Product.
SELECT * 
FROM Product
ORDER BY UnitPrice ASC
LIMIT 5
OFFSET 3;

-- Wyświetl jedenasty najdroższy produkt z tabeli Product.
SELECT * 
FROM Product
ORDER BY UnitPrice DESC
LIMIT 1
OFFSET 10;
-- Wyświetl kolumny Country oraz City z tabeli Customer.
SELECT Country, City FROM Customer;
-- Wyświetl unikalne nazwy krajów występujące w kolumnie Country tabeli Customer.
SELECT DISTINCT Country FROM Customer;
-- Wyświetl unikalne nazwy krajów występujące w kolumnie Country tabeli Customer. 
-- Posortuj wyniki rosnąco.

SELECT DISTINCT Country 
FROM Customer
ORDER BY Country ASC;
-- Wyświetl unikalne nazwy miast występujące w kolumnie City tabeli Customer.
SELECT DISTINCT City FROM Customer;
-- Wyświetl unikalne pary kraj <-> miasto występujące w kolumnach Country oraz City 
-- tabeli Customer.
SELECT DISTINCT Country, City FROM Customer;
-- Wyświetl unikalne nazwy regionów występujące w kolumnie Region tabeli Supplier.
SELECT DISTINCT Region FROM Supplier;

--3

-- Wyświetl wszystkie rekordy tabeli Order dla których kolumna Freight jest mniejsza
-- niż 10.0.
SELECT * 
FROM "Order"
WHERE Freight < 10.0;
-- Wyświetl wszystkie rekordy tabeli Order dla których kolumna Freight jest mniejsza
-- niż 10.0. Wynik posortuj rosnąco po kolumnie Freight.

SELECT * 
FROM "Order"
WHERE Freight < 10.0
ORDER BY Freight ASC;
-- Wyświetl wszystkie rekordy tabeli Order dla których kolumna Freight jest większa
-- lub równa 10 i mniejsza niż 20.

SELECT * 
FROM "Order"
WHERE Freight <= 10.0 AND Freight < 20;


-- Wyświetl wszystkie rekordy tabeli Order dla których kolumna Freight jest mniejsza
-- lub równa 3.0 lub większa lub równa 300.0.
SELECT * 
FROM "Order"
WHERE Freight <= 3.0 OR Freight >= 300.0;

-- Wyświetl wsystkie zamówienia z tabeli Order z dnia '2014-05-05'
SELECT * 
FROM "Order"
WHERE OrderDate == '2014-05-05';
-- Wyświetl wsystkie zamówienia z tabeli Order poza dniem '2014-05-05'
SELECT * 
FROM "Order"
WHERE OrderDate != '2014-05-05';
-- Wyświetl wszystkie zamówienia z tabeli Order złożone w okresie od 2012-08-01 
-- do 2012-08-31 (włącznie). Wykorzystaj w tym celu kolumnę OrderDate.
SELECT * 
FROM "Order"
WHERE OrderDate >= '2012-08-01' AND OrderDate <= '2012-08-31';

-- Wyświetl wszystkie zamówienia z tabeli Order złożone przez klientów o wartości
-- CustomerId: HANAR, HUNGO, GROSR.
SELECT * 
FROM "Order"
WHERE CustomerId IN ('HANAR', 'HUNGO', 'GROSR');

-- Wyświetl wszystkie zamówienia z tabeli Order poza zamówieniami klientów o wartości
-- CustomerId: HANAR, HUNGO, GROSR.
SELECT * 
FROM "Order"
WHERE CustomerId NOT IN ('HANAR', 'HUNGO', 'GROSR');

-- Wyświetl wszystkie zamówienia z tabeli Order z brakującymi wartościami dla kolumny
-- ShippedDate.
SELECT * 
FROM "Order"
WHERE ShippedDate IS NULL;
-- Wyświetl wszystkie zamówienia z tabeli Order bez brakujących wartości dla kolumny
-- ShippedDate.
SELECT * 
FROM "Order"
WHERE ShippedDate IS NOT NULL;
-- Wyświetl wszystkie zamówienia dla krajów rozpoczynających się na literę F.
SELECT * 
FROM "Order"
WHERE ShipCountry GLOB '[F]*';
-- Wyświetl wszystkie zamówienia dla krajów, których nazwa nie rozpoczyna się od 
-- litery F.
SELECT * 
FROM "Order"
WHERE ShipCountry GLOB '[^F]*';
-- Wyświetl wszystkie zamówienia dla krajów, których nazwa składa się dokładnie
-- z pięciu znaków.
SELECT * 
FROM "Order"
WHERE ShipCountry LIKE '_____';

-- Wyświetl wszystkie zamówienia dla krajów, których nazwa rozpoczyna się od liter
-- P, L, N, O
SELECT * FROM "Order" WHERE ShipCountry GLOB '[P-O]*';


--4

-- Wyświetl liczbę niepustych rekordów w tabeli Order.
SELECT COUNT(*) 
FROM "Order";

-- Wyświetl liczbę niepustych rekordów w tabeli Order. Przypisz podany alias do
-- kolumny wynikowej: NumberOfRows
SELECT COUNT(*) AS NumberOfRows
FROM "Order";
-- Wyznacz liczbę unikalnych klientów (kolumna CustomerId) w tabeli Order i przypisz
-- podany alias: NumberOfCustomers
SELECT COUNT(DISTINCT CustomerId) AS NumberOfCustomers 
FROM "Order";

-- Wyznacz dwie wartości:
--     * liczbę niepustych wartości dla kolumny CustomerId w tabeli Order
--     * liczbę unikalnych klientów (kolumna CustomerId) w tabeli Order
-- i przypisz do nich aliasy:
--     * NumberOfRows
--     * NumberOfCustomers
SELECT COUNT(CustomerId) AS NumberOfRows,
	   COUNT(DISTINCT CustomerId) AS NumberOfCustomers
FROM "Order"; 


-- Podane jest poniższe zapytanie:
SELECT COUNT(*) AS NumberOfRows,
       COUNT(DISTINCT CustomerId) AS NumberOfCustomers, 
	   COUNT(DISTINCT CustomerId) / (COUNT(*) * 1.0) AS PctOfUniqueCustomers
FROM "Order";
-- Dodaj trzecią kolumnę, która wyliczy procent unikalnych klientów w tabeli Order.
-- Przypisz do niej alias: PctOfUniqueCustomers
-- Zwróć uwagę na dzielenie przez liczbę całkowitą. Aby zamienić liczbę całkowitą 
-- na zmiennoprzecinkową można ją pomnożyć przez 1.0. 

-- Wyznacz trzy wartości:
--     * liczbę rekordów w tabeli Order
--     * liczbę niepustych wartości kolumny ShippedDate
--     * procent brakujących danych w kolumnie ShippedDate
-- i przypisz odpowiednio aliasy:
-- 	   * NumberOfRows
-- 	   * NumberOfNonMissingShippedDate
-- 	   * PctOfMissingShippedDate
SELECT COUNT(*) AS NumberOfRows,
	   COUNT(ShippedDate) AS NumberOfNonMissingShippedDate,
	   (COUNT(*)- COUNT(ShippedDate)) / (COUNT(*) / 1.0) AS PctOfMissingShippedDate
FROM "Order";



-- Wyznacz najstarszą datę zamówienia (kolumna OrderDate) z tabeli Order.
SELECT * 
FROM "Order"
ORDER BY OrderDate DESC
LIMIT 1;

-- Wyznacz najnowszą datę zamówienia (kolumna OrderDate) z tabeli Order.
SELECT * 
FROM "Order" 
ORDER BY OrderDate
LIMIT 1;

-- Wyznacz średnią wartość dla kolumny Freight w tabeli Order.
SELECT AVG(Freight) FROM "Order"; 

--5

-- Pogrupuj dane z tabeli Order na poziomie CustomerId i wyznacz dla każdego klienta
-- liczbę zamównień.

SELECT CustomerId,
	   COUNT(*) AS Number_of_orders
FROM "Order"
GROUP BY CustomerId;

-- Pogrupuj dane z tabeli Order na poziomie CustomerId i wyznacz dla każdego klienta
-- liczbę zamównień. Wynik posortuj malejąco po liczbie zamównień. 
SELECT CustomerId,
	   COUNT(*) AS Number_of_orders
FROM "Order"
GROUP BY CustomerId
ORDER BY Number_of_orders DESC;

-- Pogrupuj dane z tabeli Order na poziomie OrderDate i wyznacz dla każdej daty
-- liczbę zamównień. Wynik posortuj malejąco po liczbie zamównień i ogranicz do
-- 10 pierwszych rekordów.

SELECT OrderDate,
       COUNT(*) AS Number_of_orders
FROM "Order"
GROUP BY OrderDate
ORDER BY Number_of_orders DESC
LIMIT 10;

-- Pogrupuj dane z tabeli Order na poziomie ShipCountry i wyznacz dla każdego kraju
-- liczbę zamównień. W wyniku pozostaw kraje, które mają więcej niż 50 zamówień.
-- Wynik posortuj malejąco po liczbie zamównień. 
SELECT ShipCountry,
	   COUNT(*) AS Number_of_orders
FROM "Order"
GROUP BY ShipCountry
HAVING Number_of_orders > 50.0
ORDER BY Number_of_orders DESC;

-- Pogrupuj dane z tabeli Order na poziomie ShipCountry oraz ShipCity i wyznacz 
-- dla każdej pary kraj <-> miasto liczbę zamównień. Wynik posortuj po malejącej
-- liczbie zamówień.

SELECT ShipCountry,
	   ShipCity,
	   COUNT(*) AS Number_of_orders
FROM "Order"
GROUP BY ShipCountry, ShipCity
ORDER BY Number_of_orders DESC;

-- Pogrupuj dane z tabeli Order na poziomie ShipCountry i wyznacz średnią wartość
-- dla kolumny Freight. Wynik posortuj malejąco po średniej wartości tej kolumny.

SELECT ShipCountry,
	   AVG(Freight) AS avg_fre
FROM "Order"
GROUP BY ShipCountry
ORDER BY avg_fre DESC;

--5

-- Z tabeli Product wyświetl kolumnę UnitsInStock. Dodatkowo dodaj drugą kolumnę
-- o nazwie UnitsInStockLevel, która podzieli wartości w kolumnie UnitsInStock na
-- cztery poziomy:
--     * UnitsInStock == 0 -> 'none'
--     * UnitsInStock < 20 -> 'low'
--     * UnitsInStock pomiędzy 20 a 50 -> 'medium'
--     * UnitsInStock powyżej 50 -> 'high'

SELECT UnitsInStock,
	   CASE
			WHEN UnitsInStock = 0 THEN 'none'
			WHEN UnitsInStock < 20 THEN 'low'
			WHEN UnitsInStock BETWEEN 20 AND 50 THEN 'medium'
			WHEN UnitsInStock > 50 THEN 'high'
		END AS UnitsInStockLevel
FROM Product;


-- Wykorzystując zapytanie z powyższego ćwiczenia pogrupuj dane w kolumnie Product 
-- na poziomie UnitsInStockLevel i policz liczbę wystąpień dla każdej grupy.

SELECT COUNT(*) AS Num_of_products,
	   CASE
			WHEN UnitsInStock = 0 THEN 'none'
			WHEN UnitsInStock < 20 THEN 'low'
			WHEN UnitsInStock BETWEEN 20 AND 50 THEN 'medium'
			WHEN UnitsInStock > 50 THEN 'high'
		END AS UnitsInStockLevel
FROM Product
GROUP BY UnitsInStockLevel;

--6
SELECT * FROM Product;
SELECT * FROM Category;
-- Wykonaj połączenie typu LEFT JOIN tabel Product oraz Category używając aliasów.
-- Połącz tabele wykorzystując kolumny:
--     * CategoryId z tabeli Product
--     * Id z tabeli Category
-- W wyniku wyświetl tylko cztery kolumny:
--     * Id z tabeli Product
--     * ProductName
--     * CategoryName
--     * Description

SELECT t1.Id,
       t1.ProductName,
	   t2.CategoryName,
	   t2.Description
FROM Product AS t1
LEFT JOIN Category AS t2 ON t1.CategoryId = t2.Id; 


-- 7

-- Wyświetl tabele Order oraz Customer. Zwróć uwagę na kolumnę CustomerId w tabeli
-- Order oraz kolumnę Id w tabeli Customer.
SELECT * FROM "Order";
SELECT * FROM Customer;

-- Wykonaj połączenie typu LEFT JOIN tabel Order oraz Customer łącząc je po kolumnach:
-- CustomerId z tabeli Order oraz Id z tabeli Customer. 
-- W wyniku wyświetl kolumny:
--     * CustomerId z tabeli Order
--     * Id z tabeli Customer
--     * Freight
--     * CompanyName
--     * ContactName

SELECT t2.CustomerId,
	   t1.Id,
	   t2.Freight,
	   t1.CompanyName,
	   t1.ContactName
FROM "Order" AS t2
LEFT JOIN Customer AS t1 ON t2.CustomerId = t1.Id;

-- Do zapytania z poprzedniego ćwiczenia dodaj warunek WHERE, który wyświetli wiersze
-- gdzie kolumna Id w tabeli Customer przyjmuje wartości NULL.

-- Poniższe zapytanie przekształć na połączenie typu INNER JOIN
SELECT t1.CustomerId,
       t2.Id,
       t1.Freight,
       t2.CompanyName,
       t2.ContactName
FROM "Order" AS t1
LEFT JOIN Customer AS t2 ON t1.CustomerId = t2.Id
WHERE t2.Id IS NULL;
-- INNER JOIN
SELECT t1.CustomerId,
       t2.Id,
       t1.Freight,
       t2.CompanyName,
       t2.ContactName
FROM "Order" AS t1
INNER JOIN Customer AS t2 ON t1.CustomerId = t2.Id;

 