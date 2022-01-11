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

SELECT "fullname" from "Employees";

SELECT "fullname", "phoneextension" FROM "Employees" WHERE "isparttime" = false;

INSERT INTO "Employees" ("fullname",  "salary", "jobposition", "phoneextension", "isparttime")
VALUES ('Bill Gates', '500', 'software developer', '101', 'true');

UPDATE "Employees" SET "salary" = '500' WHERE "jobposition" = 'Cook';

DELETE FROM "Employees" WHERE "fullname" = 'Lazy Larry';

ALTER TABLE "Employees" ADD Column "ParkingSpot" varchar(10); 
