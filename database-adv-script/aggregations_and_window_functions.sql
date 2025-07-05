-- a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.-- Query to find the total number of bookings made by each user
SELECT User.user_id, User.first_name, User.last_name, COUNT(Booking.booking_id) AS total_bookings
FROM User
LEFT JOIN Booking ON User.user_id = Booking.user_id
GROUP BY User.user_id, User.first_name, User.last_name;

-- a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

SELECT Property.property_id, Property.name, Property.price_per_night, 
       RANK() OVER (ORDER BY Property.price_per_night DESC) AS rank
FROM Property;