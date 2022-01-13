CREATE TABLE IF NOT EXISTS "Employees"(
FullName TEXT,
Salary INT,
JobPosition TEXT,
PhoneExtension INT,
IsPartTime BOOLEAN
);

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('John Smith', '1800', 'Cook', '1', 'true');

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('John Lennon', '12000', 'Guitar', '43', 'false');

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('Paul McCartney', '20', 'Bass', '12', 'true');

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('Ringo Star', '7000', 'Drummer', '07', 'true');

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('George Harrison', '13000', 'Guitarist', '50', 'false');

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('Michael Jordan', '600', 'Captain', '23', 'false');

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('Dennis Rodman', '800', 'Player', '99', 'true');

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('Scottie Pippen', '650', 'Player', '33', 'true');

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('Bob Sagget', '300', 'Dad', '6', 'false');

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('Betty White', '15000', 'president', '10', 'false');

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('Lazy Larry', '15000', 'president', '10', 'false');

SELECT * FROM "Employees";

SELECT "fullname", "phoneextension" FROM "Employees" WHERE "isparttime" = false;

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('Bill Gates', '500', 'software developer', '101', 'true');

UPDATE "Employees" SET "salary" = '500' WHERE "jobposition" = 'Cook';

DELETE FROM "Employees" WHERE "fullname" = 'Lazy Larry';

ALTER TABLE "Employees" ADD Column "ParkingSpot" varchar(10); 


-- __________________________________________________________HMWK Part 2_______________________________________________________________________________________



--* In your CompanyDatabase, add a table named Departments with the following columns:
--    * Id as a primary key
    --* DepartmentName as text
    --* Building as text
Create Table "Departments" (
  "Id" SERIAL PRIMARY KEY,
  "DepartmentName" TEXT,
  "Building"  TEXT NOT Null
);

--* Add a Foreign key DepartmentId to your Employees Table. 
Alter Table "Employees" Add Column "DepartmentId" Integer Null References "Departments" ("Id");

--* Add tables named Products and Orders.
--* Products should have the columns:
--* Id as a primary key
--* Price as a data type that can store a number with decimal places (e.g. 45.12)
--* Name as textual data
--* Description as textual data
--* QuantityInStock as a data type that can store a number WITHOUT decimal places (e.g. 42)
Create Table "Products" (
  "Id"  SERIAL PRIMARY KEY,
  "Price" decimal,
  "Name"  TEXT,
  "Description" TEXT,
  "QuantityInStock" Int
);


--Orders should have the columns:
--* Id as a primary key
--* OrderNumber as textual data
--* DatePlaced as a data type that can store a date (with Year, Month, and Day) -- or one with hours, minutes, and seconds. Student's choice.
--* Email as textual data
Create Table "Orders" (
  "Id"  Serial Primary Key,
  "OrderNumber" Text,
  "DatePlaced"  date,
  "Email" text
);

--* In our company, one Order can have many Products and one Product can have many Orders. This will be a Many-to-Many relationship. 
-- Create the necessary table ProductOrders, foreign keys, and the OrderQuantity field needed for this to happen.
Create Table "ProductOrders" (
  "Id"  Serial Primary Key,
  "OrderQuantity" Int,
  "OrderId" Integer Null References "Orders" ("Id"),
  "ProductId" Integer Null References "Products" ("Id")
)

--[ ] Create queries that can do the following:
--* Insert the following Departments
--Department Name		Building
--Development			  Main
--Marketing				  North
Insert Into "Departments" ("DepartmentName", "Building")
Values ('Development', 'Main');
Insert Into "Departments" ("DepartmentName", "Building")
Values ('Marketing', 'North');



--	Insert the following Employees
--	FullName	•	Salary	•	JobPosition	•	PhoneExtension	•	IsPartTime	•	Department Id
--	Tim Smith	•	40000	•	Programmer	•	123	•	false	•	1
--	Barbara Ramsey	•	80000	•	Manager	•	234	•	false	•	1
--	Tom Jones	•	32000	•	Admin	•	456	•	true	•	2
Insert Into "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
Values ('Tim Smith', '40000', 'Programmer', '123', 'false', '1');
Insert Into "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
Values ('Barbara Jones', '80000', 'Manager', '234', 'false', '1');
Insert Into "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
Values ('Tom Jones', '32000', 'Admin', '456', 'true', '2');

--	•	Insert the following Products
--	Price	•	Name	•	Description	•	QuantityInStock
--	12.45	•	Widget	•	The Original Widget	•	100
--	99.99	•	Flowbee	•	Perfect for haircuts	•	3
Insert Into "Products" ("Price", "Name", "Description", "QuantityInStock")
Values ('12.45', 'Widget', 'The Original Widget', '100');
Insert Into "Products" ("Price", "Name", "Description", "QuantityInStock")
Values ('99.99', 'Flowbee', 'Perfect for haircuts', '3');

-- 	•	[ ] Insert a new order with order number X529, placed on Jan 1st, 2020 at 4:55PM, by someone with the email address "person@example.com"
Insert Into "Orders" ("OrderNumber", "DatePlaced", "Email")
Values ('X529', '2020-01-01', 'person@example.com');

-- * [ ] Add an order quantity of 3 for the product named Widget to the order X529
Insert Into "ProductOrders" ("OrderQuantity", "OrderId", "ProductId")
Values (3, 1, 1);

-- * [ ] Add an order quantity of 2 for the product named Flowbee to the order X529
Insert Into "ProductOrders" ("OrderQuantity", "OrderId", "ProductId")
Values (2, 1, 2);

-- * [ ] Given a building, return all employees that work in that building. 
-- Show this query for buildings named North Side, East Side, and finally a building that you actually have in your data 
-- even if your data doesn't have any departments in those buildings. 
-- NOTE this means you can't manually look up Ids and use them, you have to let SQL do that work. (Hint: JOIN)
SELECT *
FROM "Departments"
JOIN "Employees" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'North';

SELECT *
FROM "Departments"
JOIN "Employees" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'East';

SELECT *
FROM "Departments"
JOIN "Employees" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'Main';

SELECT *
FROM "Departments"
JOIN "Employees" ON "Employees"."DepartmentId" = "Departments"."Id"

-- * [ ] Find all orders that contain the product id of 2.
Select * 
FROM "ProductOrders"
WHERE "ProductId" = 2;

-- * [ ] Find the quantity of the Flowbee product from order with order number X529. 
-- You may not write the value of an Id in your query, let SQL do the work (HINT: JOIN)
SELECT "ProductOrders"."OrderQuantity"
FROM "ProductOrders"
JOIN "Orders" ON "ProductOrders"."OrderId"="Orders"."Id"
JOIN "Products"ON "ProductOrders"."ProductId"="Products"."Id"
WHERE "Products"."Name"='FlowBee' AND "Orders"."OrderNumber"='X529';

