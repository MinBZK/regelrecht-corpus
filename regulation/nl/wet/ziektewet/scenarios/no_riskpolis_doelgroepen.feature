Feature: Ziektewet, doelgroepen van de no-riskpolis (artikel 29b)
  Als werkgever
  Wil ik per doelgroep van artikel 29b zien wanneer de no-riskpolis opent
  Zodat elke grond apart toetsbaar is en de afleiding bij de juiste wet ligt

  # Koen en Sadee (financieel_cv_*.feature) openen lid 2. Deze scenario's
  # toetsen de overige gronden, elk met de leaf-feiten van precies die
  # grond op waar en al het andere op onwaar. Het vaste blok onderaan
  # elke tabel (38b, LKS, 10b, WIA-43) staat uit tenzij anders vermeld.
  #
  # Persona's:
  #   - Fatma, 51 (geboren 1975-02-10), ziek geworden op 1 maart 2024,
  #     WGA-gerechtigd sinds 27 februari 2026, per 1 mei 2026 in dienst bij
  #     een nieuwe werkgever (lid 1 onderdeel a), dan wel voortgezet bij de
  #     eigen werkgever (lid 4).
  #   - Daan, 33 (geboren 1993-04-20), na de wachttijd voor 20%
  #     arbeidsongeschikt bevonden, per 1 september 2026 elders in dienst
  #     (lid 1 onderdeel b).
  #   - Lotte, 17 (geboren 2008-11-03), praktijkonderwijs afgerond op
  #     15 juli 2025, per 1 augustus 2025 in dienst (lid 1 onderdeel c).
  #   - Bram, 22 (geboren 2004-01-12), onderwijs afgerond op 1 juli 2023,
  #     per 1 februari 2026 in dienst, geen Wajong (lid 1 onderdeel d).
  #   - Noor, 30 (geboren 1996-03-08), beschut werk (lid 2 onderdeel f).

  # Datums die alleen gelden als een bijbehorend feit waar is (eerste
  # ziektedag, datum Wajong-aanvraag) staan op 1900-01-01 wanneer dat feit
  # onwaar is: de engine geeft een ontbrekende optionele parameter nog niet
  # als "geen waarde" door aan een andere wet, en de afleiding gebruikt de
  # datum dan niet.

  Scenario: Fatma met een WGA-uitkering opent lid 1 onderdeel a voor vijf jaar
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                         | 999990201  |
      | geboortedatum                                               | 1975-02-10 |
      | datum_aanvang_dienstbetrekking                              | 2026-05-01 |
      | is_verzekerde_wia                                           | true       |
      | is_ziek_geworden_wia                                        | true       |
      | eerste_dag_wachttijd_wia                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                 | 50         |
      | is_medisch_duurzaam_wia                                     | false      |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                   | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap     | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog            | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog               | false      |
      | is_rechtens_vrijheid_ontnomen                               | false      |
      | onttrekt_zich_aan_vrijheidsstraf                            | false      |
      | woont_niet_in_nederland                                     | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt                  | false      |
      | is_overleden                                                | false      |
      | is_uitreiziger                                              | false      |
      | arbeidskundig_onderzoek_verricht                            | true       |
      | geen_dienstbetrekking_elders_elf_weken_voor_einde_wachttijd | true       |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever | true    |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek       | false      |
      | aanvraag_arbeidsondersteuning_wajong_ingediend              | false      |
      | is_jonggehandicapte_hoofdstuk_2_wajong                      | false      |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen            | false      |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing             | false      |
      | datum_aanvraag_arbeidsondersteuning_wajong                  | 1900-01-01 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong            | false      |
      | recht_op_arbeidsondersteuning_herleeft_2_17                 | false      |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering         | false      |
      | dienstbetrekking_aangevangen_voor_achttien_en_voor_wajong_recht | false  |
      | is_wsw_werknemer                                            | false      |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand           | false      |
      | is_uitgesloten_beschut_werk_pwet_10b                        | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling       | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                        | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering              | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                    | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                          | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek    | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01        | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden        | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                        | false      |
      | datum_eerste_opname_doelgroepregister                       | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                              | false      |
      | registratie_nog_niet_geeindigd                              | false      |
      | behoort_tot_doelgroep_lks                                   | false      |
      | kan_minimumloon_niet_verdienen                              | false      |
      | aanvraag_lks_ingediend_binnen_zes_maanden                   | false      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep           | false      |
      | is_wsw_dienstbetrekking                                     | false      |
      | loonwaarde_eurocent_per_maand                               | 215500     |
      | overeengekomen_arbeidsduur_uren_per_week                    | 36         |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand         | 215500     |
      | behoort_tot_doelgroep_10b_lid_1                             | false      |
      | heeft_dienstbetrekking_beschut_werk                         | false      |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht       | false      |
    When I evaluate "heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "heeft_recht_op_wia_uitkering" is true
    And output "voldoet_aan_lid_1_a" is true
    And output "voldoet_aan_lid_1_b" is false
    And output "voldoet_aan_lid_1" is true
    And output "voldoet_aan_lid_2" is false
    And output "voldoet_aan_lid_4" is false
    And output "heeft_recht_op_no_risk_polis" is true
    And output "duur_no_risk_polis_jaren" equals 5

  Scenario: Fatma blijft bij haar eigen werkgever na de WGA-vaststelling en opent lid 4
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                         | 999990201  |
      | geboortedatum                                               | 1975-02-10 |
      | datum_aanvang_dienstbetrekking                              | 2015-09-01 |
      | is_verzekerde_wia                                           | true       |
      | is_ziek_geworden_wia                                        | true       |
      | eerste_dag_wachttijd_wia                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                 | 50         |
      | is_medisch_duurzaam_wia                                     | false      |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                   | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap     | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog            | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog               | false      |
      | is_rechtens_vrijheid_ontnomen                               | false      |
      | onttrekt_zich_aan_vrijheidsstraf                            | false      |
      | woont_niet_in_nederland                                     | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt                  | false      |
      | is_overleden                                                | false      |
      | is_uitreiziger                                              | false      |
      | arbeidskundig_onderzoek_verricht                            | true       |
      | geen_dienstbetrekking_elders_elf_weken_voor_einde_wachttijd | false      |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever | false   |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek       | false      |
      | aanvraag_arbeidsondersteuning_wajong_ingediend              | false      |
      | is_jonggehandicapte_hoofdstuk_2_wajong                      | false      |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen            | false      |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing             | false      |
      | datum_aanvraag_arbeidsondersteuning_wajong                  | 1900-01-01 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong            | false      |
      | recht_op_arbeidsondersteuning_herleeft_2_17                 | false      |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering         | false      |
      | dienstbetrekking_aangevangen_voor_achttien_en_voor_wajong_recht | false  |
      | is_wsw_werknemer                                            | false      |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand           | false      |
      | is_uitgesloten_beschut_werk_pwet_10b                        | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling       | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                        | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering              | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                    | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                          | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek    | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01        | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden        | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                        | false      |
      | datum_eerste_opname_doelgroepregister                       | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                              | false      |
      | registratie_nog_niet_geeindigd                              | false      |
      | behoort_tot_doelgroep_lks                                   | false      |
      | kan_minimumloon_niet_verdienen                              | false      |
      | aanvraag_lks_ingediend_binnen_zes_maanden                   | false      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep           | false      |
      | is_wsw_dienstbetrekking                                     | false      |
      | loonwaarde_eurocent_per_maand                               | 215500     |
      | overeengekomen_arbeidsduur_uren_per_week                    | 36         |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand         | 215500     |
      | behoort_tot_doelgroep_10b_lid_1                             | false      |
      | heeft_dienstbetrekking_beschut_werk                         | false      |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht       | true       |
    When I evaluate "heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "voldoet_aan_lid_4" is true
    And output "heeft_recht_op_no_risk_polis" is true

  Scenario: Daan is na de wachttijd minder dan 35% arbeidsongeschikt en opent lid 1 onderdeel b
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                         | 999990202  |
      | geboortedatum                                               | 1993-04-20 |
      | datum_aanvang_dienstbetrekking                              | 2026-09-01 |
      | is_verzekerde_wia                                           | true       |
      | is_ziek_geworden_wia                                        | true       |
      | eerste_dag_wachttijd_wia                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                 | 80         |
      | is_medisch_duurzaam_wia                                     | false      |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                   | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap     | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog            | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog               | false      |
      | is_rechtens_vrijheid_ontnomen                               | false      |
      | onttrekt_zich_aan_vrijheidsstraf                            | false      |
      | woont_niet_in_nederland                                     | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt                  | false      |
      | is_overleden                                                | false      |
      | is_uitreiziger                                              | false      |
      | arbeidskundig_onderzoek_verricht                            | true       |
      | geen_dienstbetrekking_elders_elf_weken_voor_einde_wachttijd | true       |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever | true    |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek       | false      |
      | aanvraag_arbeidsondersteuning_wajong_ingediend              | false      |
      | is_jonggehandicapte_hoofdstuk_2_wajong                      | false      |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen            | false      |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing             | false      |
      | datum_aanvraag_arbeidsondersteuning_wajong                  | 1900-01-01 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong            | false      |
      | recht_op_arbeidsondersteuning_herleeft_2_17                 | false      |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering         | false      |
      | dienstbetrekking_aangevangen_voor_achttien_en_voor_wajong_recht | false  |
      | is_wsw_werknemer                                            | false      |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand           | false      |
      | is_uitgesloten_beschut_werk_pwet_10b                        | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling       | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                        | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering              | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                    | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                          | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek    | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01        | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden        | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                        | false      |
      | datum_eerste_opname_doelgroepregister                       | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                              | false      |
      | registratie_nog_niet_geeindigd                              | false      |
      | behoort_tot_doelgroep_lks                                   | false      |
      | kan_minimumloon_niet_verdienen                              | false      |
      | aanvraag_lks_ingediend_binnen_zes_maanden                   | false      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep           | false      |
      | is_wsw_dienstbetrekking                                     | false      |
      | loonwaarde_eurocent_per_maand                               | 215500     |
      | overeengekomen_arbeidsduur_uren_per_week                    | 36         |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand         | 215500     |
      | behoort_tot_doelgroep_10b_lid_1                             | false      |
      | heeft_dienstbetrekking_beschut_werk                         | false      |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht       | false      |
    When I evaluate "heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "heeft_recht_op_wia_uitkering" is false
    And output "voldoet_aan_lid_1_b" is true
    And output "voldoet_aan_lid_1" is true
    And output "heeft_recht_op_no_risk_polis" is true
    And output "duur_no_risk_polis_jaren" equals 5

  Scenario: Lotte, zeventien en belemmerd bij haar onderwijs, opent lid 1 onderdeel c
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                         | 999990203  |
      | geboortedatum                                               | 2008-11-03 |
      | datum_aanvang_dienstbetrekking                              | 2025-08-01 |
      | is_verzekerde_wia                                           | true       |
      | is_ziek_geworden_wia                                        | false      |
      | eerste_dag_wachttijd_wia                                    | 1900-01-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                 | 100        |
      | is_medisch_duurzaam_wia                                     | false      |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                   | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap     | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog            | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog               | false      |
      | is_rechtens_vrijheid_ontnomen                               | false      |
      | onttrekt_zich_aan_vrijheidsstraf                            | false      |
      | woont_niet_in_nederland                                     | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt                  | false      |
      | is_overleden                                                | false      |
      | is_uitreiziger                                              | false      |
      | arbeidskundig_onderzoek_verricht                            | false      |
      | geen_dienstbetrekking_elders_elf_weken_voor_einde_wachttijd | false      |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever | false   |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek       | true       |
      | datum_afronding_onderwijs                                   | 2025-07-15 |
      | aanvraag_arbeidsondersteuning_wajong_ingediend              | false      |
      | is_jonggehandicapte_hoofdstuk_2_wajong                      | false      |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen            | false      |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing             | false      |
      | datum_aanvraag_arbeidsondersteuning_wajong                  | 1900-01-01 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong            | false      |
      | recht_op_arbeidsondersteuning_herleeft_2_17                 | false      |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering         | false      |
      | dienstbetrekking_aangevangen_voor_achttien_en_voor_wajong_recht | false  |
      | is_wsw_werknemer                                            | false      |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand           | false      |
      | is_uitgesloten_beschut_werk_pwet_10b                        | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling       | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                        | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering              | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                    | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                          | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek    | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01        | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden        | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                        | false      |
      | datum_eerste_opname_doelgroepregister                       | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                              | false      |
      | registratie_nog_niet_geeindigd                              | false      |
      | behoort_tot_doelgroep_lks                                   | false      |
      | kan_minimumloon_niet_verdienen                              | false      |
      | aanvraag_lks_ingediend_binnen_zes_maanden                   | false      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep           | false      |
      | is_wsw_dienstbetrekking                                     | false      |
      | loonwaarde_eurocent_per_maand                               | 215500     |
      | overeengekomen_arbeidsduur_uren_per_week                    | 36         |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand         | 215500     |
      | behoort_tot_doelgroep_10b_lid_1                             | false      |
      | heeft_dienstbetrekking_beschut_werk                         | false      |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht       | false      |
    When I evaluate "heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "voldoet_aan_lid_1_c" is true
    And output "voldoet_aan_lid_1_d" is false
    And output "voldoet_aan_lid_1" is true
    And output "heeft_recht_op_no_risk_polis" is true
    And output "duur_no_risk_polis_jaren" equals 5

  Scenario: Bram, tweeëntwintig zonder Wajong en binnen vijf jaar na zijn onderwijs aan het werk, opent lid 1 onderdeel d
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                         | 999990204  |
      | geboortedatum                                               | 2004-01-12 |
      | datum_aanvang_dienstbetrekking                              | 2026-02-01 |
      | is_verzekerde_wia                                           | true       |
      | is_ziek_geworden_wia                                        | false      |
      | eerste_dag_wachttijd_wia                                    | 1900-01-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                 | 100        |
      | is_medisch_duurzaam_wia                                     | false      |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                   | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap     | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog            | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog               | false      |
      | is_rechtens_vrijheid_ontnomen                               | false      |
      | onttrekt_zich_aan_vrijheidsstraf                            | false      |
      | woont_niet_in_nederland                                     | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt                  | false      |
      | is_overleden                                                | false      |
      | is_uitreiziger                                              | false      |
      | arbeidskundig_onderzoek_verricht                            | false      |
      | geen_dienstbetrekking_elders_elf_weken_voor_einde_wachttijd | false      |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever | false   |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek       | true       |
      | datum_afronding_onderwijs                                   | 2023-07-01 |
      | aanvraag_arbeidsondersteuning_wajong_ingediend              | false      |
      | is_jonggehandicapte_hoofdstuk_2_wajong                      | false      |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen            | false      |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing             | false      |
      | datum_aanvraag_arbeidsondersteuning_wajong                  | 1900-01-01 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong            | false      |
      | recht_op_arbeidsondersteuning_herleeft_2_17                 | false      |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering         | false      |
      | dienstbetrekking_aangevangen_voor_achttien_en_voor_wajong_recht | false  |
      | is_wsw_werknemer                                            | false      |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand           | false      |
      | is_uitgesloten_beschut_werk_pwet_10b                        | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling       | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                        | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering              | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                    | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                          | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek    | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01        | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden        | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                        | false      |
      | datum_eerste_opname_doelgroepregister                       | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                              | false      |
      | registratie_nog_niet_geeindigd                              | false      |
      | behoort_tot_doelgroep_lks                                   | false      |
      | kan_minimumloon_niet_verdienen                              | false      |
      | aanvraag_lks_ingediend_binnen_zes_maanden                   | false      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep           | false      |
      | is_wsw_dienstbetrekking                                     | false      |
      | loonwaarde_eurocent_per_maand                               | 215500     |
      | overeengekomen_arbeidsduur_uren_per_week                    | 36         |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand         | 215500     |
      | behoort_tot_doelgroep_10b_lid_1                             | false      |
      | heeft_dienstbetrekking_beschut_werk                         | false      |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht       | false      |
    When I evaluate "heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "voldoet_aan_lid_1_c" is false
    And output "voldoet_aan_lid_1_d" is true
    And output "voldoet_aan_lid_1" is true
    And output "heeft_recht_op_no_risk_polis" is true
    And output "duur_no_risk_polis_jaren" equals 5

  Scenario: Noor in beschut werk opent lid 2 onderdeel f, en lid 3 zet lid 1 onderdeel d voor haar uit
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                         | 999990205  |
      | geboortedatum                                               | 1996-03-08 |
      | datum_aanvang_dienstbetrekking                              | 2026-02-01 |
      | is_verzekerde_wia                                           | true       |
      | is_ziek_geworden_wia                                        | false      |
      | eerste_dag_wachttijd_wia                                    | 1900-01-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                 | 100        |
      | is_medisch_duurzaam_wia                                     | false      |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                   | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap     | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog            | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog               | false      |
      | is_rechtens_vrijheid_ontnomen                               | false      |
      | onttrekt_zich_aan_vrijheidsstraf                            | false      |
      | woont_niet_in_nederland                                     | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt                  | false      |
      | is_overleden                                                | false      |
      | is_uitreiziger                                              | false      |
      | arbeidskundig_onderzoek_verricht                            | false      |
      | geen_dienstbetrekking_elders_elf_weken_voor_einde_wachttijd | false      |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever | false   |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek       | true       |
      | datum_afronding_onderwijs                                   | 2024-07-01 |
      | aanvraag_arbeidsondersteuning_wajong_ingediend              | false      |
      | is_jonggehandicapte_hoofdstuk_2_wajong                      | false      |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen            | false      |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing             | false      |
      | datum_aanvraag_arbeidsondersteuning_wajong                  | 1900-01-01 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong            | false      |
      | recht_op_arbeidsondersteuning_herleeft_2_17                 | false      |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering         | false      |
      | dienstbetrekking_aangevangen_voor_achttien_en_voor_wajong_recht | false  |
      | is_wsw_werknemer                                            | false      |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand           | false      |
      | is_uitgesloten_beschut_werk_pwet_10b                        | true       |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling       | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                        | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering              | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                    | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                          | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek    | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01        | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden        | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                        | false      |
      | datum_eerste_opname_doelgroepregister                       | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                              | false      |
      | registratie_nog_niet_geeindigd                              | false      |
      | behoort_tot_doelgroep_lks                                   | false      |
      | kan_minimumloon_niet_verdienen                              | false      |
      | aanvraag_lks_ingediend_binnen_zes_maanden                   | false      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep           | false      |
      | is_wsw_dienstbetrekking                                     | false      |
      | loonwaarde_eurocent_per_maand                               | 215500     |
      | overeengekomen_arbeidsduur_uren_per_week                    | 36         |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand         | 215500     |
      | behoort_tot_doelgroep_10b_lid_1                             | true       |
      | heeft_dienstbetrekking_beschut_werk                         | true       |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht       | false      |
    When I evaluate "heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "voldoet_aan_lid_2_e" is false
    And output "voldoet_aan_lid_2_f" is true
    And output "voldoet_aan_lid_1_d" is true
    And output "voldoet_aan_lid_1" is false
    And output "voldoet_aan_lid_2" is true
    And output "heeft_recht_op_no_risk_polis" is true
    And output "duur_no_risk_polis_jaren" equals -1
