/*A non banking financial enterprise needs to develop a software for storing the details of the
customers, chitty and the loans in various branches of the enterprise.
Create this database, with proper primary key, foreign key and Unique constraints. Write Queries in
SQL for the following tasks.
(a). Find the details of the customers who have loan as well as chitty and the details of the 
 customers who have chitty , but not loan.
(b) Print the details of the customers along with their loan details in the non-increasing order of the 
 loan amount.
(c) For each branch of the enterprise, print the number of loans of each type along with the
 respective loan type.
(d) Print the details of the who have paid their chitty amount at least once in a branch different
 from the one where the chitty is started.
(e) Find the details of the customers who received the highest amount and the least amount for 
 closed chitty and for each branch.*/

CREATE DATABASE NON_BANKING;
USE NON_BANKING;
CREATE TABLE CUSTOMER (
Aadhar char(12) Primary key,
Pan_num char(10) Unique,
Mobile_num char(10) Unique,
Name varchar(50),
Address varchar(300),
Email varchar(50) Unique
);
INSERT INTO CUSTOMER VALUES ('998045633733', '3758875638', '9947566385', 'ARUN', 'KOLLAM', 'arun123@gmail.com');
INSERT INTO CUSTOMER VALUES ('998045633744', '3758875648', '9947566390', 'ANAND', 'IDUKKI', 'anand404@gmail.com');
INSERT INTO CUSTOMER VALUES ('998045633755', '3758875658', '9947566345', 'REKHA', 'ERNAKULAM', 'rekha555@gmail.com');
INSERT INTO CUSTOMER VALUES ('998045633766', '3758875668', '9947566300', 'PRIYA', 'WAYANAD', 'priyaaa@gmail.com');
INSERT INTO CUSTOMER VALUES ('998045633730', '3758875630', '9947566389', 'SANDRA', 'TRIVANDRUM', 'saaandraa3@gmail.com');
INSERT INTO CUSTOMER VALUES ('998045633738', '3758875600', '9947566356', 'JANAKI', 'THRISSUR', 'jaan23@gmail.com');
INSERT INTO CUSTOMER VALUES ('998045633783', '3758875611', '9947566369', 'ADITHYAN', 'KOTTAYAM', 'adi123@gmail.com');


CREATE TABLE CHITTY (
Chitty_num int Primary key,
Branch varchar(50) Unique,
Chitty_amt float,
Start_date date,
N_of_installments int,
Chitty_status varchar(20)
);
INSERT INTO CHITTY VALUES (53, 'KOTTARAKKARA', 50000.00, '2016-04-25', 8, 'closed');
INSERT INTO CHITTY VALUES (20, 'PAINAV', 100000.00, '2018-04-25', 12, 'closed');
INSERT INTO CHITTY VALUES (5, 'ALUVA', 50000.00, '2016-01-05', 6, 'closed');
INSERT INTO CHITTY VALUES (33, 'TOWN HALL', 10000.00, '2016-04-20', 8, 'closed');
INSERT INTO CHITTY VALUES (40, 'THODUPUZHA', 50000.00, '2020-04-15', 8, 'not closed');
INSERT INTO CHITTY VALUES (55, 'AROOR', 20000.00, '2022-04-15', 8, 'not closed');
INSERT INTO CHITTY VALUES (80, 'ERNAKULAM', 90000.00, '2024-01-10', 8, 'not closed');


