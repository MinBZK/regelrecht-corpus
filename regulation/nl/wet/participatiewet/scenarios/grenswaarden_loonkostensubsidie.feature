Feature: Participatiewet, grenzen van de termijnen in artikel 10, 10c en 10d
  Grensscenario's, toegevoegd op 12 oktober 2026 na een mutatietest van de
  modellen: voor elke vergelijking die geen scenario op de grens zelf had,
  staat hier het geval precies op de grens en het geval er net naast.
  Peildatum 1 juli 2026; de parameterblokken komen uit loonkostensubsidie_routes,
  doelgroep_loonkostensubsidie en voorzieningen_arbeidsinschakeling.

  # Lid 2: "binnen zes maanden na aanvang van de dienstbetrekking". Het model leest de dag
  # zes maanden na de aanvang als de laatste dag van de termijn (kleiner dan of gelijk).
  Scenario: Aanvraag precies zes maanden na de aanvang valt nog binnen de termijn van lid 2
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                       | 999990601 |
      | behoort_tot_doelgroep_lks                                 | true |
      | kan_minimumloon_niet_verdienen                            | true |
      | datum_aanvraag_lks                                        | 2026-07-01 |
      | datum_einde_deelname_onderwijs_lid_2_a                    | 2025-10-01 |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false |
      | is_wsw_dienstbetrekking                                   | false |
      | loonwaarde_percentage                                     | 60 |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36 |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | false |
      | dienstbetrekking_is_tot_stand_gekomen                     | false |
      | college_heeft_loonwaarde_vastgesteld                      | false |
      | vaststelling_loonwaarde_blijft_achterwege                 | false |
      | datum_aanvang_dienstbetrekking                            | 2026-01-01 |
    When I evaluate outputs "aanvraag_lks_binnen_zes_maanden, heeft_recht_op_lks_lid_2" of "participatiewet"
    Then the execution succeeds
    And output "aanvraag_lks_binnen_zes_maanden" is true
    And output "heeft_recht_op_lks_lid_2" is true

  Scenario: Aanvraag één dag na zes maanden valt buiten de termijn van lid 2
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                       | 999990601 |
      | behoort_tot_doelgroep_lks                                 | true |
      | kan_minimumloon_niet_verdienen                            | true |
      | datum_aanvraag_lks                                        | 2026-07-02 |
      | datum_einde_deelname_onderwijs_lid_2_a                    | 2025-10-01 |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false |
      | is_wsw_dienstbetrekking                                   | false |
      | loonwaarde_percentage                                     | 60 |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36 |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | false |
      | dienstbetrekking_is_tot_stand_gekomen                     | false |
      | college_heeft_loonwaarde_vastgesteld                      | false |
      | vaststelling_loonwaarde_blijft_achterwege                 | false |
      | datum_aanvang_dienstbetrekking                            | 2026-01-01 |
    When I evaluate outputs "aanvraag_lks_binnen_zes_maanden, heeft_recht_op_lks_lid_2" of "participatiewet"
    Then the execution succeeds
    And output "aanvraag_lks_binnen_zes_maanden" is false
    And output "heeft_recht_op_lks_lid_2" is false

  Scenario: Aanvraag op de dag van aanvang zelf telt als aanvraag na aanvang
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                       | 999990601 |
      | behoort_tot_doelgroep_lks                                 | true |
      | kan_minimumloon_niet_verdienen                            | true |
      | datum_aanvraag_lks                                        | 2026-02-01 |
      | datum_einde_deelname_onderwijs_lid_2_a                    | 2025-10-01 |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false |
      | is_wsw_dienstbetrekking                                   | false |
      | loonwaarde_percentage                                     | 60 |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36 |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | false |
      | dienstbetrekking_is_tot_stand_gekomen                     | false |
      | college_heeft_loonwaarde_vastgesteld                      | false |
      | vaststelling_loonwaarde_blijft_achterwege                 | false |
      | datum_aanvang_dienstbetrekking                            | 2026-02-01 |
    When I evaluate outputs "aanvraag_lks_binnen_zes_maanden" of "participatiewet"
    Then the execution succeeds
    And output "aanvraag_lks_binnen_zes_maanden" is true

  Scenario: Aanvraag vóór de aanvang van de dienstbetrekking is geen aanvraag binnen zes maanden na aanvang
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                       | 999990601 |
      | behoort_tot_doelgroep_lks                                 | true |
      | kan_minimumloon_niet_verdienen                            | true |
      | datum_aanvraag_lks                                        | 2026-01-31 |
      | datum_einde_deelname_onderwijs_lid_2_a                    | 2025-10-01 |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false |
      | is_wsw_dienstbetrekking                                   | false |
      | loonwaarde_percentage                                     | 60 |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36 |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | false |
      | dienstbetrekking_is_tot_stand_gekomen                     | false |
      | college_heeft_loonwaarde_vastgesteld                      | false |
      | vaststelling_loonwaarde_blijft_achterwege                 | false |
      | datum_aanvang_dienstbetrekking                            | 2026-02-01 |
    When I evaluate outputs "aanvraag_lks_binnen_zes_maanden" of "participatiewet"
    Then the execution succeeds
    And output "aanvraag_lks_binnen_zes_maanden" is false

  Scenario: Onderwijs precies zes maanden vóór de aanvang beëindigd opent lid 2 onderdeel a
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                       | 999990602 |
      | behoort_tot_doelgroep_lks                                 | true |
      | kan_minimumloon_niet_verdienen                            | true |
      | datum_aanvraag_lks                                        | 2026-02-01 |
      | datum_einde_deelname_onderwijs_lid_2_a                    | 2025-07-01 |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false |
      | is_wsw_dienstbetrekking                                   | false |
      | loonwaarde_percentage                                     | 60 |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36 |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | false |
      | dienstbetrekking_is_tot_stand_gekomen                     | false |
      | college_heeft_loonwaarde_vastgesteld                      | false |
      | vaststelling_loonwaarde_blijft_achterwege                 | false |
      | datum_aanvang_dienstbetrekking                            | 2026-01-01 |
    When I evaluate outputs "voorafgaand_relevante_onderwijsroute_of_doelgroep, heeft_recht_op_lks_lid_2" of "participatiewet"
    Then the execution succeeds
    And output "voorafgaand_relevante_onderwijsroute_of_doelgroep" is true
    And output "heeft_recht_op_lks_lid_2" is true

  Scenario: Onderwijs één dag eerder dan zes maanden vóór de aanvang beëindigd opent lid 2 onderdeel a niet
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                       | 999990602 |
      | behoort_tot_doelgroep_lks                                 | true |
      | kan_minimumloon_niet_verdienen                            | true |
      | datum_aanvraag_lks                                        | 2026-02-01 |
      | datum_einde_deelname_onderwijs_lid_2_a                    | 2025-06-30 |
      | was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand    | false |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false |
      | is_wsw_dienstbetrekking                                   | false |
      | loonwaarde_percentage                                     | 60 |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36 |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | false |
      | dienstbetrekking_is_tot_stand_gekomen                     | false |
      | college_heeft_loonwaarde_vastgesteld                      | false |
      | vaststelling_loonwaarde_blijft_achterwege                 | false |
      | datum_aanvang_dienstbetrekking                            | 2026-01-01 |
    When I evaluate outputs "voorafgaand_relevante_onderwijsroute_of_doelgroep, heeft_recht_op_lks_lid_2" of "participatiewet"
    Then the execution succeeds
    And output "voorafgaand_relevante_onderwijsroute_of_doelgroep" is false
    And output "heeft_recht_op_lks_lid_2" is false

  Scenario: Een nieuwe aanvraag doelgroepvaststelling precies twaalf maanden na de vorige is toegestaan (10c lid 2)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990603 |
      | is_persoon_artikel_7_lid_1_a_of_7a                                 | true |
      | is_persoon_kring_ambtshalve_vaststelling                           | true |
      | datum_vorige_aanvraag_doelgroepvaststelling                        | 2025-07-01 |
      | is_vastgesteld_kan_met_voltijdse_arbeid_minimumloon_niet_verdienen | true |
      | heeft_mogelijkheden_tot_arbeidsparticipatie                        | true |
      | is_persoon_artikel_10d_lid_2                                       | false |
    When I evaluate outputs "aanvraag_is_toegestaan_lid_2" of "participatiewet"
    Then the execution succeeds
    And output "aanvraag_is_toegestaan_lid_2" is true

  Scenario: Een nieuwe aanvraag doelgroepvaststelling één dag binnen twaalf maanden is niet toegestaan (10c lid 2)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990603 |
      | is_persoon_artikel_7_lid_1_a_of_7a                                 | true |
      | is_persoon_kring_ambtshalve_vaststelling                           | true |
      | datum_vorige_aanvraag_doelgroepvaststelling                        | 2025-07-02 |
      | is_vastgesteld_kan_met_voltijdse_arbeid_minimumloon_niet_verdienen | true |
      | heeft_mogelijkheden_tot_arbeidsparticipatie                        | true |
      | is_persoon_artikel_10d_lid_2                                       | false |
    When I evaluate outputs "aanvraag_is_toegestaan_lid_2" of "participatiewet"
    Then the execution succeeds
    And output "aanvraag_is_toegestaan_lid_2" is false

  Scenario: Wie tot de doelgroep van artikel 10 behoort maar voor wie het college de voorziening niet noodzakelijk acht, heeft geen aanspraak
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990604 |
      | ontvangt_algemene_bijstand                     | true |
      | is_wia_uitstromer_artikel_34a_35_36            | false |
      | heeft_nabestaandenuitkering_anw                | false |
      | is_niet_uitkeringsgerechtigde                  | false |
      | valt_onder_lid_2_wegens_voorziening            | false |
      | college_acht_voorziening_noodzakelijk          | false |
      | kan_taken_niet_verrichten_zonder_ondersteuning | true |
      | aanvraag_ingediend                             | true |
      | behoort_tot_doelgroep_lks                      | false |
    When I evaluate outputs "behoort_tot_doelgroep_artikel_10, heeft_aanspraak_op_voorziening_arbeidsinschakeling" of "participatiewet"
    Then the execution succeeds
    And output "behoort_tot_doelgroep_artikel_10" is true
    And output "heeft_aanspraak_op_voorziening_arbeidsinschakeling" is false
