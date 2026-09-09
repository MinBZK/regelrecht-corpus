Feature: Participatiewet, beschut werk (artikel 10b)
  Als afnemende wet (Ziektewet 29b lid 2 onderdeel f)
  Wil ik bij de Participatiewet kunnen opvragen of iemand arbeid verricht
  in beschut werk
  Zodat beschut werk één vindplaats heeft in plaats van een losse vlag

  # Artikel 10b lid 1 kent drie elementen: een persoon uit de doelgroep,
  # de vaststelling van het college dat de persoon uitsluitend in een
  # beschutte omgeving mogelijkheden tot arbeidsparticipatie heeft, en een
  # dienstbetrekking in zo'n omgeving. Het UWV-onderzoek achter de
  # vaststelling (lid 2 en 3) is niet gemodelleerd.

  Scenario: Wie met een vaststelling van het college in een beschutte dienstbetrekking werkt, verricht beschut werk
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990300 |
      | behoort_tot_doelgroep_10b_lid_1                  | true      |
      | college_heeft_vastgesteld_uitsluitend_beschut_werk | true    |
      | heeft_dienstbetrekking_beschut_werk              | true      |
    When I evaluate "verricht_arbeid_in_beschut_werk" of "participatiewet"
    Then the execution succeeds
    And output "is_uitsluitend_aangewezen_op_beschut_werk" is true
    And output "verricht_arbeid_in_beschut_werk" is true

  Scenario: Zonder vaststelling van het college is een dienstbetrekking geen beschut werk
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990300 |
      | behoort_tot_doelgroep_10b_lid_1                  | true      |
      | college_heeft_vastgesteld_uitsluitend_beschut_werk | false   |
      | heeft_dienstbetrekking_beschut_werk              | true      |
    When I evaluate "verricht_arbeid_in_beschut_werk" of "participatiewet"
    Then the execution succeeds
    And output "verricht_arbeid_in_beschut_werk" is false
