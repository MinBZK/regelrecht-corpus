Feature: Reïntegratiebesluit, het drempelbedrag van artikel 3 en de nulstelling van artikel 11
  Grensscenario's, toegevoegd op 12 oktober 2026 na een mutatietest van de
  modellen: voor elke vergelijking die geen scenario op de grens zelf had,
  staat hier het geval precies op de grens en het geval er net naast.
  Peildatum 1 juli 2026. Tot nu toe had dit besluit geen eigen scenario's; de rekenregels
  werden alleen gelezen. Het minimumloon op 1 januari 2026 is de open term met standaardwaarde
  € 2.294,40.

  # Drempelbedrag: 1,85 x € 2.294,40 (minimumloon per maand op 1 januari 2026) / 21,75 = 19515,59 cent, afgerond € 195,16.
  # Kosten van 19515 cent liggen eronder, 19516 cent erboven.
  Scenario: Kosten één cent onder het drempelbedrag: geen subsidie (artikel 3 lid 1)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990618 |
      | kosten_voorziening_eurocent                             | 19515 |
      | gezamenlijke_waarde_voorzieningen_kalenderjaar_eurocent | 19515 |
    When I evaluate outputs "drempelbedrag_eurocent, subsidie_wordt_niet_verstrekt, mag_subsidie_ter_hoogte_van_gezamenlijke_waarde_verstrekken" of "reintegratiebesluit"
    Then the execution succeeds
    And output "drempelbedrag_eurocent" equals 19515.58620689655
    And output "subsidie_wordt_niet_verstrekt" is true
    And output "mag_subsidie_ter_hoogte_van_gezamenlijke_waarde_verstrekken" is false

  Scenario: Kosten boven het drempelbedrag: wel subsidie, en bij een gezamenlijke waarde erboven mag het UWV die waarde vergoeden (artikel 3)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990618 |
      | kosten_voorziening_eurocent                             | 19516 |
      | gezamenlijke_waarde_voorzieningen_kalenderjaar_eurocent | 19516 |
    When I evaluate outputs "subsidie_wordt_niet_verstrekt, mag_subsidie_ter_hoogte_van_gezamenlijke_waarde_verstrekken" of "reintegratiebesluit"
    Then the execution succeeds
    And output "subsidie_wordt_niet_verstrekt" is false
    And output "mag_subsidie_ter_hoogte_van_gezamenlijke_waarde_verstrekken" is true

  # Jaarminimumloon 12 x € 2.294,40 = € 27.532,80; de helft is € 13.766,40.
  Scenario: Werknemer in dienst gehouden met loon onder de helft van het jaarminimumloon: nulstelling (artikel 11 lid 1 a)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                     | 999990618 |
      | werknemer_in_dienst_gehouden            | true |
      | werknemer_in_dienst_genomen             | false |
      | loon_over_kalenderjaar_eurocent         | 1376639 |
      | werkgever_kan_korting_wfsv_49_toepassen | true |
    When I evaluate outputs "jaarminimumloon_eurocent, loon_onder_vijftig_procent_minimumloon, nulstelling_van_toepassing, bedrag_artikel_36_lid_1_a_eurocent" of "reintegratiebesluit"
    Then the execution succeeds
    And output "jaarminimumloon_eurocent" equals 2753280
    And output "loon_onder_vijftig_procent_minimumloon" is true
    And output "nulstelling_van_toepassing" is true
    And output "bedrag_artikel_36_lid_1_a_eurocent" equals 0

  Scenario: Loon precies de helft van het jaarminimumloon is niet minder dan de helft (artikel 11 lid 1 b), bedrag blijft € 0
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                     | 999990618 |
      | werknemer_in_dienst_gehouden            | false |
      | werknemer_in_dienst_genomen             | true |
      | loon_over_kalenderjaar_eurocent         | 1376640 |
      | werkgever_kan_korting_wfsv_49_toepassen | true |
    When I evaluate outputs "loon_onder_vijftig_procent_minimumloon, nulstelling_van_toepassing, bedrag_artikel_36_lid_1_a_eurocent" of "reintegratiebesluit"
    Then the execution succeeds
    And output "loon_onder_vijftig_procent_minimumloon" is false
    And output "nulstelling_van_toepassing" is true
    And output "bedrag_artikel_36_lid_1_a_eurocent" equals 0

  Scenario: Zonder korting van Wfsv artikel 49 zet lid 3 de nulstelling opzij (artikel 11 lid 3)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                     | 999990618 |
      | werknemer_in_dienst_gehouden            | true |
      | werknemer_in_dienst_genomen             | false |
      | loon_over_kalenderjaar_eurocent         | 1000000 |
      | werkgever_kan_korting_wfsv_49_toepassen | false |
    When I evaluate outputs "nulstelling_van_toepassing, bedrag_artikel_36_lid_1_a_eurocent" of "reintegratiebesluit"
    Then the execution succeeds
    And output "nulstelling_van_toepassing" is false

  Scenario: Niet in dienst gehouden en niet in dienst genomen: artikel 11 is niet van toepassing
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                     | 999990618 |
      | werknemer_in_dienst_gehouden            | false |
      | werknemer_in_dienst_genomen             | false |
      | loon_over_kalenderjaar_eurocent         | 1000000 |
      | werkgever_kan_korting_wfsv_49_toepassen | true |
    When I evaluate outputs "nulstelling_van_toepassing" of "reintegratiebesluit"
    Then the execution succeeds
    And output "nulstelling_van_toepassing" is false
