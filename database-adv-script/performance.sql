-- Query to retrieve all bookings with user, property, and payment details
SELECT
User.user_id,
User.first_name,
User.last_name,
User.email,


Property.property_id,
Property.name AS property_name,
Property.price_per_night,
Payment.amount,

Booking.booking_id,
Booking.start_date,
Booking.end_date,
Booking.total_price

FROM Booking
INNER JOIN User ON Booking.user_id = User.user_id
INNER JOIN Property ON Booking.property_id = Property.property_id
LEFT JOIN Payment ON Booking.booking_id = Payment.booking_id;

EXPLAIN ANALYZE SELECT * FROM Booking;

