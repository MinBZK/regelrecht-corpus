Feature: Alle routes van de loonkostensubsidie, Participatiewet artikel 10d
  Als gemeente
  Wil ik elke weg naar en elke rekenwijze van de loonkostensubsidie doorgerekend zien
  Zodat geen route alleen op papier bestaat

  # Toegevoegd 2026-10-11. De persona-scenario's lopen alleen over lid 2
  # onderdeel b met lid 4. Dit bestand dekt de overige routes van het
  # artikel, zodat elke uitkomst op de uitkomstenkaart een trace heeft:
  #   - lid 1 onderdeel a: het college heeft eerst de loonwaarde vastgesteld;
  #   - lid 1 onderdeel b met lid 5: vaststelling achterwege, 50 procent
  #     gedurende ten hoogste zes maanden, daarna lid 4;
  #   - lid 2 onderdeel a (onderwijs beëindigd) en c (zonder startkwalificatie);
  #   - lid 3: de Wsw-uitsluiting;
  #   - lid 4: het maximum van 70 procent dat bindt bij een lage loonwaarde.
  #
  # Bedragen per 1 juli 2026: minimumloon met vakantiebijslag 252396 eurocent;
  # vergoeding werkgeverslasten 25 procent = 63099; grondslag 315495; maximum
  # 70 procent = 220846,5; forfait 50 procent = 157747,5.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario: Lid 1 onderdeel a, loonwaarde vooraf vastgesteld, voltijd
    Given the following parameters:
      | bsn                                                       | 999990301  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | null       |
      | datum_einde_deelname_onderwijs_lid_2_a                    | null       |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false      |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | 60         |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | true       |
      | dienstbetrekking_is_tot_stand_gekomen                     | true       |
      | college_heeft_loonwaarde_vastgesteld                      | true       |
      | vaststelling_loonwaarde_blijft_achterwege                 | false      |
      | datum_aanvang_dienstbetrekking                            | 2026-06-01 |
    When I evaluate outputs "heeft_recht_op_lks_lid_1, heeft_recht_op_lks_lid_2, heeft_recht_op_lks, volgt_de_vijftig_procent_route, hoogte_lks_voltijd_eurocent_per_maand, hoogte_lks_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "heeft_recht_op_lks_lid_1" is true
    And output "heeft_recht_op_lks_lid_2" is false
    And output "heeft_recht_op_lks" is true
    And output "volgt_de_vijftig_procent_route" is false
    And output "hoogte_lks_voltijd_eurocent_per_maand" equals 100958.4
    And output "hoogte_lks_eurocent_per_maand" equals 100958.4

  Scenario: Lid 1 onderdeel b met lid 5, vaststelling achterwege, binnen zes maanden na aanvang
    # Aanvang 1 maart, peildatum 1 juli: binnen de zes maanden. Het college
    # heeft nog geen loonwaarde; het percentage staat op nul.
    Given the following parameters:
      | bsn                                                       | 999990302  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | null       |
      | datum_einde_deelname_onderwijs_lid_2_a                    | null       |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false      |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | 0          |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | true       |
      | dienstbetrekking_is_tot_stand_gekomen                     | true       |
      | college_heeft_loonwaarde_vastgesteld                      | false      |
      | vaststelling_loonwaarde_blijft_achterwege                 | true       |
      | datum_aanvang_dienstbetrekking                            | 2026-03-01 |
    When I evaluate outputs "heeft_recht_op_lks_lid_1, heeft_recht_op_lks, volgt_de_vijftig_procent_route, hoogte_lks_lid_5_voltijd_eurocent_per_maand, hoogte_lks_voltijd_eurocent_per_maand, hoogte_lks_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "heeft_recht_op_lks_lid_1" is true
    And output "heeft_recht_op_lks" is true
    And output "volgt_de_vijftig_procent_route" is true
    And output "hoogte_lks_lid_5_voltijd_eurocent_per_maand" equals 157747.5
    And output "hoogte_lks_voltijd_eurocent_per_maand" equals 157747.5
    And output "hoogte_lks_eurocent_per_maand" equals 157747.5

  Scenario: Lid 1 onderdeel b na zes maanden, het college heeft de loonwaarde alsnog vastgesteld, lid 4 geldt
    Given the following parameters:
      | bsn                                                       | 999990302  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | null       |
      | datum_einde_deelname_onderwijs_lid_2_a                    | null       |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false      |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | 60         |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | true       |
      | dienstbetrekking_is_tot_stand_gekomen                     | true       |
      | college_heeft_loonwaarde_vastgesteld                      | true       |
      | vaststelling_loonwaarde_blijft_achterwege                 | true       |
      | datum_aanvang_dienstbetrekking                            | 2025-12-01 |
    When I evaluate outputs "heeft_recht_op_lks, volgt_de_vijftig_procent_route, hoogte_lks_lid_5_voltijd_eurocent_per_maand, hoogte_lks_voltijd_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "heeft_recht_op_lks" is true
    And output "volgt_de_vijftig_procent_route" is false
    And output "hoogte_lks_lid_5_voltijd_eurocent_per_maand" equals 0
    And output "hoogte_lks_voltijd_eurocent_per_maand" equals 100958.4

  Scenario: Lid 2 onderdeel a, deelname aan onderwijs beëindigd in de zes maanden vóór de aanvang
    Given the following parameters:
      | bsn                                                       | 999990303  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | 2026-02-01 |
      | datum_einde_deelname_onderwijs_lid_2_a                    | 2025-10-01 |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false      |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | 60         |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | false      |
      | dienstbetrekking_is_tot_stand_gekomen                     | false      |
      | college_heeft_loonwaarde_vastgesteld                      | false      |
      | vaststelling_loonwaarde_blijft_achterwege                 | false      |
      | datum_aanvang_dienstbetrekking                            | 2026-01-01 |
    When I evaluate outputs "voorafgaand_relevante_onderwijsroute_of_doelgroep, aanvraag_lks_binnen_zes_maanden, heeft_recht_op_lks_lid_2, heeft_recht_op_lks" of "participatiewet"
    Then the execution succeeds
    And output "voorafgaand_relevante_onderwijsroute_of_doelgroep" is true
    And output "aanvraag_lks_binnen_zes_maanden" is true
    And output "heeft_recht_op_lks_lid_2" is true
    And output "heeft_recht_op_lks" is true

  Scenario: Lid 2 onderdeel c, onderwijs zonder startkwalificatie
    Given the following parameters:
      | bsn                                                       | 999990304  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | 2026-02-01 |
      | datum_einde_deelname_onderwijs_lid_2_a                    | null       |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false      |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | true       |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | 60         |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | false      |
      | dienstbetrekking_is_tot_stand_gekomen                     | false      |
      | college_heeft_loonwaarde_vastgesteld                      | false      |
      | vaststelling_loonwaarde_blijft_achterwege                 | false      |
      | datum_aanvang_dienstbetrekking                            | 2026-01-01 |
    When I evaluate outputs "voorafgaand_relevante_onderwijsroute_of_doelgroep, heeft_recht_op_lks_lid_2, heeft_recht_op_lks" of "participatiewet"
    Then the execution succeeds
    And output "voorafgaand_relevante_onderwijsroute_of_doelgroep" is true
    And output "heeft_recht_op_lks_lid_2" is true
    And output "heeft_recht_op_lks" is true

  Scenario: Lid 2 zonder voorafgaande route en zonder lid 1 geeft geen recht
    Given the following parameters:
      | bsn                                                       | 999990305  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | 2026-02-01 |
      | datum_einde_deelname_onderwijs_lid_2_a                    | 2025-03-01 |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false      |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | 60         |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | false      |
      | dienstbetrekking_is_tot_stand_gekomen                     | false      |
      | college_heeft_loonwaarde_vastgesteld                      | false      |
      | vaststelling_loonwaarde_blijft_achterwege                 | false      |
      | datum_aanvang_dienstbetrekking                            | 2026-01-01 |
    When I evaluate outputs "voorafgaand_relevante_onderwijsroute_of_doelgroep, heeft_recht_op_lks, hoogte_lks_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "voorafgaand_relevante_onderwijsroute_of_doelgroep" is false
    And output "heeft_recht_op_lks" is false
    And output "hoogte_lks_eurocent_per_maand" equals 0

  Scenario: Lid 3, een Wsw-dienstbetrekking is uitgesloten
    Given the following parameters:
      | bsn                                                       | 999990306  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | null       |
      | datum_einde_deelname_onderwijs_lid_2_a                    | null       |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false      |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | true       |
      | loonwaarde_percentage                                     | 60         |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | true       |
      | dienstbetrekking_is_tot_stand_gekomen                     | true       |
      | college_heeft_loonwaarde_vastgesteld                      | true       |
      | vaststelling_loonwaarde_blijft_achterwege                 | false      |
      | datum_aanvang_dienstbetrekking                            | 2026-06-01 |
    When I evaluate outputs "is_uitgesloten_lid_3, heeft_recht_op_lks_lid_1, heeft_recht_op_lks, hoogte_lks_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "is_uitgesloten_lid_3" is true
    And output "heeft_recht_op_lks_lid_1" is true
    And output "heeft_recht_op_lks" is false
    And output "hoogte_lks_eurocent_per_maand" equals 0

  Scenario: Lid 4, het maximum van 70 procent bindt bij een loonwaarde van 10 procent
    # Verschil 252396 − 25239,6 = 227156,4; maximum 220846,5 is lager.
    Given the following parameters:
      | bsn                                                       | 999990307  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | null       |
      | datum_einde_deelname_onderwijs_lid_2_a                    | null       |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false      |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | 10         |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | true       |
      | dienstbetrekking_is_tot_stand_gekomen                     | true       |
      | college_heeft_loonwaarde_vastgesteld                      | true       |
      | vaststelling_loonwaarde_blijft_achterwege                 | false      |
      | datum_aanvang_dienstbetrekking                            | 2026-06-01 |
    When I evaluate outputs "bruto_subsidie_eurocent_per_maand, maximum_subsidie_eurocent_per_maand, hoogte_lks_voltijd_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "bruto_subsidie_eurocent_per_maand" equals 227156.4
    And output "maximum_subsidie_eurocent_per_maand" equals 220846.5
    And output "hoogte_lks_voltijd_eurocent_per_maand" equals 220846.5

  Scenario: Lid 4, een loonwaarde van 100 procent laat geen verschil over
    Given the following parameters:
      | bsn                                                       | 999990308  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | null       |
      | datum_einde_deelname_onderwijs_lid_2_a                    | null       |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false      |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | 100        |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | true       |
      | dienstbetrekking_is_tot_stand_gekomen                     | true       |
      | college_heeft_loonwaarde_vastgesteld                      | true       |
      | vaststelling_loonwaarde_blijft_achterwege                 | false      |
      | datum_aanvang_dienstbetrekking                            | 2026-06-01 |
    When I evaluate outputs "heeft_recht_op_lks, hoogte_lks_voltijd_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "heeft_recht_op_lks" is true
    And output "hoogte_lks_voltijd_eurocent_per_maand" equals 0
