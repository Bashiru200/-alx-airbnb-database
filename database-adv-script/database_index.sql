CREATE INDEX indx_user_email on User(email);
Create INDEX indx_property_review on Property(location);
Create INDEX indx_booking_total_price on Booking(total_price);

EXPLAIN ANALYZE 
    SELECT 
        User.email  
    FROM User  
    WHERE email = 'john@example.com';