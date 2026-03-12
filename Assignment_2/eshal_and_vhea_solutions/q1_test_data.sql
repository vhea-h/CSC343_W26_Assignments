-- Small sample dataset for Assignment 2.

-- Item(IID, category, description, price)
INSERT INTO Item VALUES
(11, 'Catagory A', 'Item A', 12.34),
(22, 'Catagory B', 'Item B', 56.78),
(33, 'Catagory C', 'Item C', 8.9);

-- Customer(CID, email, last_name, first_name, title)
INSERT INTO Customer VALUES
(101, 'a_customer@email.com', 'Apple', 'Alice', NULL);

-- Purchase(PID, CID, checkout_time, card_pan, card_type)
INSERT INTO Purchase VALUES
(1, 101, '2019-11-01', '12345', 'Visa');

-- LineItem(PID, IID, quantity)
INSERT INTO LineItem VALUES
(1, 11, 1),
(1, 22, 2),
(1, 33, 1);


