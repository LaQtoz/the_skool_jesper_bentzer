# the_skool_jesper_bentzer
Uppgift 1
Vi laddar in vår XLSX tabel till ansokning så den är redo för att bli använd.

BILD PÅ 01_load_ansokning.sql
<img width="397" height="75" alt="image" src="https://github.com/user-attachments/assets/74b9daea-8b7a-42c4-bb4f-ad65420e39f5" />

================================================================================================================================================================

Uppgift 2
I uppgift 2 så söker vi efter resultat I vår tabel ansokning.
Kör man vim 02_ansokning_EDA.sql så får man ut svar på följande frågor.
a)
Antal ansökningar per utbildningsområde, sorterat på flest ansökningar
b)
Antal BEVILJADE ansökningar per utbildningsområde
c)
Antal AVSLAGNA ansökningar per utbildningsområde
d)
Antal BEVILJADE ansökningar per utbildningsnamn inom Data/IT
e)
Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT
f)
Antal BEVILJADE ansökningar per utbildningsanordnare administrativ enhet & utbildningsnamn, inom Data/IT
g)
Topp 5 län efter antal beviljade ansökningar
h)
Andel distans och andel bundna utbildningar inom respektive utbildingsområde
i)
Antal utbildningar som innehåller ordet AI

EXEMPEL BILD PÅ FÖRSTA FRÅGAN 
<img width="521" height="123" alt="image" src="https://github.com/user-attachments/assets/ec912b21-1a16-4547-94c6-486267077a20" />

================================================================================================================================================================

Uppgitft 3
I 03_frågor.sql så hämtar vi information från vår lista för att svara på följande 4 frågor.

Fråga 1
-- Skiljer sig beviljandegraden för ansökningar mellan olika huvudmannatyper och utbildningslängder?
-- Resultatet kan hjälpa The Skool att identifiera mönster i myndighetens beslut och ge underlag för 
-- vidare analys inför framtida ansökningar.

Fråga 2
-- Vi undersöker hur skiljer sig andelen avslagna ansökningar mellan distansutbildningar och bundna utbildningar i olika län?
-- Resultatet kan hjälpa The Skool att identifiera län och studieformer där avslagsgraden är hög, 
-- så att företaget kan undersöka möjliga orsaker och förbättra framtida ansökningar.

Fråga 3
-- Hur varierar antalet sökta och beviljade utbildningsomgångar samt beviljandegraden mellan olika län och huvudmannatyper?
-- Resultatet kan hjälpa the Skool att identifiera vilka län och huvudmannatyper som får flest utbildningsomgångar beviljade 
-- och var det kan finnas skillnader i beviljandegrad.

Fråga 4
-- Vilka huvudmannatyper har flest beviljade ansökningar
-- Resultatet kan hjälpa the Skool att se vilka huvudmannatyper som står för flest beviljade ansökningar och använda 
-- informationen som underlag för att planera framtida ansökningar.

Exempel bild på Fråga 1, vi använder oss utav PROMPTS för att göra det lätt att se vad varje del ställer för fråga och ger svar på.
Noteringar kan också hittas i varje SQL script.
<img width="439" height="456" alt="image" src="https://github.com/user-attachments/assets/b20a20ee-23c5-4a0f-88cc-d9b8d92dea24" />

