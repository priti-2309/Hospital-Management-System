#create database
create database hospital;
use hospital;

#create department table
CREATE TABLE department (
    departmentid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    head INT
);

#insert values in department table
INSERT INTO department(departmentid, name, head) VALUES
(1,'General Medicine', 4),
(2,'Surgery', 7),
(3,'Psychiatry', 9);

#create physician table
CREATE TABLE physician (
employeeid INT PRIMARY KEY,
name VARCHAR(100),
position VARCHAR(50),
ssn BIGINT
);

#insert values
INSERT INTO physician(employeeid, name, position,ssn) VALUES
(1,	'John Dorian', 'Staff internist', 111111111),
(2,	'Eliot Red', 'Attending Physician', 222222222),
(3,	'Christopher turk', 'Surgical Attending Physician', 333333333),
(4,	'Percival Cox',	'Senior Attending Physician', 444444444),
(5,	'Bob Kelso', 'Head Chief of Medicine', 555555555),
(6,	'Todd Quinlan', 'Surgical Attending Physician', 666666666),
(7, 'John Wen', 'Surgical Attending Physician',	777777777),
(8,	'Keith Dudemeister', 'MD Resident', 888888888),
(9,	'Molly Clock', 'Attending Psychiatrist', 999999999);

#create medication table
CREATE TABLE medication (
    code INT PRIMARY KEY,
    name VARCHAR(50),
    brand VARCHAR(50),
    description VARCHAR(255)
);

#insert values
INSERT INTO medication(code, name, brand, description) VALUES
(1, 'Procrastin-X',	'X', 'N/A'),
(2,	'Thesisin',	'Foo Labs',	'N/A'),
(3,	'Awakin', 'Bar Laboratories', 'N/A'),
(4,	'Crescavitin', 'Baz Industries', 'N/A'),
(5,	'Melioraurin', 'Snafu Pharmaceuticals',	'N/A');

#create procedures table
CREATE TABLE procedures (
    code INT PRIMARY KEY,
    name VARCHAR(100),
    cost DECIMAL(10,2)
);

#insert values
INSERT INTO procedures(code, name, cost) VALUES
(1,	'Reverse Rhinopodoplasty', 1500),
(2,	'Obtuse Pyloric Recombobulation', 3750),
(3,	'Folded Demiophtalmectomy', 4500),
(4,	'Complete Walletectomy', 10000),
(5,	'Obfuscated Dermogastrotomy', 4899),
(6,	'Reversible Pancreomyoplasty', 5600),
(7, 'Follicular Demiectomy', 25);

#create room table
CREATE TABLE room (
    roomnumber INT PRIMARY KEY,
    roomtype VARCHAR(50),
    blockfloor INT,
    blockcode INT,
    unavailable CHAR(1)
);

#insert values
INSERT INTO room(roomnumber, roomtype, blockfloor, blockcode, unavailable) VALUES
(101, 'Single', 1, 1, 'f'),
(102, 'Single',	1, 1, 'f'),
(103, 'Single',	1, 1, 'f'),
(111, 'Single',	1, 2, 'f'),
(112, 'Single', 1, 2, 't'),
(113, 'Single',	1, 2, 'f'),
(121, 'Single',	1, 3, 'f'),
(122, 'Single',	1, 3, 'f'),
(123, 'Single',	1, 3, 'f'),
(201, 'Single',	2, 1, 't'),
(202, 'Single',	2, 1, 'f'),
(203, 'Single',	2, 1, 'f'),
(211, 'Single',	2,	2, 'f'),
(212, 'Single',	2, 2, 'f'),
(213, 'Single',	2, 2, 't'),
(221, 'Single',	2, 3, 'f'),
(222, 'Single',	2, 3, 'f'),
(223, 'Single',	2, 3, 'f'),
(301, 'Single',	3, 1, 'f'),
(302, 'Single',	3, 1, 't'),
(303, 'Single',	3, 1, 'f'),
(311, 'Single',	3, 2, 'f'),
(312, 'Single',	3, 2, 'f'),
(313, 'Single',	3, 2, 'f'),
(321, 'Single',	3, 3, 't'),
(322, 'Single',	3, 3, 'f'),
(323, 'Single',	3, 3, 'f'),
(401, 'Single',	4, 1, 'f'),
(402, 'Single',	4, 1, 't'),
(403, 'Single',	4, 1, 'f'),
(411, 'Single',	4, 2, 'f'),
(412, 'Single',	4, 2, 'f'),
(413, 'Single',	4, 2, 'f'),
(421, 'Single',	4, 3, 't'),
(422, 'Single',	4, 3, 'f'),
(423, 'Single',	4, 3, 'f');

