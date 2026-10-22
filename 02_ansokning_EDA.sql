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
PROMPT A APPLICATIONS PER EDUCATION AREA
PROMPT ===================================================
SELECT utbildningsområde, COUNT(*) AS antal_ansökningar
FROM ansokning
GROUP BY utbildningsområde
ORDER BY antal_ansökningar DESC;


PROMPT
PROMPT ===================================================
PROMPT B APPROVED APPLICATIONS PER EDUCATION AREA
PROMPT ===================================================
SELECT utbildningsområde, COUNT(*) AS beviljade_platser_total
FROM ansokning
WHERE beslut = 'Beviljad'
GROUP BY utbildningsområde
ORDER BY beviljade_platser_total DESC;


PROMPT
PROMPT ===================================================
PROMPT C DISAPROVED APPLICATIONS PER EDUCATION AREA
PROMPT ===================================================
SELECT utbildningsområde, COUNT(*) AS antal_avslagna
FROM ansokning
WHERE beslut = 'Avslag'
GROUP BY utbildningsområde
ORDER BY antal_avslagna DESC;


PROMPT
PROMPT ===================================================
PROMPT D APPROVED APPLICATIONS PER EDUCATIONNAMES IN Data/IT 
PROMPT ===================================================
SELECT utbildningsnamn, COUNT(*) AS approved_applications_total
FROM ansokning
WHERE beslut = 'Beviljad'
    AND utbildningsområde = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY approved_applications_total DESC;



PROMPT
PROMPT ===================================================
PROMPT E DISAPROVED APPLICATIONS PER EDUCATIONNAME IN Data/IT
PROMPT ===================================================
SELECT utbildningsnamn, COUNT(*) AS disaproved_applications_total
FROM ansokning
WHERE beslut = 'Avslag'
    AND utbildningsområde = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY disaproved_applications_total DESC;


PROMPT
PROMPT ===================================================
PROMPT F 
PROMPT ===================================================
SELECT
    utbildningsanordnare_administr,     
    utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM ansokning
WHERE beslut = 'Beviljad'
    AND utbildningsområde = 'Data/IT'
GROUP BY utbildningsanordnare_administr,
         utbildningsnamn
ORDER BY antal_beviljade DESC;


PROMPT
PROMPT ===================================================
PROMPT G 
PROMPT =================================================== 
SELECT Län, COUNT(*) AS Top_5_Approval_ratings
FROM ansokning
WHERE beslut = 'Beviljad'
GROUP BY Län
ORDER BY Top_5_Approval_Ratings DESC
FETCH FIRST 5 ROWS ONLY;

PROMPT
PROMPT ===================================================
PROMPT H 
PROMPT ===================================================
SELECT 
    utbildningsområde,
    COUNT(CASE WHEN studieform = 'Distans' THEN 1 END) AS Distans,
    COUNT(CASE WHEN studieform = 'Bunden'  THEN 1 END) AS Bunden 
FROM ansokning
GROUP BY utbildningsområde;


PROMPT
PROMPT ===================================================
PROMPT I 
PROMPT ===================================================
SELECT COUNT(*) AS AI_mention
FROM ansokning
WHERE utbildningsnamn LIKE '%AI%'


EXIT
