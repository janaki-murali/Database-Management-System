/*A web based platform for a tourist resort that provides lodging on a booking basis.
It is required to write SQL queries to provide the following functionalities.
(a) Print the details of the residents who has more than three companions in a single
booking.
(b) Print the details of the residents along with the number of companions for a specified
period.
(c) Print the details of the residents who reserved more than two A/C rooms in at least
two different bookings.
(d) Print the details of the food item(s) ordered by maximum number of residents an
the details of the food item(s) ordered b the minimum number of residents.
(e) Print the details of the food item(s) in the non-decreasing order of preference in a
specific period. The preference is to be computed on the basis of two factors- the
number of orders for that item in the period an the price for the item. The item with
the highest number of orders and least price is considered to have most preference.*/

CREATE DATABASE TOURISM;
USE TOURISM;

CREATE TABLE EMPLOYEE (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(50),
    Aadhar BIGINT,
    Phone BIGINT,
    JoinDate DATE,
    Salary DECIMAL(10,2)
);

CREATE TABLE RESIDENT (
    ResidentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(50),
    Aadhar BIGINT,
    Phone BIGINT,
    Age INT,
    Gender CHAR(1),
    Email VARCHAR(60)
);

CREATE TABLE COMPANION (
    CompID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(50),
    Aadhar BIGINT,
    Phone BIGINT,
    Gender CHAR(1),
    ResidentID INT,
    FOREIGN KEY (ResidentID) REFERENCES RESIDENT(ResidentID)
);

CREATE TABLE ROOM (
    RoomNum INT PRIMARY KEY,
    RoomType VARCHAR(40),
    Capacity VARCHAR(50)
);

CREATE TABLE BOOKING (
    BookingID INT PRIMARY KEY,
    ResidentID INT,
    RoomNum INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    FOREIGN KEY (ResidentID) REFERENCES RESIDENT(ResidentID),
    FOREIGN KEY (RoomNum) REFERENCES ROOM(RoomNum)
);

CREATE TABLE FOODITEM (
    FoodItemID INT PRIMARY KEY,
    FoodItem VARCHAR(50),
    FoodType VARCHAR(50),
    Price FLOAT
);

CREATE TABLE FOODORDER (
    OrderID INT PRIMARY KEY,
    BookingID INT,
    FoodItemID INT,
    OrderDate DATE,
    FOREIGN KEY (BookingID) REFERENCES BOOKING(BookingID),
    FOREIGN KEY (FoodItemID) REFERENCES FOODITEM(FoodItemID)
);

INSERT INTO RESIDENT (ResidentID, Name, Address, Aadhar, Phone, Age, Gender, Email) VALUES
(1, 'Alice Brown', '321 Maple St, Springfield', 456789012345, 1234567890, 30, 'F', 'alice.brown@example.com'),
(2, 'Bob White', '654 Cedar St, Springfield', 567890123456, 2345678901, 45, 'M', 'bob.white@example.com'),
(3, 'Charlie Green', '987 Birch St, Springfield', 678901234567, 3456789012, 28, 'M', 'charlie.green@example.com'),
(4, 'Diana Black', '159 Elm St, Springfield', 789012345678, 4567890123, 35, 'F', 'diana.black@example.com'),
(5, 'Ethan Blue', '753 Oak St, Springfield', 890123456789, 5678901234, 40, 'M', 'ethan.blue@example.com'),
(6, 'Fiona Red', '852 Pine St, Springfield', 901234567890, 6789012345, 22, 'F', 'fiona.red@example.com');

INSERT INTO COMPANION (CompID, Name, Address, Aadhar, Phone, Gender, ResidentID) VALUES
(1, 'David Blue', '321 Maple St, Springfield', 789012345678, 4567890123, 'M', 1),
(2, 'Eva Black', '654 Cedar St, Springfield', 890123456789, 5678901234, 'F', 3),
(3, 'Frank Grey', '987 Birch St, Springfield', 901234567890, 6789012345, 'M', 3),
(4, 'Grace White', '159 Elm St, Springfield', 123456789012, 7890123456, 'F', 4),
(5, 'Henry Green', '753 Oak St, Springfield', 234567890123, 8901234567, 'M', 3),
(6, 'Isla Brown', '852 Pine St, Springfield', 345678901234, 9012345678, 'F', 3),
(7, 'Jack Black', '321 Maple St, Springfield', 456789012345, 4567890123, 'M', 1),
(8, 'Lily White', '654 Cedar St, Springfield', 567890123456, 5678901234, 'F', 1),
(9, 'Mia Grey', '987 Birch St, Springfield', 678901234567, 6789012345, 'F', 1);

INSERT INTO ROOM (RoomNum, RoomType, Capacity) VALUES
(101, 'A/C', '1 Person'),
(102, 'A/C', '2 Persons'),
(103, 'NON A/C', '4 Persons'),
(104, 'A/C', '4 Persons'),
(105, 'A/C', '6 Persons'),
(106, 'NON A/C', '2 Persons');

