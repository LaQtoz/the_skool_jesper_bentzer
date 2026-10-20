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
FETCH FIRST 5 ROWS ONLY;

PROMPT
PROMPT ===================================================
PROMPT APPLICATIONS PER EDUCATION AREA
PROMPT ===================================================
SELECT utbildningsområde, COUNT(*) AS antal_ansökningar
FROM ansokning
GROUP BY utbildningsområde
ORDER BY antal_ansökningar DESC;


PROMPT
PROMPT ===================================================
PROMPT APPROVED APPLICATIONS PER EDUCATION AREA
PROMPT ===================================================
SELECT utbildningsområde, COUNT(*) AS beviljade_platser_total
FROM ansokning
GROUP BY utbildningsområde
ORDER BY beviljade_platser_total DESC;


PROMPT
PROMPT ===================================================
PROMPT DISAPROVED APPLICATIONS PER EDUCATION AREA
PROMPT ===================================================
SELECT utbildningsområde, COUNT(*) AS antal_avslagna
FROM ansokning
WHERE beslut = 'Avslag'
GROUP BY utbildningsområde
ORDER BY antal_avslagna DESC;

EXIT