#create patient table
CREATE TABLE patient (
    ssn BIGINT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(10),
    insuranceid BIGINT,
    pcp INT,
    FOREIGN KEY (pcp) REFERENCES physician(employeeid)
);

#insert values
INSERT INTO patient(ssn, name, address, phone, insuranceid, pcp) VALUES
(100000001, 'John Smith', '42 Foobar Lane', '555-0256', 68476213, 1),
(100000002,	'Grace Ritchie', '37 Snafu Drive', '555-0512', 36546321, 2),
(100000003,	'Random J. Patient', '101 Omgbbq Street', '555-1204', 65465421, 2),
(100000004,	'Dennis Doe', '1100 Foobaz Avenue', '555-2048', 68421879, 3);
 
 #create affiliated_with table
CREATE TABLE affiliated_with (
    physician INT,
    department INT,
    primaryaffiliation CHAR(1),
    PRIMARY KEY (physician, department),
    FOREIGN KEY (physician) REFERENCES physician(employeeid),
    FOREIGN KEY (department) REFERENCES department(departmentid)
);

#insert values
INSERT INTO affiliated_with (physician, department, primaryaffiliation) VALUES
(1, 1, 't'),
(2, 1, 't'),
(3, 1, 'f'),
(3, 2, 't'),
(4, 1, 't'),
(5, 1, 't'),
(6, 2, 't'),
(7, 1, 'f'),
(7, 2, 't'),
(8, 1, 't'),
(9, 3, 't');

#create nurse table
CREATE TABLE nurse (
    employeeid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    registered CHAR(1),
    ssn BIGINT
);

#insert values
INSERT INTO nurse (employeeid, name, position, registered, ssn) VALUES
(101, 'Carla Epsino', 'Head Nurse', 't', 111111110),
(102, 'Laverne Roberts', 'Nurse', 't', 222222220),
(103, 'Paul Flowers', 'Nurse', 'f', 33333333);

#create appointment table
CREATE TABLE appointment (
    appointmentid BIGINT PRIMARY KEY,
    patient BIGINT NOT NULL,
    prepnurse INT NULL,
    physician INT NOT NULL,
    startdatetime DATETIME NOT NULL,
    enddatetime DATETIME NOT NULL,
    examinationroom VARCHAR(5) NOT NULL
);

#insert values
INSERT INTO appointment (appointmentid, patient, prepnurse, physician, startdatetime, enddatetime, examinationroom) VALUES
(13216584, 100000001, 101, 1, '2008-04-24 10:00:00', '2008-04-24 11:00:00', 'A'),
(26548913, 100000002, 101, 2, '2008-04-24 10:00:00', '2008-04-24 11:00:00', 'B'),
(36549879, 100000001, 102, 1, '2008-04-25 10:00:00', '2008-04-25 11:00:00', 'A'),
(46846589, 100000004, 103, 4, '2008-04-25 10:00:00', '2008-04-25 11:00:00', 'B'),
(59871321, 100000004, NULL, 4, '2008-04-26 10:00:00', '2008-04-26 11:00:00', 'C'),
(69879231, 100000003, 103, 2, '2008-04-26 10:00:00', '2008-04-26 00:00:00', 'C'),
(76983231, 100000001, NULL, 3, '2008-04-26 10:00:00', '2008-04-26 00:00:00', 'C'),
(86213939, 100000004, 102, 9, '2008-04-27 10:00:00', '2008-04-27 11:00:00', 'A'),
(93216548, 100000002, 101, 2, '2008-04-27 10:00:00', '2008-04-27 00:00:00', 'B');

#create trained_in table
CREATE TABLE trained_in (
    physician INT NOT NULL,
    treatment INT NOT NULL,
    certificationdate DATE NOT NULL,
    certificationexpires DATE NOT NULL,
    PRIMARY KEY (physician, treatment)
);

