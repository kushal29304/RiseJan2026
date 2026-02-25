USE A1

-- Triggers
-- Event Driven
-- DML (After (For), Instead of Trigger
-- DDL
-- Logon

-- Syntax
-- Create Trigger triggername
-- on <tablename>
-- For <DML/DDL>
-- As
-- Begin
--	 Print 'The record has been successfully inserted into the Employee Table '
-- End

Create Trigger trInsertMessage
on Employee
For Insert
As
Begin
	Print 'The record has been successfully inserted into the Employee Table '
End

select * from Employee
INSERT INTO Employee VALUES(8,'Shakti',29,'.NET',29000)
INSERT INTO Employee VALUES(9,'Happy',24,'AI',27000)

--Syntax to Disable the Trigger
--Disable trigger <triggername> on <tablename>
Disable trigger ALL on Employee

--Syntax to Enable the Trigger
--Enable trigger <triggername> on <tablename>
Enable trigger trInsertMessage on Employee

--Syntax to Drop the Trigger
--Drop trigger <triggername>
Drop trigger trInsertMessage