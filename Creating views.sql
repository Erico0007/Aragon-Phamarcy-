use AragonPharmacyDatabase
go
;
--Create a view and save it as PharmacistListView.

if OBJECT_ID('PharmacistListView', 'V') is not null
	drop view PharmacistListView
;
go

create view  PharmacistListView as 

Select*
from Employees
Where JobID= 2;
go

Select*from PharmacistListView;
go
-- Create a view and save it as EmployeeListView.

create view EmployeeListView
as 
Select count (*) as NumberRecords
from Employees
Where JobID IN (1,2,5);
GO

Select*from EmployeeListView;
go

--Create a view and save it as FirstEmployeeHiredListView

create view  FirstEmployeeHiredListView
as
Select TOP 1 EmpID,CONCAT(EmpFirst, EmpLast) as FullName , StartDate
from Employees
order by Startdate ASC;
GO 
Select*from  FirstEmployeeHiredListView;
go

--Create a view and save it as MostRecentHiredListView

Create view MostRecentHiredListView 
as 
Select TOP 1 EmpID,CONCAT(EmpFirst,EmpLast) as FullName , StartDate
from Employees
order by Startdate DESC;
GO

Select*from  MostRecentHiredListView ;
go

--Create a view and save it as EmployeePhoneListView.

Create view EmployeePhoneListView
as 
Select TOP 28 EmpID,CONCAT(EmpFirst,EmpLast) as FullName,Phone
from Employees
order by FullName asc;
go

Select*from EmployeePhoneListView ;
go


--Create a view and save it as EmployeeHourlyRateView

CREATE VIEW  EmployeeHourlyRateView
AS 
Select top 28 EmpID,CONCAT(EmpFirst,EmpLast) as FullName , HourlyRate
from employees
order by  HourlyRate DESC;
GO

Select*from  EmployeeHourlyRateView ;
go


--Create a view and save it as HourlyRateAnalysisView

create view HourlyRateAnalysisView
as 
Select 
 MAX (HourlyRate) as HighestHourlyRate,
 MIN (HourlyRate) AS LowestHourlyRate,
 AVG (Nullif (HourlyRate,0)) as AverageHourlyRate
 from Employees
 WHERE  Salary = 0;
 GO 


 Select*from  HourlyRateAnalysisView;
go


--Create a view and save it as SpeakSpanishView

Create view SpeakSpanishView
as 
Select EmpID,CONCAT(EmpFirst,EmpLast) as FullName , Memo
from Employees
Where memo like  'Speaks fluent Spanish';

go

 Select*from SpeakSpanishView;
go

--Create a view and save it as ReprimandListView

create view  ReprimandListView
as
Select EmpID,CONCAT(EmpFirst,EmpLast) as FullName , Memo
from employees
where memo like '%Reprimanded for tardiness%'
       OR memo like '%Reprimanded for missed shift%'
go

 Select*from ReprimandListView;
go



--Create a view and save it as StartDateListView

create view StartDateListView
as 
Select top 28 EmpID,CONCAT(EmpFirst,EmpLast) as FullName, StartDate
from employees 
where 
StartDate >= '2019-01-01' AND StartDate < '2020-01-01'
order  by StartDate desc;
go

 Select*from StartDateListView;
go