#insert values
INSERT INTO trained_in (physician, treatment, certificationdate, certificationexpires) VALUES
(3, 1, '2008-01-01', '2008-12-31'),
(3, 2, '2008-01-01', '2008-12-31'),
(3, 5, '2008-01-01', '2008-12-31'),
(3, 6, '2008-01-01', '2008-12-31'),
(3, 7, '2008-01-01', '2008-12-31'),
(6, 2, '2008-01-01', '2008-12-31'),
(6, 5, '2007-01-01', '2007-12-31'),
(6, 6, '2008-01-01', '2008-12-31'),
(7, 1, '2008-01-01', '2008-12-31'),
(7, 2, '2008-01-01', '2008-12-31'),
(7, 3, '2008-01-01', '2008-12-31'),
(7, 4, '2008-01-01', '2008-12-31'),
(7, 5, '2008-01-01', '2008-12-31'),
(7, 6, '2008-01-01', '2008-12-31'),
(7, 7, '2008-01-01', '2008-12-31');

#create stay table
CREATE TABLE stay (
    stayid BIGINT PRIMARY KEY,
    patient BIGINT NOT NULL,
    room INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL
);

#insert values
INSERT INTO stay (stayid, patient, room, start_time, end_time) VALUES
(3215, 100000001, 111, '2008-05-01 00:00:00', '2008-05-04 00:00:00'),
(3216, 100000003, 123, '2008-05-03 00:00:00', '2008-05-14 00:00:00'),
(3217, 100000004, 112, '2008-05-02 00:00:00', '2008-05-03 00:00:00');

#create undergoes table
CREATE TABLE undergoes (
    patient BIGINT NOT NULL,
    procedures INT NOT NULL,
    stay BIGINT NOT NULL,
    date DATETIME NOT NULL,
    physician INT NOT NULL,
    assistingnurse INT NULL
);

#insert values
INSERT INTO undergoes (patient, procedures, stay, date, physician, assistingnurse) VALUES
(100000001, 6, 3215, '2008-05-02 00:00:00', 3, 101),
(100000001, 2, 3215, '2008-05-03 00:00:01', 7, 101),
(100000004, 1, 3217, '2008-05-07 00:00:02', 3, 102),
(100000004, 5, 3217, '2008-05-09 00:00:03', 6, NULL),
(100000001, 7, 3217, '2008-05-10 00:00:04', 7, 102),
(100000004, 4, 3217, '2008-05-13 00:00:05', 3, 103);

#create on_call table
CREATE TABLE on_call (
    nurse INT NOT NULL,
    blockfloor INT NOT NULL,
    blockcode INT NOT NULL,
    oncallstart DATETIME NOT NULL,
    oncallend DATETIME NOT NULL
);

#insert values
INSERT INTO on_call (nurse, blockfloor, blockcode, oncallstart, oncallend) VALUES
(101, 1, 1, '2008-04-11 11:00:00', '2008-04-11 19:00:00'),
(101, 1, 2, '2008-04-11 11:00:00', '2008-04-11 19:00:00'),
(102, 1, 3, '2008-04-11 11:00:00', '2008-04-11 19:00:00'),
(103, 1, 1, '2008-04-11 19:00:00', '2008-04-12 03:00:00'),
(103, 1, 2, '2008-04-11 19:00:00', '2008-04-12 03:00:00'),
(103, 1, 3, '2008-04-11 19:00:00', '2008-04-12 03:00:00');

#create prescribes table
CREATE TABLE prescribes (
    physician INT NOT NULL,
    patient BIGINT NOT NULL,
    medication INT NOT NULL,
    date DATE NOT NULL,
    appointment BIGINT NULL,
    dose INT NOT NULL
);

#insert values
INSERT INTO prescribes (physician, patient, medication, date, appointment, dose) VALUES
(1, 100000001, 1, '2008-04-24', 13216584, 5),
(9, 100000002, 2, '2008-04-27', 86213939, 10),
(9, 100000003, 2, '2008-04-30', NULL, 5);

#1.Write a SQL query to identify the physicians who are the department heads. 
select p.employeeid, p.name, p.position, p.ssn from physician p 
JOIN department d
On p.employeeid=d.head;

#2.Write a SQL query to locate the floor and block where room number 212 is located. 
select blockfloor, blockcode from room
where roomnumber=212;

#3.Write a SQL query to count the number of unavailable rooms. Return count as "Number of unavailable rooms".
select count(*) as Number_of_unavailable_rooms from room where unavailable='t';

