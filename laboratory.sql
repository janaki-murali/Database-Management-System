/*A Software is to be designed for a medical laboratory that conducts various medical tests
and medical scans as prescribed by doctors. 
The system is supposed to provide the answers to the following queries.
(a) Print the details of the tests conducted by a specified patient within a specified time
period.
(b) For each test, print the details of the patients who had taken the test.
(c) Find the test which has been taken by the maximum number of patients an the test
which has been taken by the lest number of patients.
(d) For each test, print the details of the patients who have taken a particular type of
scan not more than two times.
(e) Print the total revenue of the laboratory from each test and each scan.
(f) Print the details of the scan that has been taken by the patients least recently and
the details of the scan which has been taken b the patients most recently.
(g) Print the details of the doctor who prescribed maximum number of tests within a
specific period an the details of the doctor who had prescribed by the minimum
number of tests.
(h) Print the total revenue of the laboratory from tests and scans doctor-wise.*/

CREATE DATABASE LABORATORY;
USE LABORATORY;

CREATE TABLE EMPLOYEE (
ENAME VARCHAR(20),
AADHAR CHAR(12) PRIMARY KEY,
ADDRESS VARCHAR(50),
MOBILE CHAR(10) UNIQUE NOT NULL,
EMAIL CHAR(50) UNIQUE NOT NULL
);
 
CREATE TABLE PATIENT (
PNAME VARCHAR(20),
AADHAR CHAR(12) PRIMARY KEY,
AGE INT,
ADDRESS VARCHAR(50),
MOBILE CHAR(10) UNIQUE NOT NULL,
EMAIL CHAR(50) UNIQUE NOT NULL
);

CREATE TABLE TESTS (
TESTNAME VARCHAR(50) PRIMARY KEY,
DESCRIPTION VARCHAR(100)
);

CREATE TABLE SCANS (
SCANNAME VARCHAR(50) PRIMARY KEY,
DESCRIPTION VARCHAR(100)
);

CREATE TABLE DOCTOR (
DNAME VARCHAR(50),
DOC_ID CHAR(12) PRIMARY KEY,
ADDRESS VARCHAR(50),
SPECIALIZATION VARCHAR(50),
CURRENTHOSPITAL VARCHAR(50)
);

CREATE TABLE TESTS_TAKEN (
AADHAR CHAR(12),
TESTNAME VARCHAR(50),
DOC_ID CHAR(12),
TDATE DATE,
RESULT_PATH VARCHAR(100),
AMOUNT FLOAT,
PRIMARY KEY(AADHAR,TESTNAME),
FOREIGN KEY(DOC_ID) REFERENCES DOCTOR(DOC_ID),
FOREIGN KEY(AADHAR) REFERENCES PATIENT(AADHAR),
FOREIGN KEY(TESTNAME) REFERENCES TESTS(TESTNAME)
);

CREATE TABLE SCANS_CONDUCTED (
AADHAR CHAR(12),
SCANNAME VARCHAR(50),
DOC_ID CHAR(12),
SDATE DATE,
PRESCRIPTION_PATH VARCHAR(100),
RESULT_PATH VARCHAR(100),
AMOUNT FLOAT,
PRIMARY KEY(AADHAR,SCANNAME),
FOREIGN KEY(SCANNAME) REFERENCES SCANS(SCANNAME),
FOREIGN KEY(AADHAR) REFERENCES PATIENT(AADHAR)
);

INSERT INTO EMPLOYEE VALUES ('ARUN', '987654321987', 'BANDRA WEST', '9988776655', 'arundave@gmail.com');
INSERT INTO EMPLOYEE VALUES ('MADHAV', '987654321917', 'GHATKOPER', '9988776644', 'madhav@gmail.com');
INSERT INTO EMPLOYEE VALUES ('KAILASH', '987654321927', 'BEVERLY HILLS', '9988776666', 'kailash@gmail.com');
INSERT INTO EMPLOYEE VALUES ('DIVYA', '987654321937', 'CHEMBUR EAST', '9988776633', 'divya@gmail.com');
INSERT INTO EMPLOYEE VALUES ('POOJA', '987654321947', 'ANDHERI', '9988776622', 'pooja@gmail.com');

