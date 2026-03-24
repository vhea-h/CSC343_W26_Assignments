SET SEARCH_PATH TO TicketSchema;

-- A concert and a ticket sold for it, including 
-- concerts with no tickets sold
-- Columns: concertID, venueID, ticketID, seatID
DROP VIEW IF EXISTS AllConcertTickets CASCADE;
CREATE VIEW AllConcertTickets AS
    SELECT Concert.concertID, Concert.venueID,
    Ticket.ticketID, Ticket.seatID
    FROM Concert LEFT JOIN Ticket
        ON Concert.concertID = Ticket.concertID;

-- Total number of tickets sold for a concert 
-- Columns: concertID, num_tickets_sold
DROP VIEW IF EXISTS NumTickets CASCADE;
CREATE VIEW NumTickets AS 
    SELECT concertID, count(ticketID) as num_tickets_sold
    FROM AllConcertTickets
    GROUP BY concertID
    ORDER BY count(ticketID) DESC;

-- Total amount made from sales of a concert
-- Columns: concertID, net_sales 
DROP VIEW IF EXISTS TotalSales CASCADE;
CREATE VIEW TotalSales AS 
    SELECT AllConcertTickets.concertID, 
        COALESCE(SUM(ConcertSectionPrice.price), 0) AS net_sales
    FROM AllConcertTickets 
    LEFT JOIN Seat 
        ON AllConcertTickets.seatID = Seat.seatID
    LEFT JOIN ConcertSectionPrice
        ON Seat.sectionID = ConcertSectionPrice.sectionID
    GROUP BY AllConcertTickets.concertID;

-- Total number of seats available for a concert 
-- Columns: concertID, total_seats
DROP VIEW IF EXISTS TotalSeats CASCADE;
CREATE VIEW TotalSeats AS 
    SELECT Concert.concertID, count(Seat.seatID) AS total_seats
    FROM Concert
    LEFT JOIN Section 
        ON Concert.venueID = Section.venueID
    LEFT JOIN Seat 
        ON Section.sectionID = Seat.sectionID
    GROUP BY Concert.concertID;

-- The percentage of seats sold in the venue hosting a concert 
-- Note: Since we assume that a seat cannot be booked more than once
-- for the same concert, the number tickets sold = number seats sold
-- Columns: concertID, percent_venue_sold
DROP VIEW IF EXISTS PercentVenueSold CASCADE;
CREATE VIEW PercentVenueSold AS 
    SELECT NumTickets.concertID, 
        (CAST (num_tickets_sold AS FLOAT) / total_seats)*100 
            AS percent_venue_sold
    FROM NumTickets NATURAL JOIN TotalSeats;

-- The total number of tickets sold, total value of all tickets sold, 
-- and the percentage of the venue that was sold for a concert
-- Columns: concertID, num_tickets_sold, net_sales, percent_venue_sold
DROP VIEW IF EXISTS TicketSaleDetails CASCADE;
CREATE VIEW TicketSaleDetails AS 
    SELECT NumTickets.concertID, NumTickets.num_tickets_sold, 
        TotalSales.net_sales, PercentVenueSold.percent_venue_sold
    FROM NumTickets 
        NATURAL JOIN TotalSales 
        NATURAL JOIN PercentVenueSold
    ORDER BY num_tickets_sold DESC;


