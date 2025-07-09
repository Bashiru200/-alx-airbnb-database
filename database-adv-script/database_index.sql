CREATE INDEX indx_user_email on User(email);
Create INDEX indx_property_review on Property(location);
Create INDEX indx_booking_total_price on Booking(total_price);

ANALYZE FORMAT=JSON SELECT * FROM User WHERE indx_user_email = 'john@example.com';