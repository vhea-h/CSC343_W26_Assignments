-- Populates the ticketschema tables with sample data
-- Eshal and Vhea generated

-- Owner
INSERT INTO Owner VALUES
    (1, 'Ida Florence', '416-123-0001'),
    (2, 'Qualcomm', '416-123-0003'),
    (3, 'Alphawave', '416-123-0003'),
    (4, 'AMD', '416-123-0004'),
    (5, 'The Builder', '416-123-0005'),
    (6, 'Duke Clarence', '416-123-0006');

-- Venue
INSERT INTO Venue VALUES
    (101, 'Scotia Arena', 'Toronto', '40 Bay St.', 1),
    (102, 'Adelaide Hall', 'Toronto', '250 Adelaide St W, Toronto', 2),
    (103, 'Massey Hall', 'Toronto', '178 Victoria St', 2),
    (104, 'Place des Arts', 'Montreal', '175 Rue Sainte-Catherine O', 2),
    (105, 'MTELUS', 'Montreal', '59 Rue Sainte-Catherine E', 3),
    (106, 'Théâtre Fairmount', 'Montreal', '5240 Av. du Parc, Montréal', 3),
    (107, 'Bronson Centre', 'Ottawa', '211 Bronson Ave', 4),
    (108, 'Maxwell’s Concerts and Events', 'Waterloo', '35 University Ave E', 6),
    (109, 'Rogers Arena', 'Vancouver', '800 Griffiths Wy', 4),
    (110, 'Orpheum', 'Vancouver', '601 Smithe St, Vancouver', 6);

-- Section
INSERT INTO Section VALUES

    -- Scotia Arena Sections 
    (201, 'Floor', 101),
    (202, 'Balcony', 101),
    (203, 'Top Box', 101),

    -- Adelaide Hall
    (204, 'Main', 102),

    -- Place des Arts
    (205, 'Balcony', 102),

    -- MTELUS
    (206, 'Balcony', 102),

    -- Théâtre Fairmount
    (207, 'Balcony', 102),

    -- Bronson Centre
    (208, 'Balcony', 102),

    -- Maxwell’s Concerts and Events
    (209, 'Balcony', 102),

    -- Rogers Arena
    (210, 'Balcony', 102),

    -- Orpheum
    (211, 'Balcony', 102);

-- Seat

