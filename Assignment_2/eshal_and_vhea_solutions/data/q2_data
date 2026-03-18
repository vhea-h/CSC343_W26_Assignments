-- Small sample dataset for Assignment 2.
-- to test Part 1, Question 2 (Helpfulness)

-- Item(IID, category, description, price)
INSERT INTO Item VALUES
(1, 'Book', 'Cloud Atlas', 21.00),
(2, 'Book', 'A Thousand Splendid Suns', 14.00),
(3, 'Book', 'Homegoing', 22.00),
(4, 'Book', 'Trickster', 18.00),
(5, 'Toy', 'Lego Hogwarts School of Witchcraft and Wizardry', 99.00),

(6, 'Book', 'Test Book 6', 10.00),
(7, 'Book', 'Test Book 7', 10.00),
(8, 'Book', 'Test Book 8', 10.00),
(9, 'Book', 'Test Book 9', 10.00),
(10, 'Book', 'Test Book 10', 10.00),
(11, 'Book', 'Test Book 11', 10.00),
(12, 'Book', 'Test Book 12', 10.00),
(13, 'Book', 'Test Book 13', 10.00),
(14, 'Book', 'Test Book 14', 10.00),
(15, 'Book', 'Test Book 15', 10.00);

INSERT INTO Customer VALUES
(1599, 'g@g.com', 'Granger', 'Hermione', 'Ms'),
(1518, 'p@p.com', 'Potter', 'Harry', 'Mr'),
(1515, 'w@w.com', 'Weasley', 'Ron', 'Master'),
(1500, 'albus@w.com', 'Dumbledor', 'Albus', 'Professor'),
(1600, 'Draco@h.com', 'Draco', 'Draco', 'Mr'),
(1601, 'Avery@e.com', 'Avery', 'Avery', 'Mr'),
(1602, 'Blair@b.com', 'Blair', 'Blair', 'Mr'),
(1603, 'Nina@n.com', 'Nina', 'Nina', 'Mr');

-- Purchase(PID, CID, checkout_time, card_pan, card_type)
INSERT INTO Purchase VALUES
(100, 1515, '2024-11-01', '12345', 'Amex'),
(101, 1500, '2024-11-01', '64210', 'Visa'),
(102, 1518, '2023-01-01', '99999', 'Mastercard');


-- LineItem(PID, IID, quantity)
INSERT INTO LineItem VALUES
(100, 4, 1),
(100, 1, 2),
(100, 5, 1),
(101, 2, 4),
(102, 3, 10);


-- Review(CID, IID, rating, comment)
INSERT INTO Review VALUES
(1515, 4, 5, 'Fantastic read!'),
(1518, 4, 5, 'Ron said it was fantastic and he was right!!!'),

(1600, 6, 5, 'Good'),
(1600, 7, 4, 'Okay'),

(1601, 8, 5, 'R1'),
(1601, 9, 5, 'R2'),
(1601, 10, 5, 'R3'),
(1601, 11, 5, 'R4'),
(1601, 12, 5, 'R5'),

(1602, 13, 2, 'Bad review 1'),
(1602, 14, 2, 'Bad review 2'),

(1603, 15, 3, 'Nobody rated this');

INSERT INTO Helpfulness VALUES
(1515, 4, 1599, FALSE),
(1515, 4, 1518, TRUE),
(1515, 4, 1515, TRUE),
(1515, 4, 1500, TRUE),

(1518, 4, 1599, TRUE),
(1518, 4, 1515, TRUE),
(1518, 4, 1500, FALSE),

(1600, 6, 1599, TRUE),
(1600, 6, 1515, TRUE),
(1600, 6, 1518, FALSE),

(1600, 7, 1599, TRUE),
(1600, 7, 1515, FALSE),

(1601, 8, 1599, TRUE),
(1601, 8, 1515, TRUE),

(1601, 9, 1599, TRUE),
(1601, 9, 1515, FALSE),
(1601, 9, 1518, TRUE),

(1601, 10, 1599, TRUE),

(1601, 11, 1500, FALSE),
(1601, 11, 1515, TRUE),
(1601, 11, 1518, TRUE),

(1601, 12, 1599, FALSE),
(1601, 12, 1515, FALSE),
(1601, 12, 1518, TRUE),

(1602, 13, 1599, TRUE),
(1602, 13, 1515, FALSE),

(1602, 14, 1599, FALSE),
(1602, 14, 1515, FALSE),
(1602, 14, 1518, TRUE);


-- 1500 Albus Dumbledor:
--   - wrote no reviews
--   - score = 0
--   - expected: not helpful
--
-- 1515 Ron Weasley:
--   - wrote 1 review
--   - that review is helpful
--   - score = 1/1 = 1.0
--   - expected: very helpful
--
-- 1518 Harry Potter:
--   - wrote 1 review
--   - that review is helpful
--   - score = 1/1 = 1.0
--   - expected: very helpful
--
-- 1599 Hermione Granger:
--   - wrote no reviews
--   - score = 0
--   - expected: not helpful
--
-- 1600 Draco:
--   - wrote 2 reviews
--   - 1 helpful, 1 not helpful
--   - score = 1/2 = 0.5
--   - expected: somewhat helpful
--
-- 1601 Avery Eight:
--   - wrote 5 reviews
--   - 4 helpful, 1 not helpful
--   - score = 4/5 = 0.8
--   - expected: very helpful
--
-- 1602 Blair Bad:
--   - wrote 2 reviews
--   - 0 helpful
--   - score = 0/2 = 0
--   - expected: not helpful
--
-- 1603 Nina NoRate:
--   - wrote 1 review
--   - but it has no helpfulness ratings at all
--   - score = 0/1 = 0
--   - expected: not helpful


-- Final expected q2 output
-- 1500 | Albus Dumbledor  | not helpful
-- 1515 | Ron Weasley      | very helpful
-- 1518 | Harry Potter     | very helpful
-- 1599 | Hermione Granger | not helpful
-- 1600 | Draco Draco       | somewhat helpful
-- 1601 | Avery Avery      | very helpful
-- 1602 | Blair Blair        | not helpful
-- 1603 | Nina Nina      | not helpful
