# Source: BWBR0022813 (Regeling projectsaldering luchtkwaliteit 2007)
# These scenarios are inferred from the substantive rules in Articles 2 and 3.

Feature: Regeling projectsaldering luchtkwaliteit 2007

  @Artikel2
  Scenario: Besluit bevat alle benodigde onderdelen voor projectsaldering
    Given een besluit voor uitoefening van een bevoegdheid met projectsaldering
    When het besluit een beschrijving bevat van de beoogde ontwikkeling of activiteit
    And het besluit een omschrijving bevat van het plangebied en het salderingsgebied
    And het besluit een topografische kaart bevat waarop de gebieden zijn weergegeven
    And het besluit een beschrijving bevat van de toename of vermindering van de concentratie van een stof in het salderingsgebied
    And het besluit een beschrijving bevat van de autonome situatie die als uitgangspunt is genomen
    And het besluit een beschrijving bevat van de maatregelen en hun effect op de concentratie van de betreffende stof
    And het besluit een beschrijving bevat van het tijdstip of de termijn waarbinnen de maatregelen worden uitgevoerd
    Then bevat het besluit alle benodigde onderdelen according to Artikel 2

  @Artikel2
  Scenario: Besluit mist vereiste onderdelen voor projectsaldering
    Given een besluit voor uitoefening van een bevoegheid met projectsaldering
    When het besluit geen beschrijving bevat van de beoogde ontwikkeling of activiteit
    Then bevat het besluit niet alle benodigde onderdelen according to Artikel 2

  @Artikel3
  Scenario: Motivering bevat alle benodigde overwegingen voor projectsaldering
    Given een besluit voor uitoefening van een bevoegdheid met projectsaldering
    When de motivering overwegingen bevat met betrekking tot mogelijkheden tot het voorkomen of beperken van de toename van de concentratie van een stof in het plangebied
    And de motivering overwegingen bevat met betrekking tot de geografische of functionele samenhang tussen het plangebied en het salderingsgebied
    And de motivering overwegingen bevat met betrekking tot kwalitatief omschreven gevolgen van zowel de toename als de vermindering van de concentratie van een stof
    And de motivering overwegingen bevat met betrekking tot de manier waarop bij de vaststelling van de maatregelen rekening is gehouden met het aantal mensen dat wordt blootgesteld aan een toename of vermindering van de concentratie van een stof
    And de motivering overwegingen bevat met betrekking tot het tijdstip of de termijn waarbinnen de maatregelen worden uitgevoerd
    And de motivering overwegingen bevat met betrekking tot de waarborgen die getroffen worden opdat de maatregelen daadwerkelijk worden uitgevoerd
    Then bevat de motivering alle benodigde overwegingen according to Artikel 3

  @Artikel3
  Scenario: Motivering mist vereiste overwegingen voor projectsaldering
    Given een besluit voor uitoefening van een bevoegdheid met projectsaldering
    When de motivering geen overwegingen bevat met betrekking tot mogelijkheden tot het voorkomen of beperken van de toename van de concentratie van een stof in het plangebied
    Then bevat de motivering niet alle benodigde overwegingen according to Artikel 3
