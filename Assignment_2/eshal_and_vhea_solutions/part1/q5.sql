-- Hyperconsumers
-- Vhea's Solution

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO Recommender;
DROP TABLE IF EXISTS q5 CASCADE;

CREATE TABLE q5 (
    year VARCHAR(4) NOT NULL,
    name VARCHAR(65) NOT NULL,
    email VARCHAR(300) NOT NULL,
    items INTEGER NOT NULL
);

-- The customer, the amount of items they bought, and when they bought it
-- Columns: CID, quantity, checkout-time 
DROP VIEW IF EXISTS AllPurchases CASCADE;
CREATE VIEW AllPurchases AS
    SELECT Purchase.CID, LineItem.quantity, Purchase.checkout_time
    FROM Purchase NATURAL JOIN LineItem;

-- A list containing the year, the customer and the total amount of items they bought 
-- Columns: year, CID, total_purchases
DROP VIEW IF EXISTS AnnualPurchases CASCADE;
CREATE VIEW AnnualPurchases AS
    SELECT EXTRACT (Year FROM AllPurchases.checkout_time) AS year, AllPurchases.CID, sum(AllPurchases.quantity) AS total_purchases
    FROM AllPurchases
    GROUP BY year, CID;

-- Gets the top 5 disctinct quantities of the year, will only be less if there are less than 5 values in the year 
-- Columns: year, total_quantity 
DROP VIEW IF EXISTS OrderedQuantities CASCADE;
CREATE VIEW OrderedQuantities AS
    SELECT DISTINCT year, total_purchases, 
        DENSE_RANK() OVER (PARTITION BY year ORDER BY total_purchases DESC) AS rank
    FROM AnnualPurchases 
    ORDER BY year, total_purchases;

DROP VIEW IF EXISTS Top5Quantities CASCADE;
CREATE VIEW Top5Quantities AS
    SELECT DISTINCT year, total_purchases
    FROM OrderedQuantities
    WHERE rank <= 5
    ORDER BY year, total_purchases DESC;

DROP VIEW IF EXISTS Top5Customers CASCADE;
CREATE VIEW Top5Customers AS
    SELECT * 
    FROM AnnualPurchases 
    WHERE EXISTS (
        SELECT * 
        FROM Top5Quantities 
        WHERE AnnualPurchases.year = Top5Quantities.year 
            AND AnnualPurchases.total_purchases = Top5Quantities.total_purchases
    )
    ORDER BY year, total_purchases DESC;

DROP VIEW IF EXISTS Hyperconsumers CASCADE;
CREATE VIEW Hyperconsumers AS
    SELECT Top5Customers.year, CONCAT(Customer.first_name, ' ', Customer.last_name) AS name, Customer.email, Top5Customers.total_purchases AS items 
    FROM Top5Customers NATURAL JOIN Customer;

-- Your query that answers the question goes below the "insert into" line:
INSERT INTO q5
    SELECT year, name, email, items 
    FROM Hyperconsumers;