INSERT INTO Seat VALUES

    -- MTELUS Balcony Seats (10 Seats)
    (3001, 'B1', 206, TRUE),
    (3002, 'B2', 206, TRUE),
    (3003, 'B3', 206, TRUE),
    (3004, 'B4', 206, TRUE),
    (3005, 'B5', 206, TRUE),
    (3006, 'B6', 206, TRUE),
    (3007, 'B7', 206, TRUE),
    (3008, 'B8', 206, TRUE),
    (3009, 'B9', 206, TRUE),
    (3010, 'B10', 206, TRUE),

    -- Théâtre Fairmount Balcony Seats (10 Seats)
    (3011, 'B1', 201, TRUE),
    (3012, 'B2', 201, TRUE),
    (3013, 'B3', 201, TRUE),
    (3014, 'B4', 201, FALSE),
    (3015, 'B5', 201, FALSE),
    (3016, 'B6', 201, FALSE),
    (3017, 'B7', 201, FALSE),
    (3018, 'B8', 201, FALSE),
    (3019, 'B9', 201, FALSE),
    (3020, 'B10', 201, FALSE),

    -- MTELUS Balcony Seats (10 Seats)
    (3001, 'B1', 201, TRUE),
    (3002, 'B2', 201, TRUE),
    (3003, 'B3', 201, TRUE),
    (3004, 'B4', 201, FALSE),
    (3005, 'B5', 201, FALSE),
    (3006, 'B6', 201, FALSE),
    (3007, 'B7', 201, FALSE),
    (3008, 'B8', 201, FALSE),
    (3009, 'B9', 201, FALSE),
    (3010, 'B10', 201, FALSE),

    -- Scotia Arena Floor Seats (30 Seats)
    (301, 'F1', 201, TRUE),
    (302, 'F2', 201, TRUE),
    (303, 'F3', 201, TRUE),
    (304, 'F4', 201, FALSE),
    (305, 'F5', 201, FALSE),
    (306, 'F6', 201, FALSE),
    (307, 'F7', 201, FALSE),
    (308, 'F8', 201, FALSE),
    (309, 'F9', 201, FALSE),
    (310, 'F10', 201, FALSE),

    (311, 'F11', 201, TRUE),
    (312, 'F12', 201, TRUE),
    (313, 'F13', 201, TRUE),
    (314, 'F14', 201, FALSE),
    (315, 'F15', 201, FALSE),
    (316, 'F16', 201, FALSE),
    (317, 'F17', 201, FALSE),
    (318, 'F18', 201, FALSE),
    (319, 'F19', 201, FALSE),
    (320, 'F20', 201, FALSE),

    (321, 'F21', 201, TRUE),
    (322, 'F22', 201, TRUE),
    (323, 'F23', 201, TRUE),
    (324, 'F24', 201, FALSE),
    (325, 'F25', 201, FALSE),
    (326, 'F26', 201, FALSE),
    (327, 'F27', 201, FALSE),
    (328, 'F28', 201, FALSE),
    (329, 'F29', 201, FALSE),
    (330, 'F30', 201, FALSE),

    -- Scotia Arena Balcony Seats (20 Seats)
    (331, 'B1', 201, TRUE),
    (332, 'B2', 201, TRUE),
    (333, 'B3', 201, TRUE),
    (334, 'B4', 201, FALSE),
    (335, 'B5', 201, FALSE),
    (336, 'B6', 201, FALSE),
    (337, 'B7', 201, FALSE),
    (338, 'B8', 201, FALSE),
    (339, 'B9', 201, FALSE),
    (340, 'B10', 201, FALSE),

    (341, 'B11', 201, TRUE),
    (342, 'B12', 201, TRUE),
    (343, 'B13', 201, TRUE),
    (344, 'B14', 201, FALSE),
    (345, 'B15', 201, FALSE),
    (346, 'B16', 201, FALSE),
    (347, 'B17', 201, FALSE),
    (348, 'B18', 201, FALSE),
    (349, 'B19', 201, FALSE),
    (350, 'B20', 201, FALSE),

    -- Scotia Arena Top Box Seats (10 Seats)
    (351, 'T1', 201, TRUE),
    (352, 'T2', 201, TRUE),
    (353, 'T3', 201, TRUE),
    (354, 'T4', 201, FALSE),
    (355, 'T5', 201, FALSE),
    (356, 'T6', 201, FALSE),
    (357, 'T7', 201, FALSE),
    (358, 'T8', 201, FALSE),
    (359, 'T9', 201, FALSE),
    (360, 'T10', 201, FALSE),

    -- Adelaide Hall Main Section Seats (15 Seats)
    (361, 'M1', 201, TRUE),
    (362, 'M2', 201, TRUE),
    (363, 'M3', 201, TRUE),
    (364, 'M4', 201, FALSE),
    (365, 'M5', 201, FALSE),
    (366, 'M6', 201, FALSE),
    (367, 'M7', 201, FALSE),
    (368, 'M8', 201, FALSE),
    (369, 'M9', 201, FALSE),
    (370, 'M10', 201, FALSE),
    (371, 'M11', 201, TRUE),
    (372, 'M12', 201, TRUE),
    (373, 'M13', 201, TRUE),
    (374, 'M14', 201, FALSE),
    (375, 'M15', 201, FALSE),

    -- Place des Arts
    (381, 'B1', 201, TRUE),
    (382, 'B2', 201, TRUE),
    (383, 'B3', 201, TRUE),
    (384, 'B4', 201, FALSE),
    (385, 'B5', 201, FALSE),
    (386, 'B6', 201, FALSE),
    (387, 'B7', 201, FALSE),
    (388, 'B8', 201, FALSE),
    (389, 'B9', 201, FALSE),
    (390, 'B10', 201, FALSE);

-- Concert 
INSERT INTO Concert VALUES
    --Taylor at Scotia  
    (401, 'Taylor Swift Eras Tour', 101, '2026-02-01 19:00:00'), 

    -- Ed Sheeran at Adelaide Hall
    (402, 'Ed Sheeran Divide', 102, '2026-02-16 17:00:00'), 

    -- Harry Styles at Place des Arts
    (403, 'Harry Styles Together Together', 103, '2026-03-01 20:00:00'), 

    -- Connor Price at Scotia 
    (404, 'Connor Price Tour', 101, '2026-03-20 18:00:00');

-- ConcerSectionPrice 
INSERT INTO ConcertSectionPrice VALUES

    -- Taylor Swift Scotia Tickets 
    (401, 201, 90.00), -- Floor
    (401, 202, 120.00), -- Balcony 
    (401, 203, 300.00), -- Top Box 

    -- Ed Sheeran Adelaide Hall Tickets
    (402, 204, 150.00), -- Main

    -- Harry Styles Place des Arts Tickets 
    (403, 205, 110.00); -- Balcony 

-- Ticket 
INSERT INTO Ticket VALUES

    -- Taylor Swift Tickets - 51 Sold 
    (5001, 'alex', 3001, 401, '2026-03-01 10:00:00');
