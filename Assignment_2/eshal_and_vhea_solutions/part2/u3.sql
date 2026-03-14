-- Customer Appreciation Week

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO Recommender;


-- You may find it convenient to do this for each of the views
-- that define your intermediate steps. (But give them better names!)
-- List of all items that have been purchased at least 10 times 

DROP VIEW IF EXISTS NewMug CASCADE;
CREATE VIEW NewMug AS 
    SELECT 'Housewares' AS category, 'Company logo mug' AS description, 0 AS price,
    CASE
        WHEN EXISTS (SELECT * FROM Item) 
            THEN max(IID) + 1
        ELSE 1
    END AS IID
    FROM Item;

INSERT INTO Item 
    SELECT IID, category, description, price 
    FROM NewMug;

-- All purchases made yesterday 
DROP VIEW IF EXISTS BoughtYesterday CASCADE;
CREATE VIEW BoughtYesterday AS 
    SELECT PID, CID, checkout_time
    FROM Purchase
    -- subtract 24 hours and truncate to yesterday in general
    WHERE DATE_TRUNC('day', checkout_time) = DATE_TRUNC('day',  NOW() - INTERVAL '24:00:00'); 

-- Find the first order placed by each customer yesterday 
DROP VIEW IF EXISTS EarliestYesterday CASCADE;
CREATE VIEW EarliestYesterday AS 
    SELECT CID, min(PID) AS PID
    FROM BoughtYesterday
    GROUP BY CID;

-- Add gifts to orders 
DROP VIEW IF EXISTS GiveGifts CASCADE;
CREATE VIEW GiveGifts AS 
    SELECT EarliestYesterday.PID, Item.IID, 1 as quantity 
    FROM EarliestYesterday, Item
    WHERE Item.description = 'Company logo mug';

INSERT INTO LineItem 
    SELECT PID, IID, quantity 
    FROM GiveGifts;


