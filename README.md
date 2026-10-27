# the_skool_jesper_bentzer

Uppgift 1






================================================================================================================================================================

Uppgitft 3


-- Fråga 1
-- The Skool kan undersöka om beviljandegraden skiljer sig
-- mellan olika huvudmannatyper och utbildningslängder.
-- Resultatet kan hjälpa The Skool att identifiera mönster
-- i myndighetens beslut och ge underlag för vidare analys
-- inför framtida ansökningar.

PROMPT
PROMPT ===================================================
PROMPT FRÅGA 1
PROMPT ===================================================
SELECT
    huvudmannatyp,
-- Vi väljer fyra kolumer som visar olika typer av information.
-- CASE delar in utbildningarnas yh_poäng i olika grupper.
    CASE
        WHEN yh_poäng < 100 THEN 'Under 100 poäng'
        WHEN yh_poäng < 200 THEN '100-199 poäng'
        WHEN yh_poäng < 400 THEN '200-399 poäng'
        ELSE '400 poäng eller mer'
    END AS utbildningslängd,
-- COUNT(*) räknar antalet ansökningar inom varje grupp (Kommunal, Privat)
    COUNT(*) AS antal_ansokningar,
    SUM(
-- CASE ger beviljade ansökningar värdet 1 och övriga värdet 0
-- så att SUM kan räkna det totala antalet beviljade ansökningar.
        CASE
            WHEN beslut = 'Beviljad' THEN 1
            ELSE 0
        END
    ) AS antal_beviljade,
ROUND(
-- ROUND beräknar och avrundar andelen beviljade ansökningar i procent.
    100.0 * SUM(
        CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END
    ) / COUNT(*),
    2
) AS beviljadegrad_procent
FROM ansokning
-- Vi tar bara med ansökningar som är beviljade eller avslagna.
WHERE beslut IN ('Beviljad', 'Avslag')
-- Vi grupperar resultaten efter huvudmannatyp och utbildningslängd.
GROUP BY
    huvudmannatyp,
    CASE
        WHEN yh_poäng < 100 THEN 'Under 100 poäng'
        WHEN yh_poäng < 200 THEN '100-199 poäng'
        WHEN yh_poäng < 400 THEN '200-399 poäng'
        ELSE '400 poäng eller mer'
    END
ORDER BY huvudmannatyp;

=============================================================================================================================================================

-- Fråga 2
-- The Skool kan se vart applikationer blir avlsagna och vad skillnaden är mellan distans och bunden form för varje län.

PROMPT
PROMPT ===================================================
PROMPT FRÅGA 2
PROMPT ===================================================
SELECT
Län,
studieform,
-- vi räknar antalansökningar inom varje län och studieform för att se en skillnad mellan distans och bunden.
COUNT(*) AS antal_ansökningar,
-- Case ger Avslagna ansökningar en värde av 1 annars 0
-- Sum summerar värdet för att räkna antal avslagna ansökningar.
SUM(CASE WHEN beslut = 'Avslag' THEN 1 ELSE 0 END) AS antal_avslag,
-- Vi räknar ut procenten och avrundar andelen avslagna
ROUND(SUM(CASE WHEN beslut = 'Avslag' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2 ) AS avslagna_procent
FROM ansokning
-- vi filtrerar fram ansökningar med beslutet Beviljad eller Avslag.
WHERE beslut IN ('Beviljad', 'Avslag')
GROUP BY län, studieform
ORDER BY län, studieform;

=============================================================================================================================================================

-- Fråga 3
-- Hur varierar antalet sökta och beviljade utbildningsomgångar samt beviljandegraden mellan olika län och typer av utbildningsanordnare?

PROMPT
PROMPT ===================================================
PROMPT FRÅGA 3
PROMPT ===================================================
SELECT
Län,
huvudmannatyp,
-- Vi summerar antalet sökta och beviljade utbildiningomgångar och räknar ut skillnaden mellan sökta och beviljade för att få antalet ej beviljade omgångar och lägger dessa nummer i 3 olika listor
SUM(SÖKTA_UTBILDNINGSOMGÅNGAR) AS Sokta_omgangar,
SUM(BEVILJADE_UTBILDNINGSOMGÅNGAR) AS Beviljade_omgangar,
SUM(SÖKTA_UTBILDNINGSOMGÅNGAR)
- SUM(BEVILJADE_UTBILDNINGSOMGÅNGAR) AS Ej_beviljade_omgangar,
-- Vi avrundar och delar på beviljade och sökta utbildinginsomgångar och räknar ut % utav dom.
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

=============================================================================================================================================================

-- Fråga 4
-- Frågan visar vilka huvudmannatyper som har lfest beviljade ansökningar. Det gör det möjligt att jämföra olika typer av utbildningsanornare.

PROMPT
PROMPT ===================================================
PROMPT FRÅGA 4
PROMPT ===================================================
SELECT Huvudmannatyp, COUNT(*) AS antal_ansokningar
FROM ansokning
WHERE beslut = 'Beviljad'
GROUP BY huvudmannatyp
ORDER BY antal_ansokningar DESC;

EXIT
