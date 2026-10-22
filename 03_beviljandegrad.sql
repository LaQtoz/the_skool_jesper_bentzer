
-- The Skool kan undersöka om beviljandegraden skiljer sig
-- mellan olika huvudmannatyper och utbildningslängder.
-- Resultatet kan hjälpa The Skool att identifiera mönster
-- i myndighetens beslut och ge underlag för vidare analys
-- inför framtida ansökningar.

SELECT
    huvudmannatyp,
    CASE
        WHEN yh_poäng < 100 THEN 'Under 100 poäng' 
        WHEN yh_poäng < 200 THEN '100-199 poäng'
        WHEN yh_poäng < 400 THEN '200-399 poäng'
        ELSE '400 poäng eller mer'
    END AS utbildningslängd,
    COUNT(*) AS antal_ansokningar,
    SUM(
        CASE
            WHEN beslut = 'Beviljad' THEN 1
            ELSE 0
        END
    ) AS antal_beviljade,
ROUND(
    100.0 * SUM(
        CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END
    ) / COUNT(*),
    2
) AS beviljadegrad_procent
FROM ansokning
WHERE beslut IN ('Beviljad', 'Avslag')
GROUP BY
    huvudmannatyp,
    CASE 
        WHEN yh_poäng < 100 THEN 'Under 100 poäng'
        WHEN yh_poäng < 200 THEN '100-199 poäng'
        WHEN yh_poäng < 400 THEN '200-399 poäng'
        ELSE '400 poäng eller mer'
    END
ORDER BY huvudmannatyp;

EXIT
