-- Helpfulness


-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO Recommender;
DROP TABLE IF EXISTS q2 CASCADE;

create table q2(
    CID INTEGER,
    name TEXT NOT NULL,
    helpfulness_category TEXT NOT NULL
);

-- Drop intermediate views if they already exist
DROP VIEW IF EXISTS HelpfulReviews CASCADE;
DROP VIEW IF EXISTS ReviewCounts CASCADE;


-- Step 1: Find reviews that are considered "helpful"
-- A review is helpful if TRUE votes > FALSE votes
CREATE VIEW HelpfulReviews AS
SELECT reviewer AS cid, iid
FROM Helpfulness
GROUP BY reviewer, iid
HAVING
    SUM(CASE WHEN helpfulness = TRUE THEN 1 ELSE 0 END) >
    SUM(CASE WHEN helpfulness = FALSE THEN 1 ELSE 0 END);


-- Step 2: Count total reviews and helpful reviews for each customer
CREATE VIEW ReviewCounts AS
    SELECT c.cid, COUNT(r.iid) AS total_reviews, COUNT(hr.iid) AS helpful_reviews
    FROM Customer c
        LEFT JOIN Review r ON c.cid = r.cid
        LEFT JOIN HelpfulReviews hr ON r.cid = hr.cid AND r.iid = hr.iid
    GROUP BY c.cid;


-- Answer: Your query that answers the question goes below the "insert into" line:

-- Step 3: Each cutomers CID, their name, and their helpfulness score
INSERT INTO q2
    SELECT
        c.cid AS cid,
        c.first_name || ' ' || c.last_name AS name,

        CASE
            -- If a customer has no reviews then score = 0
            WHEN rc.total_reviews = 0 THEN 'not helpful'

            -- Otherwise, score = helpful_reviews / total_reviews
            
            WHEN (rc.helpful_reviews::FLOAT / rc.total_reviews) >= 0.8
                THEN 'very helpful'

            WHEN (rc.helpful_reviews::FLOAT / rc.total_reviews) >= 0.5
                THEN 'somewhat helpful'

            ELSE 'not helpful'
        END AS helpfulness_category

    FROM Customer c LEFT JOIN ReviewCounts rc ON c.cid = rc.cid;
