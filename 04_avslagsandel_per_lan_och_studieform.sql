
-- The Skool kan se vart applikationer blir avlsagna och vad skillnaden är mellan distans och bunden form för varje län.

SELECT
Län,
studieform,
COUNT(*) AS antal_ansökningar,
SUM(CASE WHEN beslut = 'Avslag' THEN 1 END) AS antal_avslag,
ROUND(
    SUM(CASE WHEN beslut = 'Avslag' THEN 1 ELSE 0 END)
    * 100 / COUNT(*),
    2
    ) AS avslagna_procent
FROM ansokning
WHERE beslut IN ('Beviljad', 'Avslag')
GROUP BY län, studieform
ORDER BY län, studieform;

EXIT
