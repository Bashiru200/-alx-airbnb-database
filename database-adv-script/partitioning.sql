CREATE TABLE Booking_partitioned (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,

    -- Generated column for partitioning
    start_year INT GENERATED ALWAYS AS (YEAR(start_date)) STORED,

    -- ✅ Must include start_year in the PRIMARY KEY
    PRIMARY KEY (booking_id, start_year),

    INDEX (start_year)
)
PARTITION BY RANGE (start_year)(
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);
-- Insert a sample booking record to test the partitioned table
INSERT INTO Booking_partitioned (
    booking_id, user_id, property_id, start_date, end_date, total_price, status
) VALUES (
    1, 1, 1, '2023-11-01', '2024-11-07', 720.00, 'confirmed'
);

SELECT PARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'Booking_partitioned';
