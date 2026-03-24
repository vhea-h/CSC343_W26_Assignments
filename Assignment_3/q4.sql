SET SEARCH_PATH TO TicketSchema;

-- Total number of tickets purchased by a user
-- Columns: username, num_tickets_purchased
DROP VIEW IF EXISTS TotalTicketsPurchased CASCADE;
CREATE VIEW TotalTicketsPurchased AS 
    SELECT Ticket.username, 
        count(Ticket.ticketID) AS num_tickets_purchased
    FROM Ticket
    GROUP BY username
    ORDER BY count(Ticket.ticketID) DESC;

-- Total maximum number of tickets purchased by a user
-- Columns: username, max_tickets_purchased
DROP VIEW IF EXISTS MaxTicketsPurchased CASCADE;
CREATE VIEW MaxTicketsPurchased AS 
    SELECT num_tickets_purchased
    FROM TotalTicketsPurchased
    ORDER BY num_tickets_purchased DESC
    LIMIT 1;

-- A user who has purchased the most tickets (ties allowed)
-- Columns: username, total 
DROP VIEW IF EXISTS MostTicketsPurchased CASCADE;
CREATE VIEW MostTicketsPurchased AS 
    SELECT * 
    FROM TotalTicketsPurchased
    WHERE TotalTicketsPurchased.num_tickets_purchased IN
        (SELECT MaxTicketsPurchased.num_tickets_purchased
        FROM  MaxTicketsPurchased)
        ORDER BY username;

SELECT * FROM MostTicketsPurchased;

    
