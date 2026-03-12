-- SALE!SALE!SALE!

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO Recommender;

-- List of all items that have been purchased at least 10 times 
DROP VIEW IF EXISTS ManyPurchased CASCADE;

CREATE VIEW ManyPurchased AS 
    SELECT LI.IID AS item, SUM(quantity) AS amount_bought
    FROM lineitem LI 
    GROUP BY LI.IID
    HAVING SUM(quantity) >= 10;

-- Update all items that have been purchased at least 10 times with the discounts
UPDATE item
SET price = CASE
    WHEN price >= 10 AND price <= 50 THEN price * 0.8 -- 20% discount
    WHEN price > 50 AND price <= 100 THEN price * 0.7 -- 30% discount
    WHEN price >100 THEN price * 0.5 -- 50% discount
    ELSE price
END
WHERE iid IN (SELECT item FROM ManyPurchased);
