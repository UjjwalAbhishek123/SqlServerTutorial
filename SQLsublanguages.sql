create database TestDb

use [NewTestDb]

--DDL commands
---1. CREATE table
create table Students(
StudentID int PRIMARY KEY,
FirstName varchar(50),
LastName varchar(50),
Dob DATE
);


---2. ALTER
----add new column to the existing table
ALTER TABLE Students ADD Email nvarchar(100);
ALTER TABLE STUDENTS ADD PhoneNumber varchar(50);

----change/modify the datatype of the existing column
ALTER TABLE Students ALTER COLUMN FirstName nvarchar(100); 

----change/modify Name of the DATABASE
ALTER DATABASE TESTDB MODIFY NAME=NewTestDb

----drop existing column in table
ALTER TABLE STUDENTS DROP COLUMN PHONENUMBER;

---3. DROP
----drop database TestDropDb --it permanently deletes the database
----drop table [dbo].[Students2]----it permanently deletes the table

---4. TRUNCATE -> delete all the records , but table structure remains intact
TRUNCATE TABLE STUDENTS

---5. RENAME
Exec sp_rename 'Students.[Dob]', 'DateOfBirth', 'COLUMN'

-------x-x-x-x-x-x-x--xx-x-x-x-x-x-x-x-x--x-x-x-x-x-x-x-x-x-x-x-x-xx-x-x-x-x-x-x-x-x-x-x-x-x--x----------------------
--DML COMMANDS
--1. INSERT
insert into Students(
StudentID, FirstName,[LastName], [DateOfBirth], Email
) 
VALUES (01, 'Ujjwal', 'Abhishek', '1998-03-05', 'abc@gmail.com');

insert into Students(
StudentID, FirstName,[LastName], [DateOfBirth], Email
) 
VALUES(02, 'Abhishek', 'Kumar', '1998-01-01','bcd@gmail.com');

INSERT INTO STUDENTS VALUES(3, 'JATIN', 'CHAUDHARY', '1997-11-04', 'jatin@gmail.com'),
(4, 'Akhilesh', 'Sahu', '1998-09-17', 'akhileshsahu@gmail.com');

--2. UPDATE COMMAND
UPDATE Students 
SET Email = 'ujjwalabhishek@gmail.com' where StudentID=1;

--3. DELETE Command
DELETE from Students where StudentID=2;

--create database TestDropDb
--use TestDropDb

--DQL COMMAND
select * from Students
select FirstName as First_Name, LastName as Last_Name from Students;