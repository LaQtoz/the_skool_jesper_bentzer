
SELECT
    utbildningsanordnare_administr,
    utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM ansokning
WHERE beslut = 'Beviljad'
    AND utbildningsområde = 'Data/IT'
GROUP BY
    utbildningsanordnare_administr,
    utbildningsnamn
ORDER BY antal_beviljade DESC;
