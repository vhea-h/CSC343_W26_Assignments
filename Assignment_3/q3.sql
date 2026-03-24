SET SEARCH_PATH TO TicketSchema;

-- Total number of seats available for a venue 
-- Columns: concertID, total_seats
DROP VIEW IF EXISTS TotalSeats CASCADE;
CREATE VIEW TotalSeats AS 
    SELECT Venue.venueID, count(Seat.seatID) AS total_seats
    FROM Venue
        LEFT JOIN Section 
            ON Venue.venueID = Section.venueID
        LEFT JOIN Seat 
            ON Section.sectionID = Seat.sectionID
    GROUP BY Venue.venueID;

-- Total number of accessible seats available for a venue 
-- Columns: concertID, total_accessible_seats
DROP VIEW IF EXISTS TotalAccessibleSeats CASCADE;
CREATE VIEW TotalAccessibleSeats AS 
    SELECT Venue.venueID, count(Seat.seatID) AS total_accessible_seats
    FROM Venue
        LEFT JOIN Section 
            ON Venue.venueID = Section.venueID
        LEFT JOIN Seat 
            ON Section.sectionID = Seat.sectionID
            AND seat.accessibility = TRUE
    GROUP BY Venue.venueID;

-- Total percentage of accessible seats available for a venue 
-- Columns: concertID, total_seats, percent_accessible_seats
DROP VIEW IF EXISTS PercentAccessibleSeats CASCADE;
CREATE VIEW PercentAccessibleSeats AS 
    SELECT TotalSeats.venueID, TotalSeats.total_seats,
    (CAST (TotalAccessibleSeats.total_accessible_seats AS FLOAT) 
        / TotalSeats.total_seats)*100 AS percent_accessible_seats
    
    FROM TotalSeats LEFT JOIN TotalAccessibleSeats
        ON TotalSeats.venueID = TotalAccessibleSeats.venueID
    ORDER BY TotalSeats.total_seats DESC, TotalSeats.venueID;

SELECT * FROM PercentAccessibleSeats;
    
