use A1
CREATE TABLE hotel
( hotel_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

CREATE TABLE room
( room_no VARCHAR(4) NOT NULL,
hotel_no CHAR(4) NOT NULL,
type CHAR(1) NOT NULL,
price DECIMAL(5,2) NOT NULL);

CREATE TABLE booking
(hotel_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no CHAR(4) NOT NULL);

CREATE TABLE guest
( guest_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

INSERT INTO hotel
VALUES ('H111', 'Grosvenor Hotel', 'London')

INSERT INTO room
VALUES ('1', 'H111', 'S', 72.00);

INSERT INTO guest
VALUES ('G111', 'John Smith', 'London');

INSERT INTO booking
VALUES ('H111', 'G111','1999-01-01','1999-01-02','1')

UPDATE room SET price = price*1.05;

CREATE TABLE booking_old
( hotel_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no VARCHAR(4) NOT NULL);

INSERT INTO booking_old
SELECT * FROM booking
WHERE date_to < 2000-01-01

DELETE FROM booking
WHERE date_to < 2000-01-01

--Simple Queries
--1. List full details of all hotels.
SELECT * FROM hotel

--2. List full details of all hotels in London.
SELECT * FROM hotel where address = 'London'

--3. List the names and addresses of all guests in London, alphabetically ordered by name.
SELECT name, address from guest order by name ASC

--4. List all double or family rooms with a price below £40.00 per night, in ascending order of
--   price.
SELECT * FROM room WHERE price < 40 order by price ASC

--5. List the bookings for which no date_to has been specified.
SELECT * FROM booking WHERE date_to is NULL

--Aggregate Function
--1.How many hotels are there?
SELECT count(name) from hotel

--2. What is the average price of a room?
SELECT AVG(price) as 'Average Price' from room

--3. What is the total revenue per night from all double rooms?
SELECT SUM(price) as 'Revenue per Night' FROM room

--4. How many different guests have made bookings for August?
SELECT count(guest_no) as 'Total Guest in August' FROM booking
WHERE month (date_from) = 8

--Subqueries and Joins
--1. List the price and type of all rooms at the Grosvenor Hotel.
SELECT R.price,R.type FROM room R
join hotel H
on H.hotel_no=R.hotel_no
where H.name='Grosvenor Hotel'

--2. List all guests currently staying at the Grosvenor Hotel.
SELECT G.name FROM guest G 
INNER JOIN booking B
on B.guest_no=G.guest_no
INNER JOIN hotel H
on B.hotel_no=H.hotel_no
WHERE H.name = 'Grosvenor Hotel'

--3. List the details of all rooms at the Grosvenor Hotel,
--   including the name of the guest staying in the room, if
--   the room is occupied.

SELECT R.room_no, R.price, R.type, G.name 
FROM room R 
INNER JOIN 
hotel H on R.hotel_no=H.hotel_no
INNER JOIN 
guest G ON H.address=G.address
WHERE H.name='Grosvenor Hotel'

--4. What is the total income from bookings for the Grosvenor Hotel today?
SELECT SUM(R.price) as 'Total Income' from room R
join hotel H
on R.hotel_no=H.hotel_no
join booking B 
on B.hotel_no=H.hotel_no
WHERE H.name='Grosvenor Hotel'

--5. List the rooms that are currently unoccupied at the Grosvenor Hotel.
SELECT r.room_no
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel'
AND r.room_no NOT IN (
    SELECT room_no
    FROM booking
    WHERE date_to IS NULL
)

--6. What is the lost income from unoccupied rooms at the Grosvenor Hotel?
SELECT SUM(r.price)
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel'
AND r.room_no NOT IN (
    SELECT room_no
    FROM booking
    WHERE date_to IS NULL
)

--Grouping
--1. List the number of rooms in each hotel.
SELECT h.name, COUNT(r.room_no) AS 'No. of Rooms'
FROM room r
JOIN hotel h
ON h.hotel_no = r.hotel_no
GROUP BY h.name

--2. List the number of rooms in each hotel in London.
SELECT h.name, COUNT(r.room_no) AS 'Total no. of Rooms'
FROM room r
JOIN hotel h
ON h.hotel_no = r.hotel_no
WHERE h.address = 'london'
GROUP BY h.name

--3. What is the average number of bookings for each hotel in August?
SELECT AVG(TotalBookings)
From (
    SELECT hotel_no, COUNT(*) AS TotalBookings
    FROM booking
    WHERE MONTH(date_from) = 8
    GROUP BY hotel_no
) AS subquery

--4. What is the most commonly booked room type for each hotel in London?
SELECT h.name, r.type, COUNT(b.room_no) AS 'Booking Count'
FROM booking b
JOIN room r 
ON b.room_no = r.room_no AND b.hotel_no = r.hotel_no
JOIN hotel h 
ON b.hotel_no = h.hotel_no
WHERE h.address = 'London'
GROUP BY h.name, r.type

--5. What is the lost income from unoccupied rooms at each hotel today?
SELECT h.name, SUM(r.price) AS 'Lost Income'
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE r.room_no NOT IN (
    SELECT room_no
    FROM booking
    WHERE date_to IS NULL
)
GROUP BY h.name


Select * FROM room
SELECT * FROM hotel
SELECT * FROM Booking
SELECT * FROM guest

