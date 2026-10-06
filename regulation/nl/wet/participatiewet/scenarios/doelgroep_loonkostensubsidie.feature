Feature: Doelgroep loonkostensubsidie, met de mogelijkheden tot arbeidsparticipatie
  Als gemeente
  Wil ik weten of iemand valt onder de omschrijving van de doelgroep
  loonkostensubsidie in Participatiewet artikel 6 lid 1 onderdeel e
  Zodat zichtbaar is waaraan het college toetst voordat het op grond van
  artikel 10c vaststelt dat iemand tot de doelgroep behoort

  # Toegevoegd 2026-10-06. Artikel 6 lid 1 onderdeel e vraagt dat iemand "wel
  # mogelijkheden tot arbeidsparticipatie" heeft. Wat dat is, staat in artikel 1
  # van het Besluit loonkostensubsidie Participatiewet: een taak kunnen
  # uitvoeren, basale werknemersvaardigheden, een uur aaneengesloten kunnen
  # werken, en ten minste vier uur per dag belastbaar zijn, of twee uur en dan
  # per uur ten minste het minimumloon per uur verdienen.
  #
  # Het minimumloon per uur komt uit de Wet minimumloon, artikel 8 met de
  # herziening per 1 juli 2026: 1499 eurocent. Zie de marking bij artikel 1 van
  # het besluit over de omrekening op 38 uur die lid 2 nog noemt.
  #
  # Artikel 10d leest de vaststelling van het college als gegeven
  # (behoort_tot_doelgroep_lks). Deze scenario's raken die keten niet.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario: Koen valt onder de omschrijving van de doelgroep
    # Koen werkt 32 uur per week, dus ruim vier uur per dag.
    Given the following parameters:
      | bsn                                                               | 999993653 |
      | is_persoon_artikel_7_lid_1_a_of_7a                                | true      |
      | is_persoon_kring_ambtshalve_vaststelling                          | true      |
      | datum_vorige_aanvraag_doelgroepvaststelling                       | null      |
      | is_vastgesteld_kan_met_voltijdse_arbeid_minimumloon_niet_verdienen | true      |
      | is_persoon_artikel_10d_lid_2                                      | false     |
      | kan_taak_uitvoeren_in_arbeidsorganisatie                          | true      |
      | beschikt_over_basale_werknemersvaardigheden                       | true      |
      | kan_ten_minste_een_uur_aaneengesloten_werken                      | true      |
      | belastbaarheid_uren_per_dag                                       | 6.4       |
      | verdienvermogen_per_uur_eurocent                                  | null      |
    When I evaluate "voldoet_aan_omschrijving_doelgroep_lks" of "participatiewet"
    Then the execution succeeds
    And output "voldoet_aan_omschrijving_doelgroep_lks" is true

  Scenario: Drie uur per dag belastbaar en het minimumloon per uur verdienen is genoeg
    Given the following parameters:
      | bsn                                                               | 999993653 |
      | is_persoon_artikel_7_lid_1_a_of_7a                                | true      |
      | is_persoon_kring_ambtshalve_vaststelling                          | true      |
      | datum_vorige_aanvraag_doelgroepvaststelling                       | null      |
      | is_vastgesteld_kan_met_voltijdse_arbeid_minimumloon_niet_verdienen | true      |
      | is_persoon_artikel_10d_lid_2                                      | false     |
      | kan_taak_uitvoeren_in_arbeidsorganisatie                          | true      |
      | beschikt_over_basale_werknemersvaardigheden                       | true      |
      | kan_ten_minste_een_uur_aaneengesloten_werken                      | true      |
      | belastbaarheid_uren_per_dag                                       | 3         |
      | verdienvermogen_per_uur_eurocent                                  | 1499      |
    When I evaluate "voldoet_aan_omschrijving_doelgroep_lks" of "participatiewet"
    Then the execution succeeds
    And output "voldoet_aan_omschrijving_doelgroep_lks" is true

  Scenario: Drie uur per dag belastbaar en één cent onder het minimumloon per uur is niet genoeg
    Given the following parameters:
      | bsn                                                               | 999993653 |
      | is_persoon_artikel_7_lid_1_a_of_7a                                | true      |
      | is_persoon_kring_ambtshalve_vaststelling                          | true      |
      | datum_vorige_aanvraag_doelgroepvaststelling                       | null      |
      | is_vastgesteld_kan_met_voltijdse_arbeid_minimumloon_niet_verdienen | true      |
      | is_persoon_artikel_10d_lid_2                                      | false     |
      | kan_taak_uitvoeren_in_arbeidsorganisatie                          | true      |
      | beschikt_over_basale_werknemersvaardigheden                       | true      |
      | kan_ten_minste_een_uur_aaneengesloten_werken                      | true      |
      | belastbaarheid_uren_per_dag                                       | 3         |
      | verdienvermogen_per_uur_eurocent                                  | 1498      |
    When I evaluate "voldoet_aan_omschrijving_doelgroep_lks" of "participatiewet"
    Then the execution succeeds
    And output "voldoet_aan_omschrijving_doelgroep_lks" is false

  Scenario: Wie onder artikel 10d lid 2 valt, hoort er ook zonder die mogelijkheden bij
    Given the following parameters:
      | bsn                                                               | 999993653 |
      | is_persoon_artikel_7_lid_1_a_of_7a                                | true      |
      | is_persoon_kring_ambtshalve_vaststelling                          | true      |
      | datum_vorige_aanvraag_doelgroepvaststelling                       | null      |
      | is_vastgesteld_kan_met_voltijdse_arbeid_minimumloon_niet_verdienen | true      |
      | is_persoon_artikel_10d_lid_2                                      | true      |
      | kan_taak_uitvoeren_in_arbeidsorganisatie                          | true      |
      | beschikt_over_basale_werknemersvaardigheden                       | true      |
      | kan_ten_minste_een_uur_aaneengesloten_werken                      | true      |
      | belastbaarheid_uren_per_dag                                       | 1         |
      | verdienvermogen_per_uur_eurocent                                  | null      |
    When I evaluate "voldoet_aan_omschrijving_doelgroep_lks" of "participatiewet"
    Then the execution succeeds
    And output "voldoet_aan_omschrijving_doelgroep_lks" is true
