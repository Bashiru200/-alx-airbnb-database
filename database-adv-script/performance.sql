-- Query to retrieve all bookings with user, property, and payment details
SELECT
Booking.booking_id,
Booking.start_date,
Booking.end_date,
Booking.total_price,
Booking.status,
User.user_id,
User.first_name,
User.last_name,
User.email,
Property.property_id,
Property.name AS property_name,
Property.location,
Property.price_per_night,
Payment.payment_id,
Payment.amount,
Payment.payment_method
FROM Booking
JOIN User ON Booking.user_id = User.user_id
JOIN Property ON Booking.property_id = Property.property_id
LEFT JOIN Payment ON Booking.booking_id = Payment.booking_id;

EXPLAIN SELECT * FROM Booking;
CREATE INDEX indx_booking_user ON Booking(user_id, property_id, first_name, last_name, status);
