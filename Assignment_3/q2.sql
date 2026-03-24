SET SEARCH_PATH TO TicketSchema;

-- An owner and how many venues they own
-- Columns: ownerID, num_venues_owned
DROP VIEW IF EXISTS OwnedVenueCount CASCADE;
CREATE VIEW OwnedVenueCount AS
    SELECT Owner.ownerID, count(Venue.venueID) as num_venues_owned
    FROM Owner LEFT JOIN Venue 
        ON Owner.ownerID = Venue.ownerID
    GROUP BY Owner.ownerID
    ORDER BY count(Venue.venueID) DESC, Owner.ownerID;

SELECT * FROM OwnedVenueCount;
