--Views in SQL Server
--Virtual Table whose values are defined by a query
--do not store any data physically

use NewTestDb

--select * from [dbo].[Employee2]

--creating view
create VIEW vwHighSalaryEmployees AS
select Id, Name, Salary
from [dbo].[Employee2]
where Salary>27500;

create VIEW vwEmployeesByDepartment AS
select Department, COUNT(*) AS EmployeeCount
from [dbo].[Employee2]
GROUP BY Department;


--Updating Views
UPDATE [dbo].[vwHighSalaryEmployees]
SET Salary = Salary+5000
where Id = 8;

--Accessing Views
select * from [dbo].[vwEmployeesByDepartment];

--select * from [dbo].[vwHighSalaryEmployees];

--Deleting Views
--DROP view [dbo].[vwHighSalaryEmployees];