-- Best and Worst Categories

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO Recommender;
DROP TABLE IF EXISTS q4 CASCADE;

CREATE TABLE q4 (
    month TEXT NOT NULL,
    highest_category TEXT NOT NULL,
    highest_sales_val FLOAT NOT NULL,
    lowest_category TEXT NOT NULL,
    lowest_sales_val FLOAT NOT NULL
);

-- Drop old views if they exist
DROP VIEW IF EXISTS Months CASCADE;
DROP VIEW IF EXISTS Categories CASCADE;
DROP VIEW IF EXISTS MonthCategorySales CASCADE;
DROP VIEW IF EXISTS HighestSalesPerMonth CASCADE;
DROP VIEW IF EXISTS LowestSalesPerMonth CASCADE;
DROP VIEW IF EXISTS HighestCategories CASCADE;
DROP VIEW IF EXISTS LowestCategories CASCADE;


-- Step 1: List all months in year as strings like '01', '02', ... '12'
-- As we need to list all the months in a year in the answer
CREATE VIEW Months AS
SELECT to_char(generate_series(1, 12), 'FM09') AS month;

-- Step 2: We need every category in the database, even if it had no sales
CREATE VIEW Categories AS
SELECT DISTINCT category
FROM Item;


-- Step 3: Sales value for each category in each month of 2024
-- Start with every (month, category) pair using CROSS JOIN
-- Then we LEFT JOIN to items, line items, and purchases
CREATE VIEW MonthCategorySales AS
SELECT 
    m.month, 
    c.category,
    COALESCE(
            SUM(
                CASE 
                    WHEN EXTRACT(YEAR FROM p.checkout_time) = 2024
                    AND EXTRACT(MONTH FROM p.checkout_time) = CAST(m.month AS INTEGER)
                    THEN li.quantity * i.price
                    ELSE 0
                END
                ), 0
            ) AS sales_val
FROM Months m
CROSS JOIN Categories c
                        LEFT JOIN Item i ON i.category = c.category
                        LEFT JOIN LineItem li ON li.iid = i.iid
                        LEFT JOIN Purchase p ON p.pid = li.pid
GROUP BY m.month, c.category;


-- Step 4: Get highest sales value in each month
CREATE VIEW HighestSalesPerMonth AS
SELECT month, max(sales_val) AS highest_sales_val
FROM MonthCategorySales
GROUP BY month;


-- Step 5: Get lowest sales value in each month
CREATE VIEW LowestSalesPerMonth AS
SELECT month, min(sales_val) AS lowest_sales_val
FROM MonthCategorySales
GROUP BY month;


-- Step 6: all categories tied for highest in each month
CREATE VIEW HighestCategories AS
SELECT mcs.month, mcs.category AS highest_category, mcs.sales_val AS highest_sales_val
FROM MonthCategorySales mcs JOIN HighestSalesPerMonth h
                                                        ON mcs.month = h.month
                                                        AND mcs.sales_val = h.highest_sales_val;


-- Step  7: all categories tied for lowest in each month
CREATE VIEW LowestCategories AS
SELECT mcs.month, mcs.category AS lowest_category, mcs.sales_val AS lowest_sales_val
FROM MonthCategorySales mcs
JOIN LowestSalesPerMonth l ON mcs.month = l.month AND mcs.sales_val = l.lowest_sales_val;


-- Answer: Your query that answers the question goes below the "insert into" line:

-- Step 8: For each month, we want to show:
-- 1) the category with the highest total sales value
-- 2) the category with the lowest total sales value
-- If multiple categories tie for highest or lowest, we must include all of them
INSERT INTO q4
SELECT h.month AS month, h.highest_category AS highest_category, h.highest_sales_val AS highest_sales_val, l.lowest_category AS lowest_category, l.lowest_sales_val AS lowest_sales_val
FROM HighestCategories h JOIN LowestCategories l ON h.month = l.month;
