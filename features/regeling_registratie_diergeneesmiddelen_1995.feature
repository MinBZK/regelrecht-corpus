# Gherkin Test Scenarios for Regeling registratie diergeneesmiddelen 1995 (BWBR0006988)
# Generated from YAML: regulation/nl/wet/regeling_registratie_diergeneesmiddelen_1995/2004-12-15.yaml
# Fallback sources: Stcrt. 2004, 240 (amendment Toelichting)

## Artikel 5: Indienen van een aanvraag tot registratie
# Bron: BWBR0006988/2004-12-15.yaml (Artikel 5.1-5.5)

  Scenario: Registratieaanvraag moet volledig ingevuld formulier en dossier bevatten
    Given Een persoon gevestigd in een lidstaat of EER-staat
    When Deze persoon een aanvraag tot registratie van een diergeneesmiddel indient bij het Bureau
    Then Moet de aanvraag vinden via het daartoe bestemde aanvraagformulier
    And Moet de aanvraag vergezeld gaan van het volledig dossier
    And Moet het formulier volledig ingevuld zijn volgens de bijbehorende instructies
    And Moet het dossier volledig ingediend zijn in het vereiste aantal exemplaren

  Scenario: Aanvraagformulier moet voldoen aan EU-richtlijn 2001/82/EG
    Given Een aanvraag tot registratie van een diergeneesmiddel
    When Het aanvraagformulier wordt ingevuld
    Then Moet het formulier ten minste de gegevens bevatten die in Titel I, Deel 1, Onderdelen A en B van Bijlage I bij richtlijn nr. 2001/82/EG worden verlangd
    And Moet het formulier voldoen aan de in die bijlage aangegeven eisen

  Scenario: Dossier moet voldoen aan artikel 12 en EU-richtlijnen
    Given Een aanvraag tot registratie van een diergeneesmiddel
    When Het dossier wordt samengesteld
    Then Moet het dossier en het ingevulde aanvraagformulier te samen ten minste de gegevens bevatten bedoeld in artikel 12, derde lid, onderdelen a tot en met n
    And Moet het dossier voldoen aan de vereisten van richtlijn nr. 2001/82/EG en, in voorkomend geval, richtlijn nr. 90/167/EEG

## Artikel 8: Besluit omtrent registratie
# Bron: BWBR0006988/2004-12-15.yaml (Artikel 8.1-8.5)

  Scenario: Registratiebesluit binnen 210 dagen na ontvangst
    Given Een valide aanvraag tot registratie van een diergeneesmiddel
    When De aanvraag is ontvangen door het Bureau
    Then Moet het Bureau een besluit omtrent registratie nemen binnen 210 dagen na ontvangst

  Scenario: Mededeling van samenvatting van productkenmerken bij registratie
    Given Een besluit om registratie te verlenen
    When Het Bureau de registratie verleent
    Then Moet het Bureau aan de aanvrager de samenvatting van de productkenmerken mededelen zoals deze bij het besluit tot registratie is goedgekeurd

  Scenario: Afschrift van registratiebeschikking naar Europees Bureau
    Given Een besluit om registratie te verlenen
    When Het Bureau de registratie verleent
    Then Moet het Bureau een afschrift van de registratiebeschikking en van de goedgekeurde samenvatting van de productkenmerken doen toekomen aan het Europees Bureau voor de Geneesmiddelenbeoordeling

  Scenario: Beoordelingsrapport opstellen
    Given Een aanvraag tot registratie van een diergeneesmiddel
    When Het Bureau de aanvraag behandelt
    Then Moet de Commissie een beoordelingsrapport opstellen met een beoordeling van en opmerkingen over het dossier betreffende de resultaten van het analytisch, farmacologisch, toxicologisch en klinisch onderzoek

  Scenario: Beoordelingsrapport bijwerken met nieuwe gegevens
    Given Een beoordelingsrapport voor een diergeneesmiddel
    When Nieuwe gegevens beschikbaar komen die van belang zijn voor de beoordeling van de kwaliteit, veiligheid of werkzaamheid
    Then Moet het beoordelingsrapport bijgewerkt worden

