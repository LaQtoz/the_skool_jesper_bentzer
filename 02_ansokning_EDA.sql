SET PAGESIZE 100
SET LINESIZE 200

-- CHeck wich table we are describing
DESC ansokning

-- Count the rows in the table
Select COUNT(*)
FROM ansokning;



-- Display the first 20 rows
SELECT *
FROM ansokning
FETCH FIRST 20 ROWS ONLY;

EXIT
