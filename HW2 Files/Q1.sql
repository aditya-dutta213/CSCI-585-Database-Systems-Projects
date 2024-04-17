--Oracle LiveSQL


-- Employee Table
CREATE TABLE Employee (
ID INT PRIMARY KEY,
Name VARCHAR2(255),
OfficeNumber INT,
FloorNumber INT CHECK (FloorNumber BETWEEN 1 AND 10),
PhoneNumber VARCHAR2(20),
Email VARCHAR2(255)
);

INSERT INTO Employee VALUES (1, 'Ankit', 101, 1, '213-7309', 'ankit@gmail.com');
INSERT INTO Employee VALUES (2, 'Bhavnna', 102, 1, '213-7355', 'bhavnna@gmail.com');
INSERT INTO Employee VALUES (3, 'Chinmay', 103, 2, '213-7343', 'chinmay@gmail.com');
INSERT INTO Employee VALUES (4, 'Devjit', 104, 2, '213-7311', 'devjit@gmail.com');

-- Meeting Table
CREATE TABLE Meeting (
MeetingID INT PRIMARY KEY,
EmployeeID INT,
RoomNumber INT,
FloorNumber INT CHECK (FloorNumber BETWEEN 1 AND 10),
StartTime INT CHECK (StartTime BETWEEN 8 AND 18),
FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

INSERT INTO Meeting VALUES (1, 1, 301, 3, 10);
INSERT INTO Meeting VALUES (2, 2, 302, 3, 11);
INSERT INTO Meeting VALUES (3, 3, 303, 3, 12);
INSERT INTO Meeting VALUES (4, 4, 304, 3, 13);

-- Notification Table
CREATE TABLE Notification (
NotificationID INT PRIMARY KEY,
EmployeeID INT,
NotificationDate DATE,
NotificationType VARCHAR2(50) CHECK (NotificationType IN ('mandatory', 'optional')),
FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

INSERT INTO Notification VALUES (1, 1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'mandatory');
INSERT INTO Notification VALUES (2, 2, TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'optional');
INSERT INTO Notification VALUES (3, 3, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 'mandatory');
INSERT INTO Notification VALUES (4, 4, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 'optional');

--Symptom Table
CREATE TABLE Symptom (
Row_ID INT PRIMARY KEY,
EmployeeID INT,
DateReported DATE,
SymptomID INT CHECK (SymptomID BETWEEN 1 AND 5),
FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

INSERT INTO Symptom VALUES (1, 1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 1);
INSERT INTO Symptom VALUES (2, 2, TO_DATE('2023-10-02', 'YYYY-MM-DD'), 2);
INSERT INTO Symptom VALUES (3, 3, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 2);
INSERT INTO Symptom VALUES (4, 4, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 4);

-- Scan Table
CREATE TABLE Scan (
ScanID INT PRIMARY KEY,
ScanDate DATE,
ScanTime INT CHECK (ScanTime BETWEEN 0 AND 23),
EmployeeID INT,
Temperature DECIMAL(3,1),
FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

INSERT INTO Scan VALUES (1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 9, 1, 36.6);
INSERT INTO Scan VALUES (2, TO_DATE('2023-10-02', 'YYYY-MM-DD'), 10, 2, 37.0);
INSERT INTO Scan VALUES (3, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 11, 3, 38.5);
INSERT INTO Scan VALUES (4, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 12, 4, 36.6);

-- Test Table
CREATE TABLE Test (
TestID INT PRIMARY KEY,
Location VARCHAR2(255),
TestDate DATE,
TestTime INT CHECK (TestTime BETWEEN 0 AND 23),
EmployeeID INT,
TestResult VARCHAR2(50) CHECK (TestResult IN ('positive', 'negative')),
FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

INSERT INTO Test VALUES (1, 'Company', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 14, 1, 'negative');
INSERT INTO Test VALUES (2, 'Hospital', TO_DATE('2023-10-02', 'YYYY-MM-DD'), 15, 2, 'positive');
INSERT INTO Test VALUES (3, 'Clinic', TO_DATE('2023-10-03', 'YYYY-MM-DD'), 16, 3, 'negative');
INSERT INTO Test VALUES (4, 'Company', TO_DATE('2023-10-04', 'YYYY-MM-DD'), 17, 4, 'positive');

-- Case Table
CREATE TABLE Cases (
CaseID INT PRIMARY KEY,
EmployeeID INT,
CaseDate DATE,
Resolution VARCHAR2(50) CHECK (Resolution IN ('back to work', 'left the company', 'deceased')),
FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

INSERT INTO Cases VALUES (1, 2, TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'left the company');
INSERT INTO Cases VALUES (2, 4, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 'back to work');
-- [Note: only 2 positive test cases]

--HealthStatus Table
CREATE TABLE HealthStatus (
Row_ID INT PRIMARY KEY,
EmployeeID INT,
HealthStatusDate DATE,
Status VARCHAR2(50) CHECK (Status IN ('sick', 'hospitalized', 'well')),
FOREIGN KEY (EmployeeID) REFERENCES Employee(ID)
);

INSERT INTO HealthStatus VALUES (1, 1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'well');
INSERT INTO HealthStatus VALUES (2, 2, TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'sick');
INSERT INTO HealthStatus VALUES (3, 3, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 'hospitalized');
INSERT INTO HealthStatus VALUES (4, 4, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 'sick');

SELECT * FROM Employee;
SELECT * FROM Meeting;
SELECT * FROM Notification;
SELECT * FROM Symptom;
SELECT * FROM Scan;
SELECT * FROM Test;
SELECT * FROM Cases;
SELECT * FROM HealthStatus;