-- Unrated products
-- Vhea's Solution

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO Recommender;
DROP TABLE IF exists q1 CASCADE;

CREATE TABLE q1(
    CID INTEGER,
    first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
    email TEXT	
);

-- List of Unreveiwed Items
DROP VIEW IF EXISTS UnreviewedItems CASCADE;

CREATE VIEW UnreviewedItems AS 
    SELECT DISTINCT item.IID AS IID
    FROM item
    EXCEPT
    SELECT DISTINCT review.IID AS IID
    FROM review;

-- List of unreviewed items that have been bought
DROP VIEW IF EXISTS Unreviewed_Purchases CASCADE;

CREATE VIEW Unreviewed_Purchases AS 
    SELECT lineitem.pid AS U_PID, lineitem.iid AS U_IID
    FROM lineitem INNER JOIN UnreviewedItems ON lineitem.IID = UnreviewedItems.IID;


DROP VIEW IF EXISTS Unreviewed_Purchase_Info CASCADE;

CREATE VIEW Unreviewed_Purchase_Info AS 
    SELECT *
    FROM purchase INNER JOIN Unreviewed_Purchases ON  purchase.pid = Unreviewed_Purchases.U_PID;

-- List of customers and the amount of distinct unreviewed things they've bought if they've bought more than 3
DROP VIEW IF EXISTS People_Bought CASCADE;

CREATE VIEW People_Bought AS 
    SELECT Unreviewed_Purchase_Info.cid AS customer_id, COUNT(DISTINCT Unreviewed_Purchase_Info.U_IID) AS diff_things_bought
    FROM Unreviewed_Purchase_Info
    GROUP BY Unreviewed_Purchase_Info.cid
    HAVING COUNT(DISTINCT Unreviewed_Purchase_Info.U_IID) >= 3;

-- List of customers who bought unreviewed items 
DROP VIEW IF EXISTS Unrev_Customer_Info CASCADE;

CREATE VIEW Unrev_Customer_Info AS 
    SELECT DISTINCT *
    FROM customer INNER JOIN People_Bought ON customer.cid = People_Bought.customer_id;

-- Your query that answers the question goes below the "insert into" line:
INSERT INTO q1
SELECT cid, first_name, last_name, email
FROM Unrev_Customer_Info;
