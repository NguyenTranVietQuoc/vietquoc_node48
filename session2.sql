CREATE DATABASE node48_test
use node48_test

CREATE TABLE product1(
	product_name VARCHAR(100) NOT NULL,
	image VARCHAR(255),
	price DOUBLE,
	rate INT
)

INSERT INTO product1 (product_name, image, price, rate) VALUES
('Wireless Headphones', 'images/headphones.jpg', 49.99, 5),
('Gaming Mouse', 'images/mouse.jpg', 29.99, 4),
('Mechanical Keyboard', 'images/keyboard.jpg', 89.99, 4),
('Smartphone Stand', 'images/stand.jpg', 12.99, 5),
('Bluetooth Speaker', 'images/speaker.jpg', 35.50, 4),
('Fitness Tracker', 'images/fitness_tracker.jpg', 59.99, 3),
('Portable Charger', 'images/charger.jpg', 22.99, 4),
('LED Desk Lamp', 'images/lamp.jpg', 19.99, 5),
('Noise-Cancelling Earbuds', 'images/earbuds.jpg', 75.00, 5),
('Action Camera', 'images/camera.jpg', 129.99, 4),
('Smartwatch', 'images/smartwatch.jpg', 149.99, 4),
('Laptop Cooling Pad', 'images/cooling_pad.jpg', 25.50, 3),
('Virtual Reality Headset', 'images/vr_headset.jpg', 199.99, 4),
('4K Webcam', 'images/webcam.jpg', 59.99, 5),
('Wireless Charger', 'images/wireless_charger.jpg', 18.99, 4),
('Electric Toothbrush', 'images/toothbrush.jpg', 34.99, 4),
('Mini Projector', 'images/projector.jpg', 89.99, 4),
('Smart Home Assistant', 'images/assistant.jpg', 99.99, 5),
('Gaming Chair', 'images/chair.jpg', 179.99, 4),
('Streaming Microphone', 'images/microphone.jpg', 69.99, 4);

CREATE TABLE Users(
	full_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	phone VARCHAR(20),
	address VARCHAR(255),
	age INT
)

INSERT INTO Users (full_name, email, phone, address, age) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, Springfield, IL', 28),
('Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St, Boston, MA', 34),
('Emily Johnson', 'emily.johnson@example.com', '555-123-4567', '789 Maple Ave, Austin, TX', 25),
('Michael Brown', 'michael.brown@example.com', '444-321-5678', '321 Oak Rd, Denver, CO', 30),
('Sarah Davis', 'sarah.davis@example.com', '333-654-9870', '654 Pine Ln, Seattle, WA', 27),
('William Wilson', 'william.wilson@example.com', NULL, '987 Cedar St, Orlando, FL', 29),
('Olivia Garcia', 'olivia.garcia@example.com', '222-987-6543', '852 Birch Blvd, Phoenix, AZ', 31),
('James Martinez', 'james.martinez@example.com', '111-222-3333', NULL, 40),
('Sophia Anderson', 'sophia.anderson@example.com', '123-456-1234', '963 Aspen Dr, Portland, OR', 24),
('Benjamin Thomas', 'benjamin.thomas@example.com', '789-456-1234', '741 Willow Ave, Chicago, IL', 35),
('Charlotte Taylor', 'charlotte.taylor@example.com', '555-789-1234', NULL, 26),
('Daniel Moore', 'daniel.moore@example.com', '888-555-1234', '258 Chestnut Ct, Miami, FL', 32),
('Ava Martinez', 'ava.martinez@example.com', '999-123-4567', '369 Redwood St, Dallas, TX', 29),
('Ethan Harris', 'ethan.harris@example.com', '321-654-7890', '147 Cypress Blvd, Atlanta, GA', 33),
('Mia Clark', 'mia.clark@example.com', '654-789-1234', '753 Hemlock Ln, Los Angeles, CA', 28),
('Alexander White', 'alexander.white@example.com', '789-123-4567', '951 Sycamore St, Houston, TX', 36),
('Isabella Lewis', 'isabella.lewis@example.com', '123-789-6543', '852 Dogwood Dr, San Diego, CA', 25),
('Liam Walker', 'liam.walker@example.com', NULL, '159 Magnolia Ln, Las Vegas, NV', 31),
('Amelia Hall', 'amelia.hall@example.com', '321-456-9870', '753 Fir St, Salt Lake City, UT', 27),
('Noah Allen', 'noah.allen@example.com', '987-321-6543', '246 Redwood Blvd, Charlotte, NC', 29);

SELECT * from product1
SELECT product_name AS 'Tên Sản Phẩm' FROM product1

SELECT * FROM Users 
WHERE age > 25 AND 30 > age
ORDER BY age ASC

SELECT * FROM Users 
WHERE age > 25 AND 30 > age
ORDER BY age DESC

SELECT * FROM Users 
WHERE full_name LIKE '%John%'


-- tìm tuổi lớn nhất
-- C1: query lồng

SELECT * FROM Users 
WHERE age = ( 
	SELECT age FROM Users 
	ORDER BY age DESC 
	LIMIT 1
	)
-- Cách 2: DÙng kw MAX + query lồng
	
SELECT * FROM Users 
WHERE age = ( 
	SELECT MAX(age) FROM Users 
	)
	
-- Đếm số lượng

SELECT COUNT(*) 'Tổng số user' FROM Users

--Update and delete data

-- Phải có where để update, delete data cụ thể
UPDATE Users SET age = 30
WHERE full_name = 'John Doe'

--list
UPDATE Users SET age = 40
WHERE full_name IN ('John Doe', 'Sarah Davis')

--delete user
DELETE FROM Users 
WHERE full_name = 'Benjamin Thomas'
--=> hard delete

--soft delete
-- is_delete or deleted_at to show or hidden
--data

--update table
--case 1 : insert more column
ALTER TABLE Users 
ADD COLUMN gender INT DEFAULT 1


--case 2 : update datatype for column
ALTER TABLE Users 
MODIFY COLUMN full_name VARCHAR(100) NOT NULL

