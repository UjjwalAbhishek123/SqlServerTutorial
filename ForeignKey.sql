use NewTestDb

--Demonstration for FOREIGN KEY
---Main Table
create table Department(
DepartmentNo int PRIMARY KEY,
DepartmentName varchar(30),
DepartmentLocation char(30)
)
Go

INSERT INTO Department (DepartmentNo, DepartmentName, DepartmentLocation) Values (10, '.NET', 'Hyderabad')
INSERT INTO Department (DepartmentNo, DepartmentName, DepartmentLocation) Values (20, 'Java', 'Delhi')
INSERT INTO Department (DepartmentNo, DepartmentName, DepartmentLocation) Values (30, 'Python', 'Pune')

select * from Department

---Foreign key table
create table Employee2
(
EmpId int PRIMARY KEY,
EmpName varchar(30),
DepartmentNo int FOREIGN KEY
references Department(DepartmentNo) --creating Foreign Key
)
Go

--adding new column Salary
alter table Employee2 add Salary int;

insert into Employee2 Values(101, 'Abcd', 10); --allowed as DepartmentNo has value 10

--entering value to newly added column
update Employee2 SET [Salary] = 25000 where EmpId=101;

insert into Employee2 Values(102, 'Bcde', 20, 32000); --allowed as DepartmentNo has value 20 in Department Table
insert into Employee2 Values(103, 'Defg', 30, 52000); --allowed as DepartmentNo has value 30 in Department Table
insert into Employee2 Values(104, 'Fghi', 40, 22000); --Not allowed as DepartmentNo has No value 40 in Department Table

select * from Employee2
