use xyz;
CREATE TABLE Hotel 
( Hotel_No INT PRIMARY KEY, Name VARCHAR(20), Address VARCHAR(100));
SELECT * FROM Hotel;

CREATE TABLE Room 
( Room_No INT PRIMARY KEY, Hotel_No INT, Type VARCHAR(30), Price INT);
SELECT * FROM Room;

CREATE TABLE Booking
(Hotel_No INT PRIMARY KEY, Guest_No INT, Date_From DATE, Date_To DATE, 
Room_No INT);
SELECT * FROM Booking;

CREATE TABLE Guest
(Guest_No INT PRIMARY KEY, Name VARCHAR(20), Address VARCHAR(100));
SELECT * FROM Guest;

-- 1 . List full details of all hotels.
SELECT * FROM Hotel;

-- 2. List full details of all hotels in London
SELECT * FROM Hotel WHERE Address = 'London';

-- 3. List the names and addresses of all guests in London,
--    alphabetically ordered by name.

SELECT Name, Address FROM Guest WHERE Address = 'London' 
ORDER BY Name;

-- 4. List all double or family rooms with a price below 15000
--    per night, in ascending order of price.

SELECT Type FROM Room where Price < 15000;

-- 5. List the booking for which no date_to has been specified.

-- 6. How many hotels are there?
SELECT count(Hotel_No) as Total_Hotels FROM Hotel;

-- 7. What is the average price of the room?
SELECT avg(Price) as Average_Price FROM Room;

-- 8. What is the total revenue per night from all double rooms?
SELECT sum(Price) as Total_revenue FROM Room Where Type = 'double';

-- 9. How many different guests have made bookings for august?
SELECT Guest_No FROM Booking 
WHERE Date_From Between "2025-03-11" and "2025-08-30";

-- 10. List the price and type of all rooms at the GrosvenorHotel.
select type, price from Room where Hotel_No in
(select Hotel_No from Hotel where Name="Grosvenor");

-- 11. List all guests currently staying at the Grosvenor Hotel.
select G.Guest_No, G.Name from Hotel H
join Booking B
on B.Hotel_No=H.Hotel_No
join Guest G
on G.Guest_No=B.Guest_No
where H.Name="Grosvenor" and curdate() between B.Date_From and B.Date_To;

-- 12. List the details of all rooms at the Grosvenor Hotel,including the name of the guest staying in the room, if the room is occupied.
	
    select R.room_no,r.type,G.name from room R join hotel H on r.hotel_no=h.hotel_no
    left join booking b on r.room_no = b.room_no
    left join guest g on B.guest_no = G.guest_no
    where h.name="GrosvenorHotel";
        
-- 13. What is the total income from bookings for the Grosvenor Hotel today?
		select sum(price) from hotel H join room R on H.hotel_no=R.hotel_no join booking B on
        r.Hotel_No = B.Hotel_No  AND R.room_no = B.room_no where name ="GrosvenorHotel" and curdate() between B.Date_From and B.date_to ;
        
-- 14. List the number of rooms in each hotel.
	
        	select H.name,count(Room_No) from room R join hotel H on R.hotel_no = H.hotel_no
            group by H.name;
            
            
-- 15. List the number of rooms in each hotel in London.
select count(Room_No),h.name from room R join hotel H on R.hotel_no = H.hotel_no where address = "London"
group by h.name;

-- 16. What is the average number of bookings for each hotel in August?
		
        select avg(booking_count) as avg_Bookings from (select h.hotel_no,count(*) as Booking_count from hotel H JOIN booking B ON H.hotel_no = B.hotel_no
        where month(b.date_from)=8 group by b.hotel_no) as Hotel_Bookings;
		
-- 17. What is the most commonly booked room type for each hotel in London?
	select avg(booking_type) as Avg_type from(select r.type,count(*) as room_type from room r join hotel h on h.hotel_no= r.hotel_no
    where h.address='London'
    group by r.type) as Hotel_type;
	
-- 18. What is the lost income from unoccupied rooms at each hotel today?      
        
        select H.name,sum(r.price) from hotel h left join room r on h.hotel_no=r.hotel_no
        left join booking b  ON R.hotel_no = B.hotel_no 
		AND R.room_no = B.room_no
        and curdate() between date_from and date_to
        where B.room_no is null
        group by h.name;