--NULL => Absence of data/value 
------ => its not 0 or EMPTY

use NewTestDb

drop table Employee

--1. default and NOT NULL constraint
create table Employee(
ID int NOT NULL,
LastName nvarchar(50) NOT NULL,
FirstName nvarchar(50),
Age int,
City nvarchar(100) DEFAULT 'Mumbai',
DateOfBirth date DEFAULT GETDATE(),
Salary decimal(18,2) default 5000.00
);

insert into Employee(ID, LastName, Age) values (1, 'Rout', 30)

select * from Employee

--2. Composite constraint-> Constraint created using combination of two or more columns
create table BranchDetails(
City varchar(50),
BranchCode varchar(10),
BranchLocation varchar(30),
CONSTRAINT city_bc_unique UNIQUE(City, BranchCode)
);

insert into BranchDetails(City, BranchCode, BranchLocation) values ('Mumbai', 'xyz', 'abc') --allowed
insert into BranchDetails(City, BranchCode, BranchLocation) values ('Mumbai', 'abc', 'pqr') --allowed (unique City, BranchCode)
insert into BranchDetails(City, BranchCode, BranchLocation) values ('Mumbai', 'xyz', 'pqr') --Not allowed(not unique)

select * from BranchDetails

--3. Primary Key constraint
create table Branches(
Bcode int PRIMARY KEY,
Bname varchar(40),
Bloc char(40)
);

insert into Branches Values(1021, 'SBI', 'Srinagar')
insert into Branches Values(1022, 'SBI', 'LaxmiSagar')

select * from Branches