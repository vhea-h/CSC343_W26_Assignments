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

    -- 101 Scotia Arena Sections 
    (201, 'Floor', 101),
    (202, 'Balcony', 101),
    (203, 'Top Box', 101),

    -- 102 Adelaide Hall
    (204, 'Main', 102),

    -- 103 Massey Hall 
    (212, 'Main', 103),

    -- 104 Place des Arts
    (205, 'Balcony', 104),

    -- 105 MTELUS
    (206, 'Balcony', 105),

    -- 106 Théâtre Fairmount
    (207, 'Balcony', 106),

    -- 107 Bronson Centre
    (208, 'Balcony', 107),

    -- 108 Maxwell’s Concerts and Events
    (209, 'Balcony', 108),

    -- 109 Rogers Arena
    (210, 'Balcony', 109),

    -- 110 Orpheum
    (211, 'Balcony', 110);

-- Seat

INSERT INTO Seat VALUES

    -- 103 Massey Hall Balcony Seats (10 Seats)
    (3001, 'B1', 212, TRUE),
    (3002, 'B2', 212, TRUE),
    (3003, 'B3', 212, TRUE),
    (3004, 'B4', 212, TRUE),
    (3005, 'B5', 212, TRUE),
    (3006, 'B6', 212, TRUE),
    (3007, 'B7', 212, TRUE),
    (3008, 'B8', 212, TRUE),
    (3009, 'B9', 212, TRUE),
    (3010, 'B10', 212, FALSE),

    -- 105 MTELUS Balcony Seats (10 Seats)
    (3011, 'B1', 206, TRUE),
    (3012, 'B2', 206, TRUE),
    (3013, 'B3', 206, TRUE),
    (3014, 'B4', 206, TRUE),
    (3015, 'B5', 206, TRUE),
    (3016, 'B6', 206, TRUE),
    (3017, 'B7', 206, TRUE),
    (3018, 'B8', 206, TRUE),
    (3019, 'B9', 206, TRUE),
    (3020, 'B10', 206, TRUE),

    -- 106 Théâtre Fairmount Balcony Seats (10 Seats)
    (3021, 'B1', 207, TRUE),
    (3022, 'B2', 207, TRUE),
    (3023, 'B3', 207, TRUE),
    (3024, 'B4', 207, TRUE),
    (3025, 'B5', 207, TRUE),
    (3026, 'B6', 207, FALSE),
    (3027, 'B7', 207, FALSE),
    (3028, 'B8', 207, FALSE),
    (3029, 'B9', 207, FALSE),
    (3030, 'B10', 207, FALSE),

    -- 107 Bronson Centre Balcony Seats (10 Seats)
    (3031, 'B1', 208, FALSE),
    (3032, 'B2', 208, FALSE),
    (3033, 'B3', 208, FALSE),
    (3034, 'B4', 208, FALSE),
    (3035, 'B5', 208, FALSE),
    (3036, 'B6', 208, FALSE),
    (3037, 'B7', 208, FALSE),
    (3038, 'B8', 208, FALSE),
    (3039, 'B9', 208, FALSE),
    (3040, 'B10', 208, FALSE),

    -- 108 Maxwell’s Concerts and Events Balcony Seats (10 Seats)
    (3041, 'B1', 209, TRUE),
    (3042, 'B2', 209, TRUE),
    (3043, 'B3', 209, FALSE),
    (3044, 'B4', 209, FALSE),
    (3045, 'B5', 209, FALSE),
    (3046, 'B6', 209, FALSE),
    (3047, 'B7', 209, FALSE),
    (3048, 'B8', 209, FALSE),
    (3049, 'B9', 209, FALSE),
    (3050, 'B10', 209, FALSE),

    -- 109 Rogers Arena Balcony Seats (10 Seats)
    (3051, 'B1', 210, TRUE),
    (3052, 'B2', 210, FALSE),
    (3053, 'B3', 210, FALSE),
    (3054, 'B4', 210, FALSE),
    (3055, 'B5', 210, FALSE),
    (3056, 'B6', 210, FALSE),
    (3057, 'B7', 210, FALSE),
    (3058, 'B8', 210, FALSE),
    (3059, 'B9', 210, FALSE),
    (3060, 'B10', 210, FALSE),

    -- 110 Orpheum Balcony Seats (10 Seats)
    (3061, 'B1', 211, FALSE),
    (3062, 'B2', 211, TRUE),
    (3063, 'B3', 211, TRUE),
    (3064, 'B4', 211, TRUE),
    (3065, 'B5', 211, TRUE),
    (3066, 'B6', 211, TRUE),
    (3067, 'B7', 211, TRUE),
    (3068, 'B8', 211, TRUE),
    (3069, 'B9', 211, TRUE),
    (3070, 'B10', 211, FALSE),

    -- 101 Scotia Arena Floor Seats (30 Seats)
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

    -- 101 Scotia Arena Balcony Seats (20 Seats)
    (331, 'B1', 202, TRUE),
    (332, 'B2', 202, TRUE),
    (333, 'B3', 202, TRUE),
    (334, 'B4', 202, FALSE),
    (335, 'B5', 202, FALSE),
    (336, 'B6', 202, FALSE),
    (337, 'B7', 202, FALSE),
    (338, 'B8', 202, FALSE),
    (339, 'B9', 202, FALSE),
    (340, 'B10', 202, FALSE),

    (341, 'B11', 202, TRUE),
    (342, 'B12', 202, TRUE),
    (343, 'B13', 202, TRUE),
    (344, 'B14', 202, FALSE),
    (345, 'B15', 202, FALSE),
    (346, 'B16', 202, FALSE),
    (347, 'B17', 202, FALSE),
    (348, 'B18', 202, FALSE),
    (349, 'B19', 202, FALSE),
    (350, 'B20', 202, FALSE),

    -- 101 Scotia Arena Top Box Seats (10 Seats)
    (351, 'T1', 203, TRUE),
    (352, 'T2', 203, TRUE),
    (353, 'T3', 203, TRUE),
    (354, 'T4', 203, FALSE),
    (355, 'T5', 203, FALSE),
    (356, 'T6', 203, FALSE),
    (357, 'T7', 203, FALSE),
    (358, 'T8', 203, FALSE),
    (359, 'T9', 203, FALSE),
    (360, 'T10', 203, FALSE),

    -- 102 Adelaide Hall Main Section Seats (15 Seats)
    (361, 'M1', 204, TRUE),
    (362, 'M2', 204, TRUE),
    (363, 'M3', 204, TRUE),
    (364, 'M4', 204, FALSE),
    (365, 'M5', 204, FALSE),
    (366, 'M6', 204, FALSE),
    (367, 'M7', 204, FALSE),
    (368, 'M8', 204, FALSE),
    (369, 'M9', 204, FALSE),
    (370, 'M10', 204, FALSE),
    (371, 'M11', 204, TRUE),
    (372, 'M12', 204, TRUE),
    (373, 'M13', 204, TRUE),
    (374, 'M14', 204, FALSE),
    (375, 'M15', 204, FALSE),

    -- 104 Place des Arts
    (381, 'B1', 205, TRUE),
    (382, 'B2', 205, TRUE),
    (383, 'B3', 205, TRUE),
    (384, 'B4', 205, FALSE),
    (385, 'B5', 205, FALSE),
    (386, 'B6', 205, FALSE),
    (387, 'B7', 205, FALSE),
    (388, 'B8', 205, FALSE),
    (389, 'B9', 205, FALSE),
    (390, 'B10', 205, FALSE);

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
    (5001, 'joe', 301, 401, '2026-03-01 10:00:00'),
    (5002, 'joe', 302, 401, '2026-03-01 10:00:00'),
    (5003, 'joe', 303, 401, '2026-03-01 10:00:00'),
    (5004, 'joe', 304, 401, '2026-03-01 10:00:00'),
    (5005, 'joe', 305, 401, '2026-03-01 10:00:00');

    -- TODO: ADD REST OF THE TICKETS 
