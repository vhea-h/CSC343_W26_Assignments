--Year-over-year sales
-- Eshal and Vhea Solution 

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO Recommender;
DROP TABLE IF EXISTS q6 CASCADE;

CREATE TABLE q6 (
    IID INT NOT NULL,
    year1 INT NOT NULL,
    year1_avg FLOAT NOT NULL,
    year2 INT NOT NULL,
    year2_avg FLOAT NOT NULL,
    yoy_change FLOAT NOT NULL
);

-- All years with purchase records 
DROP VIEW IF EXISTS AllPurchaseYears CASCADE;
CREATE VIEW AllPurchaseYears AS 
    SELECT EXTRACT(Year FROM checkout_time) AS year
    FROM Purchase;

-- All operational years
DROP VIEW IF EXISTS OperationalYears CASCADE;
CREATE VIEW OperationalYears AS 
    SELECT generate_series(min(year), max(year)) AS year 
    FROM AllPurchaseYears;

-- All months 
DROP VIEW IF EXISTS Months CASCADE;
CREATE VIEW Months AS
    SELECT generate_series(1, 12) AS mo;

-- Each month of each operational year 
DROP VIEW IF EXISTS OperationalMonths CASCADE;
CREATE VIEW OperationalMonths AS
    SELECT OperationalYears.year, Months.mo
    FROM OperationalYears, Months;

-- Every year, month, item combo 
DROP VIEW IF EXISTS EveryItemTimeCombo CASCADE;
CREATE VIEW EveryItemTimeCombo AS
    SELECT OperationalMonths.year, OperationalMonths.mo, Item.IID 
    FROM OperationalMonths, Item;

-- All items, their quantity and when they were sold 
DROP VIEW IF EXISTS PurchasedItems CASCADE;
CREATE VIEW PurchasedItems AS
    SELECT LineItem.IID, LineItem.quantity, EXTRACT(Year FROM checkout_time) AS year, EXTRACT(Month FROM checkout_time) AS mo
    FROM Purchase NATURAL JOIN LineItem;

-- All monthly totals for each year for every item
-- Columns: IID, Year, Month, Total Quantity 
-- Your query that answers the question goes below the "insert into" line:
DROP VIEW IF EXISTS MonthlyTotals CASCADE;
CREATE VIEW MonthlyTotals AS
    SELECT EveryItemTimeCombo.IID, EveryItemTimeCombo.year, EveryItemTimeCombo.mo, 
        COALESCE (sum(quantity), 0) AS total_quantity

    FROM EveryItemTimeCombo LEFT JOIN PurchasedItems
        ON EveryItemTimeCombo.year = PurchasedItems.year
        AND EveryItemTimeCombo.mo = PurchasedItems.mo
        AND EveryItemTimeCombo.IID = PurchasedItems.IID
    GROUP BY EveryItemTimeCombo.IID, EveryItemTimeCombo.year, EveryItemTimeCombo.mo;
    
-- All year averages 
DROP VIEW IF EXISTS YearlyAvg CASCADE;
CREATE VIEW YearlyAvg AS
    SELECT IID, year, avg(total_quantity)
    FROM MonthlyTotals
    GROUP BY IID, year;

-- All consecutive years
DROP VIEW IF EXISTS ConsecutiveYears CASCADE;
CREATE VIEW ConsecutiveYears AS 
    SELECT OY1.year AS year1, OY2.year AS year2
    FROM OperationalYears OY1 JOIN OperationalYears OY2 
        ON OY1.year + 1 =  OY2.year;

-- All consecutive years and the average item sales for each one
DROP VIEW IF EXISTS ConsecutiveYearAvg CASCADE;
CREATE VIEW ConsecutiveYearAvg AS 
    SELECT YA1.IID, CY.year1, YA1.avg AS year1_avg, CY.year2, YA2.avg AS year2_avg
    FROM ConsecutiveYears AS CY, YearlyAvg AS YA1, YearlyAvg AS YA2 
    WHERE CY.year1 = YA1.year AND CY.year2 = YA2.year AND YA1.IID = YA2.IID;

-- All consecutive years and the average item sales for each one, 
-- along with year to year changes 
DROP VIEW IF EXISTS YearlyChanges CASCADE;
CREATE VIEW YearlyChanges AS 
    SELECT IID, year1, year1_avg, year2, year2_avg,
    CASE
        WHEN year1_avg <> 0
            THEN ((year2_avg - year1_avg)/year1_avg) * 100 

        WHEN year1_avg = 0 AND year2_avg <> 0
            THEN 'infinity'

        WHEN year1_avg = 0 AND year2_avg = 0
            THEN 0

        ELSE ((year2_avg - year1_avg)/year1_avg) * 100 
    END AS yoy_change
    FROM ConsecutiveYearAvg;

INSERT INTO q6
SELECT IID, year1, year1_avg, year2, year2_avg, yoy_change
FROM YearlyChanges;
