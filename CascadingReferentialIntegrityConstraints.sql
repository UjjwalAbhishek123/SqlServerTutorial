--DEMONSTRATION FOR CASCADING REFERENTIAL INTEGRITY CONSTRAINTS
---- FOREIGN KEY CONSTRAINT THAT TELL SQL SERVER TO PERFORM CERTAIN TASK WHEN USER TRIES TO UPDATE OR DELETE THE PRIMARY KEY RECORD
---- IN THE PRIMARY KEY TABLE

use NewTestDb

--Parent table
create table Gender
(
GenderID INT PRIMARY KEY,
Gender NVARCHAR(50)
)

--inserting values
insert into Gender values(1, 'Male')
insert into Gender values(2, 'Female')
insert into Gender values(3, 'Unknown')

select * from Gender


--delete from Gender where GenderID=1 => IT WILL LEAD TO THE ORPHAN RECORD IN THE

--Allowed Actions :-
--1. Set NULL -> set value in FK table to null, when user tries to delete/update the records in Primary Key Table
---------------> syntax => ON DELETE SET NULL
---------------> syntax => ON UPDATE SET NULL

--2. CASCADE -> if user deletes/updates records in primary key table, records in Foreign key table wll also delete/update
---------------> syntax => ON DELETE CASCADE
---------------> syntax => ON UPDATE CASCADE

--Child table
create table Person
(
PersonID INT PRIMARY KEY,
PersonName nvarchar(100) not null,
Email nvarchar(100) not null,
GenderID int FOREIGN KEY REFERENCES Gender(GenderID)
ON DELETE CASCADE
ON UPDATE CASCADE
)

----adding foreign key constraint to PErson table
--alter table Person add constraint Person_GenderId_FK FOREIGN KEY(GenderID) references Gender(GenderID)

--inserting values
insert into Person Values(1, 'abc', 'abc@gmail.com', 1)
insert into Person Values(2, 'pqr', 'pqr@gmail.com', 2)
insert into Person Values(3, 'xyz', 'xyz@gmail.com', 3)

--insert into Person Values(4, 'pranay', 'prana@gmail.com', 4) => NOT ALLOWED

select * from Person

delete from Gender where GenderID=2
--above stmt is allowed, after adding the cascading referential integrity to the FOREIGN KEY table

--3. SET DEFAULT -> if delete/update affects rows in foreign key table, the all rows having Foreign key are set to DEFAULT, provided
--FK columns have unique constrains
---------------> syntax => ON DELETE SET DEFAULT
---------------> syntax => ON UPDATE SET DEFAULT