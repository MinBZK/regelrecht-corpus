Feature: Ziektewet 29b, grenzen van percentages, leeftijden en termijnen
  Grensscenario's, toegevoegd op 12 oktober 2026 na een mutatietest van de
  modellen: voor elke vergelijking die geen scenario op de grens zelf had,
  staat hier het geval precies op de grens en het geval er net naast.
  Parameterblokken van Daan, Lotte, Fatma en Koen; alleen het grensfeit is omgezet.

  # Afgeleid op 2026-10-25 (review B1): datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b
  # vervangt de boolean was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand
  # (Pwet 10d lid 2 onderdeel b). Waar die onwaar was, staat de datum op null:
  # de persoon was nooit zo'n persoon. Onderdeel b blijft dan onwaar en de
  # uitkomst gelijk.
  # In de twee scenario's over 1 januari 2015 (lid 2 onderdeel e) stond hij op
  # waar; daar staat nu de dag vóór de aanvang (2014-12-31, resp. 2014-12-30),
  # binnen de zes maanden.

  # Afgeleid op 2026-10-25 (review B2): geen_dienstbetrekking_elders_elf_weken_voor_einde_wachttijd
  # is vervangen door datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2 en
  # datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2. Het model leidt de
  # peildag van 29b lid 1 onderdeel b onder 2° (elf weken vóór peildatum_lid_1_b)
  # zelf af. Beide datums staan hier op null: geen van deze persona's had een
  # dienstbetrekking bij een andere werkgever. Waar de oude boolean onwaar was,
  # was dat een uit-waarde; onderdeel b opent daar nog steeds niet, omdat er
  # geen wachttijd is of de werknemer 35% of meer arbeidsongeschikt is.

  # Rechtgezet op 2026-10-25 (review C12): datum_voldaan_aan_lid_1 en
  # datum_aanvraag_arbeidsondersteuning_wajong staan op null in plaats van
  # 1900-01-01. Ze zijn nullable in de Wajong, en sinds deze datum ook in de
  # Ziektewet. eerste_dag_wachttijd_wia houdt 1900-01-01, omdat de WIA-parameter
  # waar hij heen gaat niet nullable is.

  # Lid 1 onderdeel b: "minder dan 35% arbeidsongeschikt".
  Scenario: Precies 35 procent arbeidsongeschikt is niet minder dan 35 procent: lid 1 onderdeel b opent niet
    # Aanvang was 2026-09-01, na de peildatum. Art. 29b lid 1 slotzin dekt alleen
    # ziekte "aangevangen in de vijf jaren na aanvang van de dienstbetrekking";
    # aanvang daarom 2026-06-01 (na einde wachttijd, vóór de peildatum).
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990613 |
      | geboortedatum                                                      | 1993-04-20 |
      | datum_aanvang_dienstbetrekking                                     | 2026-06-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | true |
      | eerste_dag_wachttijd_wia                                           | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 80 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | true |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | null |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | true |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | false |
      | behoort_tot_doelgroep_lks                                          | false |
      | kan_minimumloon_niet_verdienen                                     | false |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | null |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 100 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 36 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
      | arbeidsongeschiktheidspercentage                                   | 35 |
    When I evaluate outputs "voldoet_aan_lid_1_b, heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "voldoet_aan_lid_1_b" is false
    And output "heeft_recht_op_no_risk_polis" is false

  Scenario: 34 procent arbeidsongeschikt is minder dan 35 procent: lid 1 onderdeel b opent
    # Aanvang was 2026-09-01, na de peildatum. Art. 29b lid 1 slotzin dekt alleen
    # ziekte "aangevangen in de vijf jaren na aanvang van de dienstbetrekking";
    # aanvang daarom 2026-06-01 (na einde wachttijd, vóór de peildatum).
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990613 |
      | geboortedatum                                                      | 1993-04-20 |
      | datum_aanvang_dienstbetrekking                                     | 2026-06-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | true |
      | eerste_dag_wachttijd_wia                                           | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 80 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | true |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | null |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | true |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | false |
      | behoort_tot_doelgroep_lks                                          | false |
      | kan_minimumloon_niet_verdienen                                     | false |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | null |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 100 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 36 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
      | arbeidsongeschiktheidspercentage                                   | 34 |
    When I evaluate outputs "voldoet_aan_lid_1_b, heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "voldoet_aan_lid_1_b" is true
    And output "heeft_recht_op_no_risk_polis" is true

  # Lid 1 onderdeel b onder 2° (toegevoegd 2026-10-25, review B2): "op de eerste
  # dag van elf weken voorafgaand aan die dag geen dienstbetrekking [...] met een
  # andere werkgever [...], tenzij de dienstbetrekking met die andere werkgever
  # reeds bestond op de eerste dag van de wachttijd". Daans feiten uit het
  # scenario hierboven, met een bijbaan bij een andere werkgever. De wachttijd
  # begon op 2024-03-01 en liep 104 weken; de peildag ligt elf weken vóór het
  # einde ervan, eind 2025.
  Scenario: Een bijbaan elders die na de eerste dag van de wachttijd begon en op de peildag liep: lid 1 onderdeel b opent niet
    # Bijbaan sinds 2025-06-01, niet geëindigd: op de peildag (eind 2025) liep
    # een dienstbetrekking met een andere werkgever die er op 2024-03-01 nog
    # niet was.
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990613 |
      | geboortedatum                                                      | 1993-04-20 |
      | datum_aanvang_dienstbetrekking                                     | 2026-06-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | true |
      | eerste_dag_wachttijd_wia                                           | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 80 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | true |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | 2025-06-01 |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | true |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | false |
      | behoort_tot_doelgroep_lks                                          | false |
      | kan_minimumloon_niet_verdienen                                     | false |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | null |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 100 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 36 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
      | arbeidsongeschiktheidspercentage                                   | 34 |
    When I evaluate outputs "voldoet_aan_lid_1_b, geen_dienstbetrekking_elders_lid_1_b_2" of "ziektewet"
    Then the execution succeeds
    And output "geen_dienstbetrekking_elders_lid_1_b_2" is false
    And output "voldoet_aan_lid_1_b" is false

  Scenario: Een bijbaan elders die al op de eerste dag van de wachttijd bestond: lid 1 onderdeel b opent
    # Bijbaan sinds 2023-09-01, niet geëindigd: hij bestond al op de eerste dag
    # van de wachttijd (2024-03-01), dus de uitzondering van 2° geldt.
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990613 |
      | geboortedatum                                                      | 1993-04-20 |
      | datum_aanvang_dienstbetrekking                                     | 2026-06-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | true |
      | eerste_dag_wachttijd_wia                                           | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 80 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | true |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | 2023-09-01 |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | true |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | false |
      | behoort_tot_doelgroep_lks                                          | false |
      | kan_minimumloon_niet_verdienen                                     | false |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | null |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 100 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 36 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
      | arbeidsongeschiktheidspercentage                                   | 34 |
    When I evaluate outputs "voldoet_aan_lid_1_b, geen_dienstbetrekking_elders_lid_1_b_2" of "ziektewet"
    Then the execution succeeds
    And output "geen_dienstbetrekking_elders_lid_1_b_2" is true
    And output "voldoet_aan_lid_1_b" is true

  # Grenzen van onderdeel b onder 2° (toegevoegd 2026-10-25, restpunt B2). De
  # peildatum is de eerste dag na afloop van de wachttijd: 2024-03-01 + 104 weken
  # = 2026-02-27 (WIA art. 23, wachttijd_einddatum). De peildag van 2° ligt elf
  # weken daarvóór: 2025-12-12.
  Scenario: Een bijbaan elders die precies op de eerste dag van de wachttijd begon: de tenzij-clausule geldt
    # "reeds bestond op de eerste dag van de wachttijd": aanvang 2024-03-01 is
    # gelijk aan de eerste dag van de wachttijd en telt dus mee (kleiner dan of
    # gelijk aan). Een dag later (2024-03-02) zou de bijbaan de toets laten falen.
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990613 |
      | geboortedatum                                                      | 1993-04-20 |
      | datum_aanvang_dienstbetrekking                                     | 2026-06-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | true |
      | eerste_dag_wachttijd_wia                                           | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 80 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | true |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | 2024-03-01 |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | true |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | false |
      | behoort_tot_doelgroep_lks                                          | false |
      | kan_minimumloon_niet_verdienen                                     | false |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | null |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 100 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 36 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
      | arbeidsongeschiktheidspercentage                                   | 34 |
    When I evaluate outputs "peildatum_lid_1_b, peildag_elf_weken_lid_1_b_2, geen_dienstbetrekking_elders_lid_1_b_2, voldoet_aan_lid_1_b" of "ziektewet"
    Then the execution succeeds
    And output "peildatum_lid_1_b" equals "2026-02-27"
    And output "peildag_elf_weken_lid_1_b_2" equals "2025-12-12"
    And output "geen_dienstbetrekking_elders_lid_1_b_2" is true
    And output "voldoet_aan_lid_1_b" is true

  Scenario: Een bijbaan elders die eindigde op de peildag: op die dag bestond hij nog, lid 1 onderdeel b opent niet
    # Bijbaan van 2025-06-01 tot en met 2025-12-12, de peildag zelf. Op "de
    # eerste dag van elf weken voorafgaand" liep de dienstbetrekking dus nog;
    # het model eist een einde vóór de peildag (LESS_THAN). Was hij op
    # 2025-12-11 geëindigd, dan was de voorwaarde vervuld.
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990613 |
      | geboortedatum                                                      | 1993-04-20 |
      | datum_aanvang_dienstbetrekking                                     | 2026-06-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | true |
      | eerste_dag_wachttijd_wia                                           | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 80 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | true |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | 2025-06-01 |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | 2025-12-12 |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | true |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | false |
      | behoort_tot_doelgroep_lks                                          | false |
      | kan_minimumloon_niet_verdienen                                     | false |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | null |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 100 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 36 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
      | arbeidsongeschiktheidspercentage                                   | 34 |
    When I evaluate outputs "peildag_elf_weken_lid_1_b_2, geen_dienstbetrekking_elders_lid_1_b_2, voldoet_aan_lid_1_b" of "ziektewet"
    Then the execution succeeds
    And output "peildag_elf_weken_lid_1_b_2" equals "2025-12-12"
    And output "geen_dienstbetrekking_elders_lid_1_b_2" is false
    And output "voldoet_aan_lid_1_b" is false

  # Lotte's feiten met een geboortedatum op precies achttien jaar vóór de peildatum.
  Scenario: Op de peildatum precies achttien: niet onderdeel c (jonger dan achttien) maar onderdeel d
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990614 |
      | geboortedatum                                                      | 2008-07-01 |
      | datum_aanvang_dienstbetrekking                                     | 2025-08-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | false |
      | eerste_dag_wachttijd_wia                                           | 1900-01-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 100 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | false |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | null |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | false |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | true |
      | datum_afronding_onderwijs                                          | 2025-07-15 |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | false |
      | behoort_tot_doelgroep_lks                                          | false |
      | kan_minimumloon_niet_verdienen                                     | false |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | null |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 100 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 36 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
    When I evaluate outputs "voldoet_aan_lid_1_c, voldoet_aan_lid_1_d, heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "voldoet_aan_lid_1_c" is false
    And output "voldoet_aan_lid_1_d" is true
    And output "heeft_recht_op_no_risk_polis" is true

  Scenario: Op de peildatum één dag jonger dan achttien: onderdeel c, niet onderdeel d
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990614 |
      | geboortedatum                                                      | 2008-07-02 |
      | datum_aanvang_dienstbetrekking                                     | 2025-08-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | false |
      | eerste_dag_wachttijd_wia                                           | 1900-01-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 100 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | false |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | null |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | false |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | true |
      | datum_afronding_onderwijs                                          | 2025-07-15 |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | false |
      | behoort_tot_doelgroep_lks                                          | false |
      | kan_minimumloon_niet_verdienen                                     | false |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | null |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 100 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 36 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
    When I evaluate outputs "voldoet_aan_lid_1_c, voldoet_aan_lid_1_d, heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "voldoet_aan_lid_1_c" is true
    And output "voldoet_aan_lid_1_d" is false
    And output "heeft_recht_op_no_risk_polis" is true

  # Lid 2 onderdeel e geldt voor dienstbetrekkingen aangevangen op of na 1 januari 2015 (Wet banenafspraak).
  Scenario: Dienstbetrekking aangevangen op 1 januari 2015 zelf valt onder lid 2 onderdeel e
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990615 |
      | geboortedatum                                                      | 1984-03-15 |
      | datum_aanvang_dienstbetrekking                                     | 2015-01-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | false |
      | eerste_dag_wachttijd_wia                                           | 1900-01-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 100 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | false |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | null |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | false |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | true |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | true |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | true |
      | behoort_tot_doelgroep_lks                                          | true |
      | kan_minimumloon_niet_verdienen                                     | true |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | 2014-12-31 |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 60 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 32 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
    When I evaluate outputs "voldoet_aan_lid_2_e, heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "voldoet_aan_lid_2_e" is true
    And output "heeft_recht_op_no_risk_polis" is true

  Scenario: Dienstbetrekking aangevangen op 31 december 2014 valt buiten lid 2 onderdeel e
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                                | 999990615 |
      | geboortedatum                                                      | 1984-03-15 |
      | datum_aanvang_dienstbetrekking                                     | 2014-12-31 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | false |
      | eerste_dag_wachttijd_wia                                           | 1900-01-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 100 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | false |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | null |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | false |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | true |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | true |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | true |
      | behoort_tot_doelgroep_lks                                          | true |
      | kan_minimumloon_niet_verdienen                                     | true |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | 2014-12-30 |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 60 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 32 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
    When I evaluate outputs "voldoet_aan_lid_2_e" of "ziektewet"
    Then the execution succeeds
    And output "voldoet_aan_lid_2_e" is false

  # Lid 1: "binnen vijf jaar na die dag"; aanvang 1 mei 2026, dus 1 mei 2031 valt erbuiten.
  Scenario: Ziek op de dag precies vijf jaar na de aanvang: lid 1 dekt dat niet meer
    Given the calculation date is "2031-05-01"
    And the following parameters:
      | bsn                                                                | 999990616 |
      | geboortedatum                                                      | 1975-02-10 |
      | datum_aanvang_dienstbetrekking                                     | 2026-05-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | true |
      | eerste_dag_wachttijd_wia                                           | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 50 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | true |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | null |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | true |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | false |
      | behoort_tot_doelgroep_lks                                          | false |
      | kan_minimumloon_niet_verdienen                                     | false |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | null |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 100 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 36 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
    When I evaluate outputs "ziekte_nu_binnen_termijn_lid_1, heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "ziekte_nu_binnen_termijn_lid_1" is false
    And output "heeft_recht_op_no_risk_polis" is false

  Scenario: Ziek op de laatste dag binnen vijf jaar na de aanvang: lid 1 dekt dat nog
    Given the calculation date is "2031-04-30"
    And the following parameters:
      | bsn                                                                | 999990616 |
      | geboortedatum                                                      | 1975-02-10 |
      | datum_aanvang_dienstbetrekking                                     | 2026-05-01 |
      | is_verzekerde_wia                                                  | true |
      | is_ziek_geworden_wia                                               | true |
      | eerste_dag_wachttijd_wia                                           | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen                        | 50 |
      | is_medisch_duurzaam_wia                                            | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7                          | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap            | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog                   | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog                      | false |
      | is_rechtens_vrijheid_ontnomen                                      | false |
      | onttrekt_zich_aan_vrijheidsstraf                                   | false |
      | woont_niet_in_nederland                                            | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt                         | false |
      | is_overleden                                                       | false |
      | is_uitreiziger                                                     | false |
      | arbeidskundig_onderzoek_verricht                                   | true |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2          | null |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2            | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever     | true |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek              | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend                     | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong                             | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen                 | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing                    | false |
      | datum_aanvraag_arbeidsondersteuning_wajong                         | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong                   | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17                        | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering                | false |
      | datum_ontstaan_recht_wajong                                        | null |
      | is_wsw_werknemer                                                   | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand                  | false |
      | is_uitgesloten_beschut_werk_pwet_10b                               | false |
      | is_pwet_toegeleid_of_lks_lid_2                                     | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d                   | false |
      | is_wsw_geindiceerd_of_oude_indicatie                               | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering                     | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden                           | false |
      | verricht_arbeid_in_dienstbetrekking                                | false |
      | is_pwet_toegeleid_naar_dienstbetrekking                            | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon   | false |
      | laatste_dag_persoon_lid_1_b_of_c                                   | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden               | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2                               | false |
      | datum_eerste_opname_doelgroepregister                              | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                                     | false |
      | registratie_nog_niet_geeindigd                                     | false |
      | behoort_tot_doelgroep_lks                                          | false |
      | kan_minimumloon_niet_verdienen                                     | false |
      | datum_aanvraag_lks                                                 | null |
      | datum_einde_deelname_onderwijs_lid_2_a                             | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b                       | null |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject          | false |
      | is_wsw_dienstbetrekking                                            | false |
      | loonwaarde_percentage                                              | 100 |
      | overeengekomen_arbeidsduur_uren_per_week                           | 36 |
      | behoort_tot_doelgroep_10b_lid_1                                    | false |
      | heeft_dienstbetrekking_beschut_werk                                | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht              | false |
      | heeft_wia_uitkering_hoofdstuk_6                                    | false |
      | experiment_instrument_82a_suwi_ingezet                             | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2                  | false |
      | loon_referteperiode_eurocent                                       | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent                | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent                 | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode             | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking                 | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan               | false |
      | dienstbetrekking_is_tot_stand_gekomen                              | false |
      | college_heeft_loonwaarde_vastgesteld                               | false |
      | vaststelling_loonwaarde_blijft_achterwege                          | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk               | null |
      | einddatum_tijdvak_lid_1_b                                          | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent                            | null |
      | datum_voldaan_aan_lid_1                                            | null |
      | komt_uit_voortgezet_speciaal_onderwijs                             | false |
      | komt_uit_praktijkonderwijs                                         | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv                             | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie              | false |
      | ontvangt_voorziening_wia_35_lid_2                                  | false |
      | ontvangt_voorziening_pwet_10                                       | false |
      | verzoek_van_college_of_eigen_aanvraag                              | false |
    When I evaluate outputs "ziekte_nu_binnen_termijn_lid_1, heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "ziekte_nu_binnen_termijn_lid_1" is true
    And output "heeft_recht_op_no_risk_polis" is true
