-- Curators
-- Vhea's Solution (Passes Autograder) 

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO Recommender;
DROP TABLE IF EXISTS q3 CASCADE;

CREATE TABLE q3 (
    CID INT NOT NULL,
    category_name TEXT NOT NULL,
    PRIMARY KEY(CID, category_name)
);

-- Pick out every item that was bought and who bought it, ending up with columns CID and IID. 
-- This makes sure that everyone we are working with actually bought something, and isn't someone who just left
-- a review on an item they didn't buy 
DROP VIEW IF EXISTS AllPurchasedItems CASCADE;

CREATE VIEW AllPurchasedItems AS 
    SELECT Purchase.CID AS CID, LineItem.IID AS IID
    FROM Purchase NATURAL JOIN LineItem;

-- On the condition that CID = CID and IID = IID, get all the reviews which are not NULL on all these items that were bought
-- We now have a table of items that were bought and reviewed, and who bought and reviewed it all in this table CID, IID, comment
DROP VIEW IF EXISTS AllPurchasedReviewedItems CASCADE;

CREATE VIEW AllPurchasedReviewedItems AS 
    SELECT review.CID, review.IID, review.comment 
    FROM AllPurchasedItems INNER JOIN Review 
        ON review.CID = AllPurchasedItems.CID 
        AND review.IID = AllPurchasedItems.IID
    WHERE review.comment IS NOT NULL;

-- All of the items that were bought and reviewed with their category and who bought them
DROP VIEW IF EXISTS PurchasedItemsInfo CASCADE;

CREATE VIEW PurchasedItemsInfo AS 
    SELECT AllPurchasedReviewedItems.CID, AllPurchasedReviewedItems.IID, item.category, AllPurchasedReviewedItems.comment 
    FROM AllPurchasedReviewedItems NATURAL JOIN Item;

-- Every item and their category: IID, category 
DROP VIEW IF EXISTS ItemCategories CASCADE;

CREATE VIEW ItemCategories AS 
    SELECT IID, category  
    FROM Item;

-- This is the ideal criteria, where every customer is a curator for every item category. 
-- Every possible customer, item and category combo is here 
DROP VIEW IF EXISTS EveryoneCurator CASCADE;

CREATE VIEW EveryoneCurator AS 
    SELECT Customer.CID, ItemCategories.IID, ItemCategories.category
    FROM ItemCategories, Customer;

-- Subtract our actual list of all of the items that were bought and reviewed by customers from that ideal list
-- Everything leftover will be customer, item and category combo that didnt happen

DROP VIEW IF EXISTS NonCurators CASCADE;

CREATE VIEW NonCurators AS 
    (SELECT CID, IID, category 
    FROM EveryoneCurator)
    EXCEPT 
    (SELECT CID, IID, category 
    FROM PurchasedItemsInfo);


-- Picking out the customer, category combinations that got completely eliminated in the 
-- subtraction from earlier will give us all the customers that bought everything in a category 
DROP VIEW IF EXISTS Curators CASCADE;

CREATE VIEW Curators AS 
    -- All the possible customer-category combinations 
    (SELECT DISTINCT CID, category
    FROM EveryoneCurator)

    EXCEPT 

    -- All customer-category combinations that were found to not be curator combos 
    (SELECT DISTINCT CID, category
    FROM NonCurators);

-- Profit 

-- Your query that answers the question goes below the "insert into" line:
INSERT INTO q3
SELECT CID, category
FROM Curators;