## Artikel 11: Dossier samenstelling
# Bron: BWBR0006988/2004-12-15.yaml (Artikel 11, 11.a, 11.b)

  Scenario: Dossier moet voldoen aan EU-titels
    Given Een dossier voor een aanvraag tot registratie
    When Het dossier wordt opgesteld
    Then Moet het dossier opgesteld worden overeenkomstig Titel I, Deel 1, Onderdeel C, Deel 2, 3, 4, dan wel Titel II, Deel 5, Onderdeel C, Deel 6, 7, 8 en 9 van Bijlage I bij richtlijn nr. 2001/82/EG

  Scenario: Verklaring goede laboratoriumpraktijken
    Given Een dossier voor een aanvraag tot registratie
    When Het dossier wordt ingediend
    Then Moet een verklaring worden overgelegd waaruit blijkt dat het onderzoek is uitgevoerd in overeenstemming met de bepalingen ten aanzien van goede laboratoriumpraktijken zoals vastgelegd in richtlijn nr. 2004/10/EG en richtlijn nr. 2004/9/EG

  Scenario: Uitzondering voor toxicologische, farmacologische en klinische proeven
    Given Een aanvraag tot registratie van een diergeneesmiddel
    When De aanvrager kan aantonen dat aan specifieke voorwaarden is voldaan
    Then Hoeft de aanvrager geen resultaten van toxicologische, farmacologische en klinische proeven voor te leggen

  Scenario: Uitzondering voor in wezen gelijk diergeneesmiddel
    Given Een aanvraag tot registratie van een diergeneesmiddel
    When Het diergeneesmiddel in wezen gelijk is aan een reeds geregistreerd diergeneesmiddel
    And De houder van de registratie van het oorspronkelijke diergeneesmiddel heeft ingestemd met het gebruik van de referenties
    Then Hoeft de aanvrager geen resultaten van toxicologische, farmacologische en klinische proeven voor te leggen

  Scenario: Uitzondering voor gedocumenteerde veiligheid en werkzaamheid
    Given Een aanvraag tot registratie van een diergeneesmiddel
    When De aanvrager kan aantonen door middel van gedetailleerde bibliografische wetenschappelijke documentatie dat het bestanddeel of bestanddelen reeds vaak in de geneeskunde zijn toegepast
    And De doeltreffendheid vaststaat
    And Het veiligheidsniveau aanvaardbaar is
    Then Hoeft de aanvrager geen resultaten van toxicologische, farmacologische en klinische proeven voor te leggen

## Artikel 15: Homeopathische diergeneesmiddelen
# Bron: BWBR0006988/2004-12-15.yaml (Artikel 15.1-15.5)

  Scenario: Toepassing van paragraaf 3.1.1 op homeopathische diergeneesmiddelen
    Given Een aanvraag tot registratie van een homeopathisch diergeneesmiddel
    Then Is paragraaf 3.1.1 van toepassing

  Scenario: Uitzondering voor toxicologische en farmacologische proeven voor homeopathische middelen
    Given Een aanvraag tot registratie van een homeopathisch diergeneesmiddel
    When Het diergeneesmiddel is bestemd voor gezelschapsdieren of exotische diersoorten waarvan het vlees of producten niet voor menselijke consumptie worden gebruikt
    And De aanvrager kan aantonen door middel van gedetailleerde wetenschappelijke documentatie afgestemd op homeopathische veterinaire geneeskunde dat de doeltreffendheid vaststaat en het veiligheidsniveau aanvaardbaar is
    Then Hoeft de aanvrager geen resultaten van toxicologische, farmacologische en klimische proeven over te leggen

  Scenario: Vereenvoudigde dossiervereisten voorhomeopathische middelen
    Given Een aanvraag tot registratie van een homeopathisch diergeneesmiddel
    When Het diergeneesmiddel voldoet aan de voorwaarden van artikel 15.4
    Then Moet de aanvraag vergezeld gaan van:
      | Vereiste | Beschrijving |
      | Wetenschappelijke benaming | Van de homeopathische grondstof of grondstoffen |
      | Dossier | Met beschrijving van bereiding, controles, en homeopathisch karakter |
      | Fabricage- en controledossier | Voor elke farmaceutische vorm |
      | Vergunning | Afschrift van de vergunning voor bereiden, verpakken of etiketteren |
      | Registratiebewijzen | Afschrift van eventuele registratiebewijzen in andere lidstaten |
      | Monsters | Een of meer monsters of modellen van de verpakking |
      | Houdbaarheid | Gegevens betreffende de houdbaarheid |

  Scenario: Voorwaarden voor vereenvoudigde registratie van homeopathische middelen
    Given Een homeopathisch diergeneesmiddel
    When Het diergeneesmiddel is bestemd voor gezelschapsdieren of exotische soorten waarvan het vlees of producten niet voor menselijke consumptie bestemd zijn
    And De wijze van toediening is beschreven in de Europese Farmacopee of officieel gebruikte farmacopeeën
    And Er wordt geen specifieke therapeutische indicatie vermeld op het etiket of in de informatie
    And De verdunningsgraad is zodanig dat het diergeneesmiddel gegarandeerd onschadelijk is (niet meer dan 1 deel per 10.000 van de oertinctuur)
    Then Kan de aanvraag gebruikmaken van vereenvoudigde dossiervereisten

