INSERT INTO User (first_name, last_name, email, password_hash, phone_number, role_id) VALUES
('john', 'wick', 'john@example.com', 'password123', '704-123-4567',1),
('jane', 'doe', 'jane@example.com', 'securepass456', '704-987-6543',2),
('alice', 'smith', 'smith@gmail.com', 'alicepass789', '704-555-1234',2);

INSERT INTO Property (host_id, name, description, location, price_per_night) VALUES
(2, 'Me time Apartment', 'A nice and chill apartment away from home but feel like home.', '133 Gibbon St, Charlotte', 150.00),
(3, 'Beach House', 'A beautiful beach house with ocean views.', '456 Ocean Ave, Beach City', 250.00);

INSERT INTO Booking (user_id, property_id, start_date, end_date, total_price, status) VALUES
(1, 1, '2023-11-01', '2023-11-07',  720.00, 'confirmed'),
(2, 2, '2023-12-15', '2023-12-20', 1250.00, 'pending');

INSERT INTO Payment(booking_id, amount, payment_method) VALUES
(1, 720.00, 'credit_card'),
(2, 1250.00, 'paypal');

INSERT INTO Review (user_id, property_id, rating, comment) VALUES
(1, 1, 5, 'Amazing place! Highly recommend.'),
(2, 2, 4, 'Very nice beach house, but a bit pricey.');

INSERT INTO Message (receiver_id, sender_id, message_body) VALUES
(1, 1, 'Hi Jane, I love your property! Can we discuss the booking details?'),
(2, 2, 'Hi John, thank you for your interest! I am available to discuss anytime.');

INSERT INTO Role(role_name) VALUES
('guest'),
('host');