INSERT INTO PATIENT VALUES ('DEEPAK', '987654321565', 50, 'GOA', '9988776600', 'deepak@gmail.com');
INSERT INTO PATIENT VALUES ('NISHA', '987654321566', 28, 'SURAT', '9988776611', 'nisha@gmail.com');
INSERT INTO PATIENT VALUES ('VIJAY', '987654321567', 36, 'JAIPUR', '9988776622', 'vijay@gmail.com');
INSERT INTO PATIENT VALUES ('MEENA', '987654321568', 45, 'PATNA', '9988776633', 'meena@gmail.com');
INSERT INTO PATIENT VALUES ('ABHISHEK', '987654321569', 40, 'CHANDIGARH', '9988776644', 'abhishek@gmail.com');
INSERT INTO PATIENT VALUES ('ANJALY', '987654321000',20,'NOIDA', '9988776000', 'anjaly@gmail.com');
INSERT INTO PATIENT VALUES ('SANDRA', '987654321222',34,'MALAYSIA', '9988776111', 'sandra@gmail.com');
INSERT INTO PATIENT VALUES ('ADWAITH', '987654321999',87,'LAKSHADWEEP', '9988776222', 'adwaith@gmail.com');
INSERT INTO PATIENT VALUES ('JANAKI', '987654321004',42,'MADGAON', '9988776333', 'janaki@gmail.com');
INSERT INTO PATIENT VALUES ('ADITHYAN', '987654321900',40,'MUNNAR', '9988776444', 'ad1thyan@gmail.com');
INSERT INTO PATIENT VALUES ('ALAN', '987654321564',20,'THODUPUZHA', '9988706444', 'alan@gmail.com');

INSERT INTO TESTS VALUES ('Rabies test','To detect rabies virus in the body during the first week');
INSERT INTO TESTS VALUES ('Blood sugar test','To test sugar levels in blood');
INSERT INTO TESTS VALUES ('HIV test','To detect the presence of the human immunodeficiency virus');
INSERT INTO TESTS VALUES ('Liver function test','To check the functioning of the liver and diagnose liver diseases');
INSERT INTO TESTS VALUES ('Urinalysis','A test of urine to detect a wide range of disorders, such as urinary tract infections, kidney disease, and diabetes');
INSERT INTO TESTS VALUES ('Lipid profile test','To assess the risk of cardiovascular disease by measuring cholesterol and triglycerides in the blood');
INSERT INTO TESTS VALUES ('Electrolyte test','To measure the levels of electrolytes, like sodium and potassium, in the blood');
INSERT INTO TESTS VALUES ('Blood pressure test','To measure the pressure in arteries as the heart pumps');
INSERT INTO TESTS VALUES ('Cholesterol test','To check level of low-density lipo-protein');
INSERT INTO TESTS VALUES ('Platelet count test','To count the number of platelets in blood helping in blood  clots');
INSERT INTO TESTS VALUES ('Thyroid test','To check the functioning of thyroid and monitor effectiveness of thyroid suppression');

INSERT INTO SCANS VALUES ('Echocardiogram','Uses sound waves to create moving pictures of the heart');
INSERT INTO SCANS VALUES ('CT Scan','Medical imaging technique used to obtain detailed internal images of the body');
INSERT INTO SCANS VALUES ('X-RAY','To obtain images of the bones and joints in the body');
INSERT INTO SCANS VALUES ('MRI Scan','Uses magnets and radio waves to produce images of every structure and organ of the body');
INSERT INTO SCANS VALUES ('Ultrasound','Uses high frequency sound waves for imaging internal organs especially developing foetus');
INSERT INTO SCANS VALUES ('ECG','Used to record electrical signals in the heart');

INSERT INTO DOCTOR VALUES ('RAGHAV PATEL',666090,'MIRA ROAD','CARDIOLOGY','ST.MARYS MANARCAD HOSPITAL');
INSERT INTO DOCTOR VALUES ('MANISHA SHAH',774411,'SANTACRUZ','DERMATOLOGY','LILAVATI HOSPITAL');
INSERT INTO DOCTOR VALUES ('RAHUL GUPTA',663322,'KHAR','NEUROSURGERY','BOMBAY HOSPITAL');
INSERT INTO DOCTOR VALUES ('ANKITA MEHRA',442211,'GOREGAON','ONCOLOGY','HCG CANCER CENTER');
INSERT INTO DOCTOR VALUES ('VIJAY CHAWLA',998844,'GURGAON','UROLOGY','MEDANTA HOSPITAL');
INSERT INTO DOCTOR VALUES ('KOMAL JAIN',887744,'PUNE','NEPHROLOGY','RUBY HALL CLINIC');
INSERT INTO DOCTOR VALUES ('YADAV MISRA',884312,'IDUKKI','PATHOLOGY','CARITAS HOSPITAL');
INSERT INTO DOCTOR VALUES ('HARI KUMAR',884563,'NILESHWARAM','ENDOCRINOLOGY','PARUMALA HOSPITAL');
INSERT INTO DOCTOR VALUES ('VAISHALI SINGH',897658,'ERNAKULAM','IMMUNOLOGY','WOKHART HOSPITAL');
INSERT INTO DOCTOR VALUES ('ANAND CHOPRA',907537,'KOTTAYAM','ORTHOPEDIC','WOKHART HOSITAL');
INSERT INTO DOCTOR VALUES ('RAKESH CHOPRA',665544,'KOTTAYAM','ENDOCRINOLOGY','WOKHART HOSITAL');