INSERT INTO BOOKING (BookingID, ResidentID, RoomNum, CheckInDate, CheckOutDate) VALUES
(1, 1, 101, '2023-04-01', '2023-04-10'),  
(2, 2, 102, '2023-04-05', '2023-04-15'), 
(3, 2, 101, '2023-04-16', '2023-04-17'), 
(4, 2, 104, '2023-04-03', '2023-04-04'), 
(5, 1, 102, '2023-04-16', '2023-04-17'), 
(6, 1, 104, '2023-05-05', '2023-05-06'),  
(7, 3, 103, '2023-04-07', '2023-04-08'),  
(8, 4, 104, '2023-04-10', '2023-04-11'),  
(9, 5, 105, '2023-04-12', '2023-04-18'),  
(10, 6, 106, '2023-04-15', '2023-04-22');

INSERT INTO FOODITEM (FoodItemID, FoodItem, FoodType, Price) VALUES
(1, 'Veggie Burger', 'Veggie', 10.99),
(2, 'Chicken Sandwich', 'Non-Veggie', 12.99),
(3, 'Greek Salad', 'Veggie', 9.99),
(4, 'Fish Tacos', 'Non-Veggie', 14.99),
(5, 'Fruit Salad', 'Veggie', 8.99),
(6, 'Steak', 'Non-Veggie', 19.99);

INSERT INTO FOODORDER (OrderID, BookingID, FoodItemID, OrderDate) VALUES
(1, 1, 1, '2023-04-02'),  
(2, 3, 3, '2023-04-03'),  
(3, 2, 5, '2023-04-06'),  
(4, 6, 1, '2023-04-08'),  
(5, 7, 6, '2023-04-08'),  
(6, 9, 5, '2023-04-13'),  
(7, 8, 6, '2023-04-11'), 
(8, 10, 1, '2023-04-15'), 
(9, 7, 6, '2023-04-07'), 
(10, 2, 1, '2023-04-10');

SELECT r.ResidentID, r.Name, r.Address, r.Aadhar, r.Phone, r.Age, r.Gender, r.Email
FROM RESIDENT r
JOIN (
    SELECT ResidentID
    FROM COMPANION
    GROUP BY ResidentID
    HAVING COUNT(CompID) > 3
) c ON r.ResidentID = c.ResidentID;

SELECT r.ResidentID, r.Name, r.Address, r.Aadhar, r.Phone, r.Age, r.Gender, r.Email, COUNT(*) AS NumberOfCompanions
FROM RESIDENT r
JOIN BOOKING b ON r.ResidentID = b.ResidentID
JOIN COMPANION c ON c.ResidentID = r.ResidentID
WHERE b.CheckInDate >= '2023-03-01' AND b.CheckOutDate <= '2024-01-30'  
GROUP BY r.ResidentID;

SELECT r.ResidentID, r.Name, r.Address, r.Aadhar, r.Phone, r.Age, r.Gender, r.Email
FROM RESIDENT r
JOIN (
    SELECT ResidentID
    FROM BOOKING b
    JOIN ROOM ro ON b.RoomNum = ro.RoomNum
    WHERE ro.RoomType LIKE '%A/C%'
    GROUP BY ResidentID
    HAVING COUNT(DISTINCT b.BookingID) >= 2 AND COUNT(ro.RoomNum) > 2
) b ON r.ResidentID = b.ResidentID;

CREATE VIEW FOODRESIDENTCOUNT AS
SELECT F.FoodItem, COUNT(R.ResidentID) AS No_of_residents
FROM FOODITEM F
JOIN FOODORDER FO ON F.FoodItemID = FO.FoodItemID
JOIN BOOKING B ON B.BookingID = FO.BookingID
JOIN RESIDENT R ON R.ResidentID = B.ResidentID
GROUP BY F.FoodItem;

SELECT FoodItem, No_of_residents
FROM FOODRESIDENTCOUNT
WHERE No_of_residents = (SELECT MAX(No_of_residents) FROM FOODRESIDENTCOUNT);

SELECT FoodItem, No_of_residents
FROM FOODRESIDENTCOUNT
WHERE No_of_residents = (SELECT MIN(No_of_residents) FROM FOODRESIDENTCOUNT);

SELECT f.FoodItemID, f.FoodItem, f.FoodType, f.Price, COUNT(fo.OrderID) AS NumberOfOrders
FROM FOODITEM f
JOIN FOODORDER fo ON f.FoodItemID = fo.FoodItemID
WHERE fo.OrderDate BETWEEN '2023-04-01' AND '2024-09-30'  
GROUP BY f.FoodItemID
ORDER BY NumberOfOrders DESC, f.Price ASC;

DROP DATABASE TOURISM;
