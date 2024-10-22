--Basic important JOINS In SQL Server

create database CompanyDB;

use CompanyDB

create table Employee
(
Id int Primary Key, 
Name Varchar(100) NOT NULL,
Department VARCHAR(100) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);
Go

-- Populate Employee Table
Insert Into Employee (Id, Name, Department, Salary, Gender, Age, City) Values (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');

Select * from Employee

--create project table
create table Projects
(
ProjectId int Primary Key IDENTITY(1,1),
Title varchar(200) not null,
ClientId int,
EmployeeId int,
StartDate DATETIME,
EndDate DateTime,
FOREIGN KEY (EmployeeId) References Employee(Id)
);

-- Populate Projects Table
INSERT INTO Projects (Title, ClientId, EmployeeId, StartDate, EndDate) VALUES 
('Develop ecommerse website from scratch', 1, 1003, GETDATE(), (Getdate() + 35)),
('WordPress website for our company', 1, 1002, GETDATE(), (Getdate() + 45)),
('Manage our company servers', 2, 1007, GETDATE(), (Getdate() + 55)),
('Hosting account is not working', 3, 1009, GETDATE(), (Getdate() + 65)),
('MySQL database from my desktop application', 4, 1010, GETDATE(), (Getdate() + 75)),
('Develop new WordPress plugin for my business website', 2, NULL, GETDATE(), (Getdate() + 85)),
('Migrate web application and database to new server', 2, NULL, GETDATE(), (Getdate() + 95)),
('Android Application development', 4, 1004, GETDATE(), (Getdate() + 60)),
('Hosting account is not working', 3, 1001, GETDATE(), (Getdate() + 70)),
('MySQL database from my desktop application', 4, 1008, GETDATE(), (Getdate() + 80)),
('Develop new WordPress plugin for my business website', 2, NULL, GETDATE(), (Getdate() + 90));

select * from Projects

--INNER JOIN => Return only common/matching rows
select Id as EmployeeID, Name, Department, City, Title as Project, ClientId
from Employee
INNER JOIN Projects
ON Employee.Id = Projects.EmployeeId;

--Outer Join => Returns Matched + Unmatched rows from Both table
--Left Outer Join/Left Join => non matching(LEFT) + All matching (both)
select Id as EmployeeId, Name, Department, City, Title as Project, ClientId
from Employee
LEFT OUTER JOIN Projects
on Employee.Id = Projects.EmployeeId;

--Right Outer Join/Right Join => non matching(RIGHT) + All matching (both)
select Id as EmployeeId, Name, Department, City, Title as Project, ClientId
from Employee
RIGHT OUTER JOIN Projects
on Employee.Id = Projects.EmployeeId;

--Full Outer Join => all matching + non matching , and un-matched value will take NULL
select Id as EmployeeId, Name, Department, City, Title as Project, ClientId
from Employee
FULL OUTER JOIN Projects
on Employee.Id = Projects.EmployeeId;

--Cross Join => each record of a table is joined with each record of the other table i.e. CARTESIAN PRODUCT
SELECT Employee.Id as EmployeeId, Name, Department, City, Title as Project
FROM Employee 
CROSS JOIN Projects;