#4.	Write a SQL query to identify the physician and the department with which he or she is affiliated.
SELECT p.name AS physician_name, d.name AS department_name from physician p
JOIN affiliated_with a ON p.employeeid = a.physician
JOIN department d ON a.department = d.departmentid;

#5.Write a SQL query to find those physicians who have received special training. 
select DISTINCT p.employeeid, p.name from physician p 
JOIN trained_in t
ON p.employeeid=t.physician;

#6.Write a SQL query to identify the patients and the number of physicians with whom they have scheduled appointments. 
SELECT p.ssn, p.name, count(DISTINCT a.physician) AS num_physicians
FROM patient p
JOIN appointment a ON p.ssn = a.patient
GROUP BY p.ssn, p.name;

#7.Write a SQL query to count the number of unique patients who have been scheduled for examination room 'C'. 
select count(patient) as patients from appointment where examinationroom='C';

#8.Write a SQL query to count the number of available rooms for each floor in each block. Sort the result-set on floor ID, ID of the block. 
SELECT blockfloor, blockcode, COUNT(*) AS available_rooms
FROM Room
WHERE unavailable = 'f' OR unavailable = 0
GROUP BY blockfloor, blockcode
ORDER BY blockfloor, blockcode;

#9.Create a view to display the name of the patients, their block, floor, and room number where they are admitted.
CREATE VIEW PatientRoomDetails AS
SELECT p.name AS patient_name,
r.blockcode AS block,
r.blockfloor AS floor,
r.roomnumber AS room_number
FROM Patient p
JOIN Stay s ON p.ssn = s.patient
JOIN Room r ON s.room = r.roomnumber;
SELECT * FROM PatientRoomDetails;

#10.Write a SQL query to find those patients who have undergone a procedure costing more than $5,000, as well as the name of the physician who has provided primary care, should be identified. 
SELECT 
    pat.name AS patient_name,
    phy.name AS pcp_name,
    pr.name AS procedure_name,
    pr.cost
FROM Patient pat
JOIN Undergoes u
    ON pat.ssn = u.patient
JOIN Procedures pr
    ON u.procedures = pr.code
JOIN Physician phy
    ON pat.pcp = phy.employeeid
WHERE pr.cost > 5000;

#11.Write a SQL query to identify those patients whose primary care is provided by a physician who is not the head of any department. 
SELECT p.name AS patient_name, phy.name AS pcp_name
FROM Patient p
JOIN Physician phy 
ON p.pcp = phy.employeeid
WHERE p.pcp NOT IN (
    SELECT head
    FROM Department
    WHERE head IS NOT NULL
);

#12.Retrieve the names of patients who have been prescribed at least one medication by a physician from the Psychiatry department using a subquery.
SELECT DISTINCT p.name
FROM patient p
WHERE p.ssn IN (
    SELECT pr.patient
    FROM prescribes pr
    WHERE pr.physician IN (
        SELECT physician
        FROM affiliated_with
        WHERE department = (
            SELECT departmentid
            FROM department
            WHERE name = 'Psychiatry'
        )
    )
);

#13.Create a trigger that prevents inserting a new appointment if the physician does not have a primary affiliation with a department
DELIMITER $$

CREATE TRIGGER check_physician_primary_affiliation
BEFORE INSERT ON appointment
FOR EACH ROW
BEGIN
    -- Count primary affiliations
    IF (SELECT COUNT(*)
        FROM affiliated_with
        WHERE physician = NEW.physician
          AND primaryaffiliation = 't') = 0 THEN

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Physician does not have a primary department affiliation.';
    END IF;
END $$

DELIMITER ;

#14.Update the insurance ID of patients whose primary care physician (PCP) is 'John Dorian' to a new value '99999999'.
UPDATE patient
SET insuranceid = 99999999
WHERE pcp = (
    SELECT employeeid
    FROM physician
    WHERE name = 'John Dorian'
);

#15.Retrieve each physician's name along with the number of appointments they have, and show the ranking of each physician based on the number of appointments in descending order.
SELECT ph.name AS physician_name, count(a.appointmentid) AS appointment_count,
RANK() OVER (ORDER BY COUNT(a.appointmentid) DESC) AS appointment_rank
FROM physician ph
LEFT JOIN appointment a
    ON ph.employeeid = a.physician
GROUP BY ph.employeeid, ph.name
ORDER BY appointment_count DESC;