## Artikel 20: Verlenging en wijziging van registratie
# Bron: BWBR0006988/2004-12-15.yaml (Artikel 20.1-20.2)

  Scenario: Verlenging van registratie moet 3 maanden voor vervaldatum
    Given Een registratie van een diergeneesmiddel
    When De registratie binnenkort verloopt
    Then Moeten aanvragen tot verlenging ten minste 3 maanden voor het verstrijken van de termijn worden ingediend bij het Bureau

  Scenario: Toepassing van paragraaf 3.1.1 op verlenging van registratie
    Given Een aanvraag tot verlenging van een registratie
    Then Is paragraaf 3.1.1 van overeenkomstige toepassing

## Artikel 22: Kosten voor behandeling van aanvragen
# Bron: BWBR0006988/2004-12-15.yaml (Artikel 22.1-22.2)

  Scenario: Kosten voor behandeling van een aanvraag
    Given Een aanvraag als bedoeld in artikel 3, tweede lid, onderdeel a, van de wet
    Then Bedragen de kosten voor het in behandeling nemen van de aanvraag € 250

  Scenario: Maximale kosten voor bulk kleine wijzigingen
    Given Meerdere gelijktijdige aanvragen tot kleine wijziging van de eerste categorie door één aanvrager
    When De aanvragen uitsluitend betrekking hebben op een zelfde wijziging van verschillende registraties
    Then Bedragen de totale kosten niet meer dan € 2.000

## Artikel 23: Kosten van onderzoek
# Bron: BWBR0006988/2004-12-15.yaml (Artikel 23, 23.a)

  Scenario: Kosten voor onderzoek voor voedselproducerende dieren
    Given Een aanvraag voor een diergeneesmiddel bedoeld om mede of uitsluitend te worden toegepast bij voedselproducerende dieren
    When De aanvraag voldoet aan de voorwaarden van paragraaf 3.1.1
    And Artikelen 11, aanhef in samenhang met onderdeel b, onder 1 of 3, zijn niet van toepassing
    Then Bedragen de kosten van het onderzoek € 14.500

## Artikel 24: Register van diergeneesmiddelen
# Bron: BWBR0006988/2004-12-15.yaml (Artikel 24.1-24.5)

  Scenario: Register berust bij en wordt bijgehouden door het Bureau
    Given Het register bedoeld in artikel 9 van de wet
    Then Berust het register bij en wordt het bijgehouden door het Bureau

  Scenario: Register bestaat uit registerbladen
    Given Het register van diergeneesmiddelen
    Then Bestaat het register uit registerbladen overeenkomstig het bij deze regeling behorende model

  Scenario: Aantekeningen in registerblad
    Given Een registerblad voor een diergeneesmiddel
    When Er wijzigingen optreden betreffende de registratie
    Then Moeten in het vak aantekeningen van het registerblad de volgende zaken worden aangetekend:
      | Aantekening | Beschrijving |
      | Schorsing | van een inschrijving |
      | Opheffing | van een schorsing |
      | Doorhaling | van een inschrijving |
      | Wijziging | van een inschrijving |
      | Verlenging | van een inschrijving |

  Scenario: Bewaartermijn registerbladen na doorhaling
    Given Een inschrijving van een diergeneesmiddel in het register
    When De inschrijving is doorgehaald of vervallen
    Then Moeten de op dat diergeneesmiddel betrekking hebbende registerbladen nog ten minste 10 jaar bewaard worden
