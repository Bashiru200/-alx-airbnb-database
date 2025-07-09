CREATE INDEX indx_user_email on User(email);
Create INDEX indx_property_review on Property(location);
Create INDEX indx_booking_total_price on Booking(total_price);

EXPLAIN SELECT * FROM User WHERE email = 'john@example.com';

EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'john@example.com';
