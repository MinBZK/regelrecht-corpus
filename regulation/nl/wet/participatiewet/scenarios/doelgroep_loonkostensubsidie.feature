Feature: Doelgroep loonkostensubsidie, Participatiewet artikel 6 lid 1 onderdeel e
  Als gemeente
  Wil ik weten of iemand valt onder de omschrijving van de doelgroep
  loonkostensubsidie in Participatiewet artikel 6 lid 1 onderdeel e
  Zodat zichtbaar is waaraan het college toetst voordat het op grond van
  artikel 10c vaststelt dat iemand tot de doelgroep behoort

  # Toegevoegd 2026-10-06, teruggebracht 2026-10-11. Artikel 6 lid 1
  # onderdeel e vraagt drie dingen: een persoon als bedoeld in artikel 7 lid 1
  # onderdeel a of 7a, van wie is vastgesteld dat hij met voltijdse arbeid het
  # minimumloon niet kan verdienen, en die "wel mogelijkheden tot
  # arbeidsparticipatie" heeft. Wie onder artikel 10d lid 2 valt, hoort er ook
  # bij.
  #
  # Wat mogelijkheden tot arbeidsparticipatie zijn, regelt de algemene
  # maatregel van bestuur van artikel 10e lid 1 (Besluit loonkostensubsidie en
  # minimumbedragen studietoeslag Participatiewet 2021, artikel 2). De jurist
  # heeft dat besluit op 25 september 2026 buiten de scope geplaatst; het
  # oordeel is hier een aangeleverd feit.
  #
  # Artikel 10d leest de vaststelling van het college als gegeven
  # (behoort_tot_doelgroep_lks). Deze scenario's raken die keten niet.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario: Koen valt onder de omschrijving van de doelgroep
    Given the following parameters:
      | bsn                                                                | 999993653 |
      | is_persoon_artikel_7_lid_1_a_of_7a                                 | true      |
      | is_persoon_kring_ambtshalve_vaststelling                           | true      |
      | datum_vorige_aanvraag_doelgroepvaststelling                        | null      |
      | is_vastgesteld_kan_met_voltijdse_arbeid_minimumloon_niet_verdienen | true      |
      | heeft_mogelijkheden_tot_arbeidsparticipatie                        | true      |
      | is_persoon_artikel_10d_lid_2                                       | false     |
    When I evaluate "voldoet_aan_omschrijving_doelgroep_lks" of "participatiewet"
    Then the execution succeeds
    And output "voldoet_aan_omschrijving_doelgroep_lks" is true

  Scenario: Zonder mogelijkheden tot arbeidsparticipatie valt iemand erbuiten
    Given the following parameters:
      | bsn                                                                | 999993653 |
      | is_persoon_artikel_7_lid_1_a_of_7a                                 | true      |
      | is_persoon_kring_ambtshalve_vaststelling                           | true      |
      | datum_vorige_aanvraag_doelgroepvaststelling                        | null      |
      | is_vastgesteld_kan_met_voltijdse_arbeid_minimumloon_niet_verdienen | true      |
      | heeft_mogelijkheden_tot_arbeidsparticipatie                        | false     |
      | is_persoon_artikel_10d_lid_2                                       | false     |
    When I evaluate "voldoet_aan_omschrijving_doelgroep_lks" of "participatiewet"
    Then the execution succeeds
    And output "voldoet_aan_omschrijving_doelgroep_lks" is false

  Scenario: Zolang het oordeel over de mogelijkheden ontbreekt, is er geen doelgroep
    Given the following parameters:
      | bsn                                                                | 999993653 |
      | is_persoon_artikel_7_lid_1_a_of_7a                                 | true      |
      | is_persoon_kring_ambtshalve_vaststelling                           | true      |
      | datum_vorige_aanvraag_doelgroepvaststelling                        | null      |
      | is_vastgesteld_kan_met_voltijdse_arbeid_minimumloon_niet_verdienen | true      |
      | heeft_mogelijkheden_tot_arbeidsparticipatie                        | null      |
      | is_persoon_artikel_10d_lid_2                                       | false     |
    When I evaluate "voldoet_aan_omschrijving_doelgroep_lks" of "participatiewet"
    Then the execution succeeds
    And output "voldoet_aan_omschrijving_doelgroep_lks" is false

  Scenario: Wie onder artikel 10d lid 2 valt, hoort er ook zonder die mogelijkheden bij
    Given the following parameters:
      | bsn                                                                | 999993653 |
      | is_persoon_artikel_7_lid_1_a_of_7a                                 | true      |
      | is_persoon_kring_ambtshalve_vaststelling                           | true      |
      | datum_vorige_aanvraag_doelgroepvaststelling                        | null      |
      | is_vastgesteld_kan_met_voltijdse_arbeid_minimumloon_niet_verdienen | true      |
      | heeft_mogelijkheden_tot_arbeidsparticipatie                        | false     |
      | is_persoon_artikel_10d_lid_2                                       | true      |
    When I evaluate "voldoet_aan_omschrijving_doelgroep_lks" of "participatiewet"
    Then the execution succeeds
    And output "voldoet_aan_omschrijving_doelgroep_lks" is true