CREATE TABLE LOAN (
Loan_num int Primary key,
Loan_type varchar(100),
Aadhar char(12),
Chitty_num int,
Loan_amt float,
Loan_period int,
Emi float,
Foreign key (Aadhar) REFERENCES CUSTOMER (Aadhar) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key (Chitty_num) REFERENCES CHITTY (Chitty_num) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO LOAN VALUES (2, 'HOME LOAN', '998045633733', 53, 1500000, 10, 300000);
INSERT INTO LOAN VALUES (34, 'CAR LOAN', '998045633744', 20, 500000, 10, 8000);
INSERT INTO LOAN VALUES (92, 'PERSONAL LOAN', '998045633733', 53, 100000,11 , 4000);
INSERT INTO LOAN VALUES (67, 'HOME LOAN', '998045633755', 5, 1500000, 20, 10000);
INSERT INTO LOAN VALUES (21, 'BUSINESS LOAN', '998045633766', 33, 500000, 20, 5000);

CREATE TABLE CUSTOMER_CHITTY (
Aadhar char(12),
Branch varchar(50),
Chitty_num int,
Chittal_num int,
Primary key (Aadhar,Chitty_num,Chittal_num),
Foreign key (Aadhar) REFERENCES CUSTOMER (Aadhar) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key (Chitty_num) REFERENCES CHITTY (Chitty_num) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key (Branch) REFERENCES CHITTY (Branch) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO CUSTOMER_CHITTY VALUES ('998045633733', 'KOTTARAKKARA', 53, 14);
INSERT INTO CUSTOMER_CHITTY VALUES ('998045633755', 'ALUVA', 5, 10);
INSERT INTO CUSTOMER_CHITTY VALUES ('998045633744', 'PAINAV', 20, 8);
INSERT INTO CUSTOMER_CHITTY VALUES ('998045633766', 'TOWN HALL', 33, 13);
INSERT INTO CUSTOMER_CHITTY VALUES ('998045633738', 'AROOR', 55, 5);
INSERT INTO CUSTOMER_CHITTY VALUES ('998045633783', 'ERNAKULAM', 80, 9);

CREATE TABLE CHITTY_PAYMENT (
Chitty_num int,
Chital_num int,
Branch varchar(50),
Payment_status varchar(50),
Payment_mode varchar(50),
Payment_date date,
Paid_amt float,
Payment_branch varchar(50),
Foreign key (Chitty_num) REFERENCES CHITTY (Chitty_num) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key (Branch) REFERENCES CHITTY (Branch) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO CHITTY_PAYMENT VALUES (5,10 ,'PAINAV', 'NOT COMPLETED', 'CASH', '2016-02-05',1000 , 'PAINAV');
INSERT INTO CHITTY_PAYMENT VALUES (20,8,'PAINAV', 'NOT COMPLETED', 'NET BANKING', '2019-05-05',5000, 'PAINAV');
INSERT INTO CHITTY_PAYMENT VALUES (53,14 ,'KOTTARAKKARA', 'COMPLETED', 'CASH', '2018-09-25',4000, 'KOTTARAKKARA');
INSERT INTO CHITTY_PAYMENT VALUES (33,13,'THODUPUZHA', 'NOT COMPLETED', 'CASH', '2016-09-22',1000 , 'THODUPUZHA');

CREATE TABLE CHITTY_AUCTION (
Aadhar char(12),
Chitty_num int,
Chital_num int,
Branch varchar(50),
Auctioned_amt float,
Foreign key (Aadhar) REFERENCES CUSTOMER (Aadhar) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key (Chitty_num) REFERENCES CHITTY (Chitty_num) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key (Branch) REFERENCES CHITTY (Branch) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO CHITTY_AUCTION VALUES ('998045633733',53,14, 'KOTTARAKKARA', 50000);
INSERT INTO CHITTY_AUCTION VALUES ('998045633744',20,8, 'PAINAV', 100000);
INSERT INTO CHITTY_AUCTION VALUES ('998045633755',5,10, 'ALUVA', 50000);
INSERT INTO CHITTY_AUCTION VALUES ('998045633766',33,13, 'TOWN HALL', 10000);

CREATE TABLE LOAN_PAYMENT (
Aadhar char(12),
Loan_num int,
Branch varchar(50),
Loan_amt float,
Payment_date date,
Payment_branch varchar(50),
Foreign key (Aadhar) REFERENCES CUSTOMER (Aadhar) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key (Loan_num) REFERENCES LOAN (Loan_num) ON DELETE CASCADE ON UPDATE CASCADE,
Foreign key (Branch) REFERENCES CHITTY (Branch) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO LOAN_PAYMENT VALUES ('998045633733',2,'KOTTARAKKARA',30000,'2016-04-08','KOTTARAKKARA');
INSERT INTO LOAN_PAYMENT VALUES ('998045633744',34,'PAINAV',8000,'2018-10-10','ALUVA');
INSERT INTO LOAN_PAYMENT VALUES ('998045633755',67,'ALUVA',10000,'2016-05-06','PAINAV');
INSERT INTO LOAN_PAYMENT VALUES ('998045633766',21,'TOWN HALL',5000,'2015-01-12','TOWN HALL');

#Customers having both loan and chitty
SELECT DISTINCT CUSTOMER.*
FROM CUSTOMER JOIN LOAN ON CUSTOMER.Aadhar = LOAN.Aadhar
JOIN CUSTOMER_CHITTY ON CUSTOMER.Aadhar = CUSTOMER_CHITTY.Aadhar;

#Customers having chitty but no loan
SELECT DISTINCT CUSTOMER.*
FROM CUSTOMER JOIN CUSTOMER_CHITTY ON CUSTOMER.Aadhar = CUSTOMER_CHITTY.Aadhar 
WHERE CUSTOMER.Aadhar NOT IN (SELECT Aadhar FROM LOAN);

#Details of customers and their loans in decreasing order of loan amounts
SELECT *
FROM CUSTOMER JOIN LOAN
ON CUSTOMER.Aadhar = LOAN.Aadhar
ORDER BY LOAN.Loan_amt DESC;

#No. of loans and loan types for each branch
SELECT Branch, Loan_type, COUNT(*) AS NO_OF_LOANS
FROM LOAN JOIN LOAN_PAYMENT ON LOAN.Aadhar=LOAN_PAYMENT.Aadhar
GROUP BY LOAN_PAYMENT.Branch,Loan_type;

#Details of customers who have paid their chitty amount atleast once from a branch different from the one in which the chitty started
SELECT DISTINCT *
FROM CHITTY JOIN CHITTY_PAYMENT ON CHITTY.Chitty_num = CHITTY_PAYMENT.Chitty_num 
WHERE CHITTY_PAYMENT.Branch  != CHITTY.Branch;

#details of customers who received highest amount for closed chitty and for each branch
SELECT * FROM CUSTOMER JOIN CHITTY_AUCTION ON CUSTOMER.Aadhar = CHITTY_AUCTION.Aadhar 
JOIN CHITTY AS ch ON ch.Chitty_num=CHITTY_AUCTION.Chitty_num 
WHERE Chitty_status='closed' 
AND CHITTY_AUCTION.Auctioned_amt = (SELECT MAX(CA.Auctioned_amt) 
									FROM CHITTY AS CH JOIN CHITTY_AUCTION AS CA WHERE CH.Chitty_num = CA.Chitty_num 
                                    AND CH.Chitty_status='closed'and CH.Branch =ch.Branch
                                    );

#details of customers who received lowest amount for closed chitty and for each branch
SELECT * FROM CUSTOMER JOIN CHITTY_AUCTION ON CUSTOMER.Aadhar = CHITTY_AUCTION.Aadhar 
JOIN CHITTY AS ch ON ch.Chitty_num=CHITTY_AUCTION.Chitty_num WHERE Chitty_status='closed' 
AND CHITTY_AUCTION.Auctioned_amt = (SELECT MIN(CA.Auctioned_amt) 
									FROM CHITTY AS CH JOIN CHITTY_AUCTION AS CA WHERE CH.Chitty_num = CA.Chitty_num 
                                    AND CH.Chitty_status='closed'and CH.Branch =ch.Branch
                                    );

DROP DATABASE NON_BANKING;
