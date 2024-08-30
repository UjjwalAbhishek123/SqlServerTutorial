--CLAUSES ARE THERE FOR FILTERING, SORTING, FETCHING, GROUPING THE RECORDS

use NewTestDb

--create Gender Table
create table Gender2
(
GenderID int PRIMARY KEY IDENTITY(1,1),
Gender varchar(50)
)
go

--insert data in Gender2 table
insert into Gender2 Values('Male')
insert into Gender2 Values('Female')
insert into Gender2 Values('Unknown')

select * from Gender2

--create Department Table
create table Department2
(
DeptID int PRIMARY KEY IDENTITY(1,1),
DeptName nvarchar(100)
)
go

--insert into Department2 table
insert into Department2 values('IT')
insert into Department2 values('HR')
insert into Department2 values('Payroll')

select * from Department2

--create Employee Table
create table EmployeeNew
(
EmpId int PRIMARY KEY IDENTITY(1,1),
EmpName nvarchar(100),
EmailId nvarchar(100),
GenderID Int Foreign key references Gender2(GenderID),
DepartmentId int FOREIGN KEY references Department2(DeptID),
Salary int,
Age int,
City varchar(100)
)
go

--insert into EmployeeNew table
INSERT INTO EmployeeNew VALUES('PRANAYA','PRANAYA@G.COM',1, 1, 25000, 30,'MUMBAI')
INSERT INTO EmployeeNew VALUES('TARUN','TARUN@G.COM',1, 2, 30000, 27,'ODISHA')
INSERT INTO EmployeeNew VALUES('PRIYANKA','PRIYANKA@G.COM',2, 3, 27000, 25,'BANGALORE')
INSERT INTO EmployeeNew VALUES('PREETY','PREETY@G.COM',2, 3, 35000, 26,'BANGALORE')
INSERT INTO EmployeeNew VALUES('RAMESH','RAMESH@G.COM',3,2, 26000, 27,'MUMBAI')
INSERT INTO EmployeeNew VALUES('PRAMOD','PRAMOD@G.COM',1, 1, 29000, 28,'ODISHA')
INSERT INTO EmployeeNew VALUES('ANURAG','ANURAG@G.COM',1, 3, 27000, 26,'ODISHA')
INSERT INTO EmployeeNew VALUES('HINA','HINA@G.COM',2,2, 26000, 30,'MUMBAI')
INSERT INTO EmployeeNew VALUES('SAMBIT','HINA@G.COM',1, 1, 30000, 25,'ODISHA')
go

select * from EmployeeNew


--1. WHERE clause => Filters the record
select * from EmployeeNew WHERE City='Mumbai';

select * from EmployeeNew WHERE GenderID=1 AND Salary >= 27000;

select * from EmployeeNew WHERE GenderID=1 OR Salary >=29000;

Update EmployeeNew SET Salary=37000 WHERE DepartmentId=3;

select * from EmployeeNew WHERE DepartmentId=3;

DELETE from EmployeeNew where City='Mumbai';

--2. ORDER BY clause => Sort the record in asc/desc
select * from EmployeeNew ORDER BY EmpName;

select * from EmployeeNew ORDER BY EmpName Desc;

select * from EmployeeNew WHERE GenderID=1 ORDER BY EmpName Desc;

--3. GROUP BY clause => Group a set of rows, We should use AGGREGATE functions with GROUP BY
------- to get total number of employees
select COUNT(*) as TotalEmployee from EmployeeNew;

------- to get total number of employees in each department
Select DepartmentId, Count(*) as TotalEmployee from EmployeeNew GROUP BY DepartmentId

------- to get total salary in each department
select DepartmentId, TotalSalary=SUM(Salary) from EmployeeNew GROUP BY DepartmentId

------- to get max salary in each department
select DepartmentId, MaxSalary=Max(Salary) from EmployeeNew Group BY DepartmentId

--4. HAVING clause => Filter data like where clause ==>> same examples