INSERT INTO TESTS_TAKEN VALUES ('987654321000','Thyroid test','884563','2023-09-09','/medicalrec/thyroid/anjaly',950);
INSERT INTO TESTS_TAKEN VALUES ('987654321565','HIV test','774411','2024-02-10','/medicalrec/hiv/deepak',3500);
INSERT INTO TESTS_TAKEN VALUES ('987654321566','HIV test','774411','2024-03-22','/medicalrec/hiv/nisha',3500);
INSERT INTO TESTS_TAKEN VALUES ('987654321567','Liver function test','665544','2024-04-14','/medicalrec/liver/vijay',1200);
INSERT INTO TESTS_TAKEN VALUES ('987654321568','Liver function test','665544','2024-05-18','/medicalrec/liver/meena',1200);
INSERT INTO TESTS_TAKEN VALUES ('987654321569','Lipid profile test','998844','2024-06-21','/medicalrec/lipid/abhishek',1200);
INSERT INTO TESTS_TAKEN VALUES ('987654321564','Lipid profile test','998844','2024-07-25','/medicalrec/lipid/rahul',1200);
INSERT INTO TESTS_TAKEN VALUES ('987654321222','Rabies test','884312','2024-04-01','/medicalrec/rabies/sandra',10000);
INSERT INTO TESTS_TAKEN VALUES ('987654321004','Platelet count test','897658','2024-05-07','/medicalrec/pct/janaki',100);
INSERT INTO TESTS_TAKEN VALUES ('987654321900','Cholesterol test','666090','2024-07-18','/medicalrec/cholesterol/adithyan',400);

INSERT INTO SCANS_CONDUCTED VALUES ('987654321000','ECG','666090','2024-10-09','/medicalrec/presc/cardio/anjaly','/medicalrec/scanresult/cardio/anjaly',224);
INSERT INTO SCANS_CONDUCTED VALUES ('987654321999','X-RAY','907537','2023-01-09','/medicalrec/presc/ortho/adwaith','/medicalrec/scanresult/cardio/adwaith',250);
INSERT INTO SCANS_CONDUCTED VALUES ('987654321004','X-RAY','907537','2023-05-10','/medicalrec/presc/ortho/janaki','/medicalrec/scanresult/cardio/janaki',250);
INSERT INTO SCANS_CONDUCTED VALUES ('987654321222','MRI Scan','907537','2023-02-04','/medicalrec/presc/ortho/sandra','/medicalrec/scanresult/cardio/sandra',4500);
INSERT INTO SCANS_CONDUCTED VALUES ('987654321565','CT Scan','665544','2024-01-18','/medicalrec/presc/liver/deepak','/medicalrec/scanresult/liver/deepak',3000);
INSERT INTO SCANS_CONDUCTED VALUES ('987654321566','CT Scan','665544','2024-02-28','/medicalrec/presc/liver/nisha','/medicalrec/scanresult/liver/nisha',3000);
INSERT INTO SCANS_CONDUCTED VALUES ('987654321567','Echocardiogram','774411','2024-03-12','/medicalrec/presc/heart/vijay','/medicalrec/scanresult/heart/vijay',2500);
INSERT INTO SCANS_CONDUCTED VALUES ('987654321568','Echocardiogram','774411','2024-04-15','/medicalrec/presc/heart/meena','/medicalrec/scanresult/heart/meena',2500);
INSERT INTO SCANS_CONDUCTED VALUES ('987654321569','MRI Scan','907537','2024-05-09','/medicalrec/presc/ortho/abhishek','/medicalrec/scanresult/ortho/abhishek',4500);
INSERT INTO SCANS_CONDUCTED VALUES ('987654321564','MRI Scan','907537','2024-06-22','/medicalrec/presc/ortho/rahul','/medicalrec/scanresult/ortho/rahul',4500);

#Details of tests conducted by a specified patient within a specified time period
SELECT TESTNAME,TDATE,RESULT_PATH,AMOUNT
FROM TESTS_TAKEN
WHERE AADHAR = '987654321000' AND TDATE BETWEEN '2023-01-01' AND '2024-01-01';

