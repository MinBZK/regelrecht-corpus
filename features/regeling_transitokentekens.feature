# Source: Stcrt. 2006, 246 (TOELICHTING) en BWBR0020708
# These scenarios are inferred from the Memorie van Toelichting and the regulation text.

Feature: Regeling transitokentekens

  @definitie
  Scenario: Definitie van transitokenteken
    Given een voertuig heeft een kenteken als bedoeld in artikel 4, derde lid, onderdeel b, van het Kentekenreglement
    When er een transitokenteken wordt aangevraagd according to Artikel 1
    Then wordt het kenteken erkend als transitokenteken

  @cooldown
  Scenario: Afwijzing aanvraag binnen 3 maanden
    Given een voertuig had een transitokenteken
    And het transitokenteken is minder dan 3 maanden geleden opgegeven
    When er een nieuwe aanvraag voor een transitokenteken wordt ingediend according to Artikel 2
    Then wordt de aanvraag buiten behandeling gelaten

  @cooldown
  Scenario: Toelating aanvraag na 3 maanden
    Given een voertuig had een transitokenteken
    And het transitokenteken is meer dan 3 maanden geleden opgegeven
    When er een nieuwe aanvraag voor een transitokenteken wordt ingediend according to Artikel 2
    Then wordt de aanvraag in behandeling genomen

  @apk_vrijstelling
  Scenario: Vrijstelling van APK voor voertuigen met transitokenteken
    Given een voertuig heeft een transitokenteken
    When Artikel 72, eerste lid, van de Wegenverkeerswet 1994 wordt toegepast
    Then is Artikel 72, eerste lid, van de wet niet van toepassing according to Artikel 3

  @inspectie
  Scenario: Voertuigpresentatie bij RDW voor niet-erkende aanvragers
    Given de aanvrager beschikt niet over de erkenning inschrijven met onderzoek
    And de aanvrager beschikt niet over de erkenning inschrijven zonder onderzoek
    When een aanvraag voor een transitokenteken wordt ingediend according to Artikel 4.1
    Then moet het voertuig worden aangeboden bij een RDW-locatie

  @inspectie
  Scenario: Inspectie na 1 jaar voor ambulances en zware voertuigen
    Given een voertuig is een ambulance
    And het voertuig is voor het eerst toegelaten
    When 1 jaar is verstreken sinds de toelating
    And een aanvraag voor een transitokenteken wordt ingediend according to Artikel 4.2
    Then moet het voertuig ter beschikking worden gesteld voor technische inspectie

  @inspectie
  Scenario: Inspectie na 3 jaar voor overige voertuigen
    Given een voertuig is geen ambulance, zwaar voertuig (>3500 kg), of personenvervoervoertuig
    And het voertuig is voor het eerst toegelaten
    When 3 jaren zijn verstreken sinds de toelating
    And een aanvraag voor een transitokenteken wordt ingediend according to Artikel 4.3
    Then moet het voertuig ter beschikking worden gesteld voor technische inspectie

  @inspectie
  Scenario: Vrijstelling van inspectie voor EU-voertuigen met geldig kentekenbewijs
    Given een voertuig heeft een geldig kentekenbewijs afgegeven door een EU-lidstaat
    And het voertuig heeft een geldig bewijs van periodieke keuring uit het land van oprinding
    When een aanvraag voor een transitokenteken wordt ingediend according to Artikel 4.4
    Then hoeft het voertuig niet ter beschikking te worden gesteld voor technische inspectie

  @inspectie
  Scenario: Steekproefsgewijze inspectie door RDW
    Given de RDW besluit tot steekproefsgewijze inspectie according to Artikel 4.5
    When een aanvraag voor een transitokenteken wordt ingediend
    Then kan de technische staat steekproefsgewijs worden vastgesteld

  @identiteit
  Scenario: Legitimatiebewijs voor natuurlijke personen
    Given de aanvrager is een natuurlijke persoon
    When een aanvraag voor een transitokenteken wordt ingediend according to Artikel 5.1
    Then moet de aanvrager een legitimatiebewijs overleggen als bedoeld in Artikel 2 van de Regeling legitimatievoorschriften kentekenbewijzen

  @identiteit
  Scenario: Documenten voor rechtspersonen
    Given de aanvraag wordt ingediend door een tekenbevoegde namens een rechtspersoon
    When een aanvraag voor een transitokenteken wordt ingediend according to Artikel 5.2
    Then moet de aanvrager de documenten overleggen als bedoeld in Artikel 3, eerste lid, van de Regeling legitimatievoorschriften kentekenbewijzen

  @verzekering
  Scenario: Verzekeringsplicht voor erkende bedrijven
    Given de aanvraag wordt ingediend door een erkend bedrijf namens een natuurlijke persoon
    When een aanvraag voor een transitokenteken wordt ingediend according to Artikel 5.3
    Then moet het erkende bedrijf de persoon die het voertuig op de openbare weg brengt informeren over de verzekeringsplicht according to de Wet aansprakelijkheidsverzekering motorrijtuigen

  @identiteit
  Scenario: Identiteitsonderzoek voertuig voor niet-erkende aanvragers
    Given de aanvrager beschikt niet over de erkenning inschrijven met onderzoek
    And de aanvrager beschikt niet over de erkenning inschrijven zonder onderzoek
    When een aanvraag voor een transitokenteken wordt ingediend
    Then vindt een onderzoek naar de identiteit van het voertuig plaats according to Artikel 4.6
