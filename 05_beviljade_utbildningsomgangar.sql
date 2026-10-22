
-- 

SELECT
    Län,
    huvudmannatyp,
    SUM(SÖKTA_UTBILDNINGSOMGÅNGAR) AS Sokta_omgangar,
    SUM(BEVILJADE_UTBILDNINGSOMGÅNGAR) AS Beviljade_omgangar,
    SUM(SÖKTA_UTBILDNINGSOMGÅNGAR)
      - SUM(BEVILJADE_UTBILDNINGSOMGÅNGAR) AS Ej_beviljade_omgangar,
    ROUND(
        100 * SUM(BEVILJADE_UTBILDNINGSOMGÅNGAR)
        / NULLIF(SUM(SÖKTA_UTBILDNINGSOMGÅNGAR), 0),
        2
    ) AS Beviljandegrad_omgangar    
FROM ansokning
GROUP BY
    Län,
    Huvudmannatyp
ORDER BY
    Län,
    Huvudmannatyp;

EXIT
