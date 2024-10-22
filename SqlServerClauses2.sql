--Top N Clause in SQL Server
use NewTestDb

create table Employee2
(
Id int Primary Key Identity(1,1),
Name varchar(100),
EmailId varchar(100),
Gender Varchar(100),
Department VARCHAR(100),
Salary INT,
Age INT,
CITY VARCHAR(100)
)
Go

--Insert some test data into Person table
INSERT INTO Employee2 VALUES('PRANAYA','PRANAYA@G.COM','Male', 'IT', 25000, 30,'MUMBAI')
INSERT INTO Employee2 VALUES('TARUN','TARUN@G.COM','Male', 'Payroll', 30000, 27,'ODISHA')
INSERT INTO Employee2 VALUES('PRIYANKA','PRIYANKA@G.COM','Female', 'IT', 27000, 25,'BANGALORE')
INSERT INTO Employee2 VALUES('PREETY','PREETY@G.COM','Female', 'HR', 35000, 26,'BANGALORE')
INSERT INTO Employee2 VALUES('RAMESH','RAMESH@G.COM','Male','IT', 26000, 27,'MUMBAI')
INSERT INTO Employee2 VALUES('PRAMOD','PRAMOD@G.COM','Male','HR', 29000, 28,'ODISHA')
INSERT INTO Employee2 VALUES('ANURAG','ANURAG@G.COM','Male', 'Payroll', 27000, 26,'ODISHA')
INSERT INTO Employee2 VALUES('HINA','HINA@G.COM','Female','HR', 26000, 30,'MUMBAI')
INSERT INTO Employee2 VALUES('SAMBIT','HINA@G.COM','Male','Payroll', 30000, 25,'ODISHA')
INSERT INTO Employee2 VALUES('MANOJ','MANOJ@G.COM','Male','HR', 30000, 28,'ODISHA')
INSERT INTO Employee2 VALUES('SWAPNA','SWAPNA@G.COM','Female', 'Payroll', 28000, 27,'MUMBAI')
INSERT INTO Employee2 VALUES('LIMA','LIMA@G.COM','Female','HR', 30000, 30,'BANGALORE')
INSERT INTO Employee2 VALUES('DIPAK','DIPAK@G.COM','Male','Payroll', 32000, 25,'BANGALORE')
GO

select * from Employee2

--delete from Employee2 where Id<=18;

--DBCC CHECKIDENT ('Employee2', RESEED, 0)

select TOP(3)
Id, Name, EmailId, Gender, CITY, Department
FRom Employee2
WHERE Gender='Male'
ORDER BY Id;

select Top(70) percent
Id, Name, EmailId, Gender, CITY, Department
from Employee2
where Gender='Male'
Order By Id;

--Filtering Rows using Where clause
SELECT CITY, SUM(Salary) as TotalSalary
from Employee2
where (City='Mumbai' or CITY='BANGALORE' or CITY='ODISHA')
Group By City;

--Filtering ROws using Having clause
select City, SUM(Salary) as TotalSalary 
from Employee2
group By City
having CITY='Mumbai';


--filter the results so that only departments with a total Salary greater than 140000
select Department, SUM(Salary) as TotalSalary
from Employee2
Group By Department
Having SUM(Salary) > 140000;

--return the name of each department and the minimum salary in the department, minimum salary > 25000
select Department, MIN(Salary) as 'Lowest Salary'
from Employee2
Group By Department
Having Min(Salary) > 25000;

--return the name of each department and the maximum salary in the department, maximum salary > 27000
select Department, MAX(Salary) as 'Highest Salary'
from Employee2
Group By Department
Having Max(Salary) > 27000;

--return the name of each department and the Average salary of each department, 
--only those departments where the average salary is greater than 27000
select Department, AVG(Salary) as 'Average Salary'
from Employee2
Group By Department
Having AVG(Salary) > 27000;