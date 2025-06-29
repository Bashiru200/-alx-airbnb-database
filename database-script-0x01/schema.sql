CREATE TABLE User (
    user_id INT PRIMARY KEY UUID AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    role ENUM('guest','host','admin') NOT NULL DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE Property (
    properity _id INT PRIMARY KEY UUID AUTO_INCREMENT,
    host_id FOREIGN KEY REFERENCES User(user_id),
    name: VARCHAR(100) NOT NULL,
    descritption TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY UUID INDEX AUTO_INCREMENT,
    properity_id FOREIGN KEY REFERCENCES Property(properity_id),
    user_id FOREIGN KEY REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL
    status DECIMAL(pending,confirmed, canceled) NOT NULL
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY UUID INDEX AUTO_INCREMENT,
    booking_id FORIEGN KEY REFERENCES Booking(booking_id),
    amount DECIMAL NOT NULL
    payment_date TIMESTAMP DEFLAUT CURRENT_TIMESTAMP,
    payment_method ENUM(credit_card, debit_card, paypal) NOT NULL
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY UUID INDEX AUTO_INCREMENT,
    properity_id FOREIGN KEY REFERCENCES Property(properity_id),
    user_id FOREIGN KEY REFERENCES User(user_id),
    rating INT CHECK (rating >=1 AND RATING <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Message (
    message_id INT PRIMARY KEY UUID INDEX AUTO_INCREMENT,
    sender_id FOREIGN KEY REFERENCES User(user_id),
    receiver_id FOREIGN KEY REFERENCES User(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Role (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name ENUM('guest', 'host', 'admin') NOT NULL UNIQUE
);

-- Update the User table to reference the Role table
ALTER TABLE User
DROP COLUMN role,
ADD COLUMN role_id INT NOT NULL,
ADD FOREIGN KEY (role_id) REFERENCES Role(role_id);