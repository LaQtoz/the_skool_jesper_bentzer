SET PAUSE OFF
SET PAGESIZE 50000
SET LINESIZE 200

PROMPT
PROMPT ===================================================
PROMPT A Antal ansökningar per utbildningsområde, sorterat efter flest ansökningar.
PROMPT ===================================================
-- Vi räknar ut antal ansökningar per utbildningsområde och sortera så vi får flest först.
SELECT utbildningsområde, COUNT(*) AS antal_ansökningar
FROM ansokning
GROUP BY utbildningsområde
ORDER BY antal_ansökningar DESC;


PROMPT
PROMPT ===================================================
PROMPT B Antal Beviljade ansökningar per utbildningsområde.
PROMPT ===================================================
-- Vi räknar ut hur många som vart Beviljade inom varje utbildningsområde.
SELECT utbildningsområde, COUNT(*) AS beviljade_platser_total
FROM ansokning
WHERE beslut = 'Beviljad'
GROUP BY utbildningsområde
ORDER BY beviljade_platser_total DESC;


PROMPT
PROMPT ===================================================
PROMPT C Antal Avslagna ansökningar per utbildningsområde.
PROMPT ===================================================
-- Vi räknar ut hur många som fick Avlsag inom de olika utbildningsområderna.
SELECT utbildningsområde, COUNT(*) AS antal_avslagna
FROM ansokning
WHERE beslut = 'Avslag'
GROUP BY utbildningsområde
ORDER BY antal_avslagna DESC;


PROMPT
PROMPT ===================================================
PROMPT D Antal Beviljade ansöknginar per utbildningsnamn inom Data/it.
PROMPT ===================================================
-- Vi räknar ut hur många som vart Baviljade inom alla olika utbildningar inom Data/IT.
SELECT utbildningsnamn, COUNT(*) AS approved_applications_total
FROM ansokning
WHERE beslut = 'Beviljad'
    AND utbildningsområde = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY approved_applications_total DESC;



PROMPT
PROMPT ===================================================
PROMPT E Antal Avslagna ansöknginar per utbildningsnamn inom Data/it.
PROMPT ===================================================
-- Vi räknar ut hur många som fick Avslag inom alla olika utbildningar inom Data/IT.
SELECT utbildningsnamn, COUNT(*) AS disaproved_applications_total
FROM ansokning
WHERE beslut = 'Avslag'
    AND utbildningsområde = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY disaproved_applications_total DESC;


PROMPT
PROMPT ===================================================
PROMPT F Antal beviljade ansökningar per utbildningsanordnare administrativ enhet & utbildningsnamn, inom Data/IT.
PROMPT ===================================================
-- Vi räknar inom Utbildningsanordnare_adminsitr och utbildningsnamn där besluten är Beviljade och utbildningsområdet är Data/IT.
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
PROMPT G Topp 5 län efter antal beviljade ansökningar.
PROMPT =================================================== 
-- Vi räknar inom Län efter de som har flest Beviljade beslut, och exkluderar <> Flera Kommuner och visar top 5 från den listan.
SELECT Län, COUNT(*) AS Top_5_Beviljade
FROM ansokning
WHERE beslut = 'Beviljad'
    AND Län <> 'Flera kommuner'
GROUP BY Län
ORDER BY Top_5_Beviljade DESC
FETCH FIRST 5 ROWS ONLY;

PROMPT
PROMPT ===================================================
PROMPT H Andel distans och andel bundna utbildningar inom prespektive utbildningsområde.
PROMPT ===================================================
-- Vi räknar antalet ansökningar med studieformen Distans och Bunden
-- * 100.0 / count(*) räknar ut det som procent.
SELECT 
    utbildningsområde,
ROUND(
    COUNT(CASE WHEN studieform = 'Distans' THEN 1 END)
    * 100.0 / COUNT(*), 2 ) AS andel_distans,
ROUND(
    COUNT(CASE WHEN studieform = 'Bunden'  THEN 1 END) 
    * 100.0 / COUNT(*), 2 ) AS andel_bunden
FROM ansokning
GROUP BY utbildningsområde;


PROMPT
PROMPT ===================================================
PROMPT I Antal utbildningar som innehåller ordet AI.
PROMPT ===================================================
-- Vi räknar ut varje unikt utbildningsnamn endast 1 gång och filtrerar fram utbildningsnamn som innehåller AI
SELECT COUNT(DISTINCT utbildningsnamn) AS antal_ai_utbildningar
FROM ansokning
WHERE UPPER(utbildningsnamn) LIKE '%AI%';

EXIT