#For each test, print the details of patients who had taken the test
SELECT t.TESTNAME,p.PNAME,p.AADHAR,p.ADDRESS,p.AGE,p.MOBILE,p.EMAIL
FROM TESTS_TAKEN tt JOIN PATIENT p ON tt.AADHAR=p.AADHAR JOIN TESTS t ON tt.TESTNAME=t.TESTNAME
ORDER BY t.TESTNAME;

CREATE VIEW TESTS1 AS
SELECT TESTNAME,COUNT(AADHAR) AS NO_OF_PATIENTS
FROM TESTS_TAKEN 
GROUP BY TESTNAME;
#Test taken by the maximum number of patients
SELECT TESTNAME, NO_OF_PATIENTS
FROM TESTS1
WHERE NO_OF_PATIENTS IN(SELECT MAX(NO_OF_PATIENTS) FROM TESTS1);

#Test taken by least number of patients
SELECT TESTNAME, NO_OF_PATIENTS
FROM TESTS1
WHERE NO_OF_PATIENTS IN(SELECT MIN(NO_OF_PATIENTS) FROM TESTS1);

#For each test, print the details of patients who have taken a particular type of scan not more than two times
SELECT tt.TESTNAME,p.PNAME,p.AADHAR,COUNT(s.SCANNAME) AS SCANCOUNT
FROM TESTS_TAKEN tt JOIN PATIENT P ON tt.AADHAR=p.AADHAR JOIN SCANS_CONDUCTED s ON s.AADHAR=p.AADHAR
GROUP BY tt.TESTNAME,p.AADHAR
HAVING SCANCOUNT<=2;

#Total revenue of laboratory for each test
SELECT TESTNAME, SUM(AMOUNT) AS TOTALREVENUE
FROM TESTS_TAKEN
GROUP BY TESTNAME;

#Total revenue of laboratory for each scan
SELECT SCANNAME, SUM(AMOUNT) AS TOTALREVENUE
FROM SCANS_CONDUCTED
GROUP BY SCANNAME;

#Details of scans taken by patients most recently
SELECT *
FROM SCANS_CONDUCTED
WHERE SDATE=(
	SELECT MAX(SDATE)
	FROM SCANS_CONDUCTED
);

#Details of scans taken by patients least recently 
SELECT * FROM SCANS_CONDUCTED
WHERE SDATE=(
	SELECT MIN(SDATE)
    FROM SCANS_CONDUCTED
);

CREATE VIEW DoctorTestCounts AS
SELECT d.DOC_ID, d.DNAME, d.ADDRESS, d.SPECIALIZATION, d.CURRENTHOSPITAL, COUNT(tt.TESTNAME) AS TOTAL_TESTS
FROM TESTS_TAKEN tt 
JOIN DOCTOR d ON tt.DOC_ID = d.DOC_ID
WHERE tt.TDATE BETWEEN '2024-01-01' AND '2024-12-31'  
GROUP BY d.DOC_ID, d.DNAME, d.ADDRESS, d.SPECIALIZATION, d.CURRENTHOSPITAL;

#Doctors who prescribed the maximum number of tests
SELECT DOC_ID, DNAME, ADDRESS, SPECIALIZATION, CURRENTHOSPITAL, TOTAL_TESTS
FROM DoctorTestCounts
WHERE TOTAL_TESTS = (SELECT MAX(TOTAL_TESTS) FROM DoctorTestCounts);

#Doctors who prescribed the minimum number of tests
SELECT DOC_ID, DNAME, ADDRESS, SPECIALIZATION, CURRENTHOSPITAL, TOTAL_TESTS
FROM DoctorTestCounts
WHERE TOTAL_TESTS = (SELECT MIN(TOTAL_TESTS) FROM DoctorTestCounts);

#Total revenue of laboratory from tests doctor-wise
SELECT d.DNAME,d.DOC_ID,d.ADDRESS,d.SPECIALIZATION,d.CURRENTHOSPITAL,SUM(tt.AMOUNT) AS TOTAL_REV_BY_TESTS
FROM TESTS_TAKEN tt JOIN DOCTOR d ON tt.DOC_ID=d.DOC_ID
GROUP BY d.DOC_ID;

#Total revenue of laboratory from scans doctor-wise
SELECT d.DNAME,d.DOC_ID,d.ADDRESS,d.SPECIALIZATION,d.CURRENTHOSPITAL,SUM(sc.AMOUNT) AS TOTAL_REV_BY_SCANS
FROM SCANS_CONDUCTED sc JOIN DOCTOR d ON sc.DOC_ID=d.DOC_ID
GROUP BY d.DOC_ID;

DROP DATABASE LABORATORY;
