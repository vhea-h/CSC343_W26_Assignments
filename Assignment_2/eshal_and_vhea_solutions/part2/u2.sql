-- Fraud Prevention

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO Recommender;

-- Drop views if they already exist
DROP VIEW IF EXISTS RecentPurchases CASCADE;
DROP VIEW IF EXISTS NumberedPurchases CASCADE;
DROP VIEW IF EXISTS PurchasesToDelete CASCADE;

-- Step 1: Get all recent purchases made in the last 24 hours
CREATE VIEW RecentPurchases AS
    SELECT pid, card_pan, checkout_time
    FROM Purchase
    WHERE checkout_time >= NOW() - INTERVAL '24 hours';


-- Step 2: Number purchases for each credit card in time order.
-- Like for each purchase p1, we count how many purchases from the same card happened at the same time or earlier
-- This will give the position of that purchase for that card (1st purchase, 2nd purchase, ...)
CREATE VIEW NumberedPurchases AS
    SELECT p1.pid, p1.card_pan, p1.checkout_time,
        (
            SELECT COUNT(*)
            FROM RecentPurchases p2
            WHERE p2.card_pan = p1.card_pan
            AND p2.checkout_time <= p1.checkout_time
        ) AS purchase_number
    FROM RecentPurchases p1;


-- Step 3: Identify purchases that happen after the 5th purchase
-- These violate the fraud rule and must be deleted
CREATE VIEW PurchasesToDelete AS
    SELECT pid
    FROM NumberedPurchases
    WHERE purchase_number > 5;


-- Step 4: Delete line items first
-- We must delete these first because LineItem references Purchase
DELETE FROM LineItem
    WHERE pid IN (
        SELECT pid
        FROM PurchasesToDelete);


-- Step 5: Now delete the fraud purchases
DELETE FROM Purchase
    WHERE pid IN (
        SELECT pid
        FROM PurchasesToDelete);
