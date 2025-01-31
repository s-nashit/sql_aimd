create database hotel;
use hotel;
-- Task 1: Create Tables for the Hotel Management System
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    address TEXT
);

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    availability_status ENUM('available', 'booked') DEFAULT 'available'
);

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status ENUM('confirmed', 'cancelled') DEFAULT 'confirmed',
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL UNIQUE,
    payment_date DATE NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Task 2: Define Relationships using an ER Diagram
-- Relationships: 
-- 1. Customers ↔ Bookings (One-to-many)
-- 2. Rooms ↔ Bookings (One-to-many)
-- 3. Bookings ↔ Payments (One-to-one)

-- Task 3: SQL Queries
-- 1. Retrieve a list of available rooms for a given date range
SELECT room_id, room_number, room_type, price_per_night
FROM rooms
WHERE availability_status = 'available';

-- 2. Calculate the total revenue generated in the last quarter
SELECT SUM(total_amount) AS total_revenue
FROM bookings
WHERE check_in_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
  AND status = 'confirmed';

-- 3. Retrieve booking details for a specific customer
SELECT c.customer_name, r.room_number, b.check_in_date, b.status
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN rooms r ON b.room_id = r.room_id
WHERE c.customer_id = 1; -- Replace ? with the specific customer_id

-- Task 4: Create Stored Procedure for Bulk Cancellations
DELIMITER //
CREATE PROCEDURE BulkCancellation(IN cancel_date DATE)
BEGIN
    -- Cancel bookings older than the given date
    UPDATE bookings
    SET status = 'cancelled'
    WHERE check_in_date < cancel_date;

    -- Update room availability
    UPDATE rooms
    SET availability_status = 'available'
    WHERE room_id IN (
        SELECT room_id
        FROM bookings
        WHERE check_in_date < cancel_date
    );
END //
DELIMITER ;

-- Task 5: Implement Customer Feedback System
CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    booking_id INT NOT NULL,
    rating TINYINT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Generate customer feedback report
SELECT r.room_type, AVG(f.rating) AS average_rating
FROM feedback f
JOIN bookings b ON f.booking_id = b.booking_id
JOIN rooms r ON b.room_id = r.room_id
GROUP BY r.room_type;
