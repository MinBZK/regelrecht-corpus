Feature: Wfsv 38b lid 1 onderdeel f, de grenzen van het tijdvak 1 januari 2013 tot 1 mei 2015
  Grensscenario's, toegevoegd op 12 oktober 2026 na een mutatietest van de
  modellen: voor elke vergelijking die geen scenario op de grens zelf had,
  staat hier het geval precies op de grens en het geval er net naast.
  Peildatum 1 juli 2026; parameterblok uit doelgroepregister_banenafspraak.

  Scenario: De eerste dag van het tijdvak van onderdeel f (1 januari 2013) telt mee
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990608 |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | loonwaarde_percentage                                              | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | 2013-01-01 |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2024-05-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | true |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
    When I evaluate outputs "voldoet_aan_grond_38b_1_f, is_arbeidsbeperkte" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_1_f" is true
    And output "is_arbeidsbeperkte" is true

  Scenario: De dag vóór 1 januari 2013 valt buiten onderdeel f
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990608 |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | loonwaarde_percentage                                              | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | 2012-12-31 |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2024-05-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | true |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
    When I evaluate outputs "voldoet_aan_grond_38b_1_f, is_arbeidsbeperkte" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_1_f" is false
    And output "is_arbeidsbeperkte" is false

  Scenario: De laatste dag vóór 1 mei 2015 telt nog mee voor onderdeel f
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990608 |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | loonwaarde_percentage                                              | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | 2015-04-30 |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2024-05-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | true |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
    When I evaluate outputs "voldoet_aan_grond_38b_1_f, is_arbeidsbeperkte" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_1_f" is true
    And output "is_arbeidsbeperkte" is true

  Scenario: Op 1 mei 2015 zelf is onderdeel f niet meer van toepassing
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990608 |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | loonwaarde_percentage                                              | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | 2015-05-01 |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2024-05-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | true |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
    When I evaluate outputs "voldoet_aan_grond_38b_1_f, is_arbeidsbeperkte" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_1_f" is false
    And output "is_arbeidsbeperkte" is false
