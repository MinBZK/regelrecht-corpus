# Source: No Memorie van Toelichting documents found for BWBR0031558
# No parliamentary examples available - proceeding without MvT-derived scenarios

Feature: Regeling taken NFI — scenarios

  Background:
    Given the calculation date is "2012-05-19"

  # No MvT documents found - scenarios are procedural only

  @kerntaken
  Scenario: NFI verricht onafhankelijk forensisch zaakonderzoek
    Given het NFI heeft een verfijnde researchopdracht ontvangen
    When het NFI de kerntaak uit artikel 1, eerste lid, onder a uitvoert
    Then levert het NFI een verslag op overwegend technisch, medisch-biologisch en natuurwetenschappelijk gebied

  @kerntaken
  Scenario: NFI ontwikkelt nieuwe onderzoeksmethoden
    Given er is behoefte aan verbeterde forensische onderzoeksmethoden
    When het NFI de kerntaak uit artikel 1, eerste lid, onder b uitvoert
    Then implementeren en ontwikkelt het NFI nieuwe onderzoeksmethoden en technieken

  @kerntaken
  Scenario: NFI fungeert als kennis- en expertisecentrum
    Given een internationale organisatie vraagt om forensische expertise
    When het NFI de kerntaak uit artikel 1, eerste lid, onder c uitvoert
    Then fungeert het NFI als (inter)nationaal kennis- en expertisecentrum

  @uitgebreid_aanbod
  Scenario: Activiteiten in verlengde van kerntaken
    Given een activiteit heeft onlosmakelijke samenhang met waarheidsvinding in strafzaken
    When artikel 1, tweede lid, onder a wordt toegepast
    Then kan het NFI producten of diensten leveren voor deze activiteit

  @uitgebreid_aanbod
  Scenario: Activiteiten voor handhaving rechtsorde
    Given een activiteit draagt bij aan handhaving van (inter)nationale rechtsorde
    When artikel 1, tweede lid, onder b wordt toegepaste
    Then kan het NFI producten of diensten leveren aan overheidsorganisaties

  @ondersteuning
  Scenario: Ondersteuning bij hulpverleningstaak politie
    Given de politie heeft behoefte aan ondersteuning volgens artikel 2 van de Politiewet 1993
    When artikel 1, tweede lid, onder c wordt toegepast
    Then levert het NFI producten of diensten aan de politie

  @afnemers
  Scenario: Producten en diensten aan openbaar ministerie
    Given het openbaar ministerie heeft een onderzoeksvraag
    When artikel 2, eerste lid wordt toegepast
    Then levert het NFI producten of diensten aan het openbaar ministerie

  @afnemers
  Scenario: Producten en diensten aan zittende magistratuur
    Given de zittende magistratuur heeft een onderzoeksvraag
    When artikel 2, eerste lid wordt toegepast
    Then levert het NFI producten of diensten aan de zittende magistratuur

  @afnemers
  Scenario: Producten en diensten aan politie
    Given de politie heeft een onderzoeksvraag
    When artikel 2, eerste lid wordt toegepast
    Then levert het NFI producten of diensten aan de politie

  @afnemers
  Scenario: Producten en diensten aan bijzondere opsporingsdiensten
    Given een bijzondere opsporingsdienst heeft een onderzoeksvraag
    When artikel 2, eerste lid wordt toegepast
    Then levert het NFI producten of diensten aan de bijzondere opsporingsdienst

  @afnemers
  Scenario: Producten en diensten aan ministerie van Veiligheid en Justitie
    Given het ministerie van Veiligheid en Justitie heeft een onderzoeksvraag
    When artikel 2, eerste lid wordt toegepast
    Then levert het NFI producten of diensten aan het ministerie

  @uitgebreid_afnemers
  Scenario: Producten en diensten voor artikel 1 tweede lid onder a
    Given een Nederlandse overheidsorganisatie vraagt om een activiteit in verlengde van kerntaken
    When artikel 2, tweede lid wordt toegepast
    Then kan het NFI producten of diensten leveren aan deze organisatie

  @uitgebreid_afnemers
  Scenario: Producten en diensten voor artikel 1 tweede lid onder b
    Given een internationale overheidsorganisatie vraagt om activiteiten voor handhaving rechtsorde
    When artikel 2, derde lid wordt toegepast
    Then kan het NFI producten of diensten leveren aan deze organisatie

  @uitgebreid_afnemers
  Scenario: Producten en diensten voor artikel 1 tweede lid onder c
    Given de politie heeft behoefte aan ondersteuning
    When artikel 2, vierde lid wordt toegepast
    Then levert het NFI producten of diensten aan de politie

  @speciale_zaken
  Scenario: Zaak van groot maatschappelijk belang
    Given een zaak van groot maatschappelijk belang die niet onder artikel 1 valt
    And de bijzondere deskundigheid van het NFI is vereist
    When de minister van Veiligheid en Justitie goedkeuring verleent
    Then kan het NFI een dienst of product leveren selon artikel 3

  @bekostiging
  Scenario: Middelen voor kerntaken
    Given het NFI voert kerntaken uit volgens artikel 1, eerste lid
    When artikel 4, eerste lid wordt toegepast
    Then draagt de minister van Veiligheid en Justitie zorg voor middelen

  @bekostiging
  Scenario: Afspraken over producten en diensten
    Given het NFI en afnemers uit artikel 2, eerste lid
    When artikel 4, eerste lid wordt toegepast
    Then worden afspraken gemaakt over te leveren producten en diensten en afrekening

  @bekostiging
  Scenario: Kosten in rekening brengen buiten afspraken
    Given een product of dienst valt buiten de afspraken uit artikel 4, eerste lid
    When artikel 4, tweede lid wordt toegepast
    Then kan het NFI kosten in rekening brengen volgens vastgesteld prijsbeleid

  @bekostiging
  Scenario: Kosten voor artikel 1 tweede lid
    Given een product of dienst zoals bedoeld in artikel 1, tweede lid
    When artikel 4, derde lid wordt toegepast
    Then brengt het NFI de samenhangende kosten in rekening bij de afnemers

  @intrekking
  Scenario: Intrekking Taakbeschikking NFI
    Given de nieuwe regeling treedt in werking
    When artikel 5 wordt toegepast
    Then wordt de Taakbeschikking Nederlands Forensisch Instituut (Stcrt. 2001, nr. 234) ingetrokken

  @citeertitel
  Scenario: Citeertitel van de regeling
    Given de regeling is vastgesteld
    When artikel 7 wordt toegepast
    Then wordt deze regeling aangehaald als "Regeling taken NFI"

  @inwerkingtreding
  Scenario: Inwerkingtreding van de regeling
    Given de regeling is geplaatst in de Staatscourant
    When artikel 6 wordt toegepast
    Then treedt deze regeling in werking met ingang van de dag na dagtekening
