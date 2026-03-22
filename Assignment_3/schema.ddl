-- CHOICES AND ASSUMPTIONS 
-- Could Not:
-- ==================
-- CN: Could not enforce that every venue must have at 
-- least 10 seats as the domain does not specify an attribute
-- to keep track of seat count per venue. Introducing this
-- attribute would lead to redundancy. 

-- Did Not:
-- ==================

-- Extra Constraints
-- ==================
-- EC1: Using A1, we enforced the constraint that the combination 
-- of venue name, city and street_address should be unique. 
-- This ensures that we are not repeating the same venue, but 
-- allowing multiple venues to exist out of the same location.

-- Assumptions
-- ==================
-- A1: Multiple venues are allowed at the same address 
-- (ie. multiple concert halls in the same building)

-- A2: We assume that not every owner existing in the 
-- database owns a venue

-- A3: We assume that two concerts with the same name can 
-- occur at the same time in different venues. This is because 
-- two different artists can technically name their concert 
-- the same name (although rare).


-- Create the Concert Booking Schema 
DROP SCHEMA IF EXISTS TicketSchema CASCADE;
CREATE SCHEMA TicketSchema;
SET SEARCH_PATH TO TicketSchema;

-- A person, organization or company that owns at least one venue.
-- <ownerID> is the owner's ID, 
-- <owner_name> is the name of the owner, and
-- <phone> is the owner's associated phone number 
CREATE TABLE Owner (
	ownerID INT PRIMARY KEY,
    owner_name VARCHAR(50) NOT NULL,
	phone VARCHAR(20) UNIQUE NOT NULL
);

-- A venue in which concerts can be hosted.
-- <venueID> is the venue's ID, 
-- <venue_name> is the name of the venue, 
-- <city> is the city in which the venue is located, and
-- <street_address> is the specific address of the venue.
-- <ownerID> references the ID of the venue's owner, 
CREATE TABLE Venue (
	venueID INT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
	city VARCHAR(30) NOT NULL,
	street_address VARCHAR(30) NOT NULL,
	ownerID INT NOT NULL REFERENCES Owner(ownerID),
    UNIQUE (venue_name, city, street_address)
);

-- A specific seat section in a specific venue. 
-- <sectionID> is the unique ID of a specific section in some venue,
-- <section_name> is the name of the section, such as “floor level 1”, and
-- <venueID> is the ID of the venue the section belongs to
CREATE TABLE Section (
	sectionID INT PRIMARY KEY,
    section_name VARCHAR(30) NOT NULL,
	venueID INT NOT NULL REFERENCES Venue(venueID),
	UNIQUE(section_name, venueID)
);

-- A specific seat in a venue.
-- <seatID> is the unique ID of a specific seat, 
-- <seat_name> is the name/identifier of the seat, such as “B37”
-- <sectionID> is the ID of the venue section the seat is in 
-- <accessibility> denotes whether a seat is accessible 
CREATE TABLE Seat (
	seatID INT PRIMARY KEY,
    seat_name VARCHAR(20) NOT NULL,
	sectionID INT NOT NULL REFERENCES Section(sectionID),
	accessibility BOOLEAN NOT NULL,
	UNIQUE(seat_name, sectionID)
);

-- A specific concert held at some time at some venue.
-- <concertID> is the unique ID of the concert, 
-- <concert_name> is the name of the concert 
-- <venueID> is the ID of the venue the concert is held in
-- <start_time> is the time when the concert starts
CREATE TABLE Concert (
	concertID INT PRIMARY KEY,
    concert_name VARCHAR(100) NOT NULL,
	venueID INT NOT NULL REFERENCES Venue(venueID),
	start_time TIMESTAMP NOT NULL,
	UNIQUE(venueID, start_time)
);

-- The price of a ticket for a seat in a specific venue section of a concert.
-- <concertID> is the ID of the concert 
-- <sectionID> is the ID of the venue section. It is a specific section
-- in a specific venue  
-- <price> is the price for ticket in concertID with a seat in sectionID
CREATE TABLE ConcertSectionPrice (
	concertID INT,
	sectionID INT,
	price FLOAT NOT NULL CHECK (price > 0),
	PRIMARY KEY (concertID, sectionID),
	FOREIGN KEY (concertID) REFERENCES Concert(concertID),
	FOREIGN KEY (sectionID) REFERENCES Section(sectionID)
);

-- A ticket for one seat at a concert purchased by a customer.
-- <ticketID> is the ID of the ticket, 
-- <username> is the username of the customer who purchased the ticket, 
-- <seatID> is the ID of the seat on the ticket,  
-- <concertID> is the ID of the concert the ticket is for
-- <purchase_time> is the date and time of ticket purchase
CREATE TABLE Ticket (
	ticketID INT PRIMARY KEY,
	username VARCHAR(20) NOT NULL,
	seatID INT NOT NULL REFERENCES Seat(seatID),
	concertID INT NOT NULL REFERENCES Concert(concertID),
	purchase_time TIMESTAMP NOT NULL
);
