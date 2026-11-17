Feature: Versie-aansluiting Wtl 2026 op de Wfsv (peildata 1 januari t/m 30 juni 2026)
  De Wtl-versie van 1 januari 2026 haalt categorie b (artikel 2.10) uit Wfsv
  artikel 38b. Op een peildatum vóór 1 juli 2026 geldt de Wfsv-versie van
  1 januari 2025; die moet dezelfde output en dezelfde parameters kennen,
  anders faalt de aanroep ("output not found", "Variable not found").
  Toegevoegd 25 oktober 2026 na review. Parameterblok en uitkomst gelijk aan
  financieel_cv_koen.feature (peildatum 1 juli 2026).

  # Peildatum mei 2026: Wtl 2026-01-01, Wfsv 2025-01-01 en Besluit Wfsv
  # 2026-04-01 (artikel 2.24, onderdeel d). Vóór 1 april 2026 geldt de
  # Besluit-versie van 2024; sinds 25 oktober 2026 werkt die artikel 2.24 lid 1
  # en 3 ook uit (tekst gelijk aan de versie van 2026), zie het tweede scenario.

  Scenario: Koen met peildatum mei 2026 vindt de Wfsv-versie van 2025 (versie-aansluiting)
    Given the calculation date is "2026-05-04"
    And the following parameters:
      | bsn                                                      | 999990101  |
      | verloonde_uren                                           | 1664       |
      | had_wia_recht_maand_voor_aanvang                         | false      |
      | was_rea_arbeidsgehandicapte_voor_2006                    | false      |
      | was_in_dienst_bij_werkgever_binnen_zes_maanden           | false      |
      | heeft_geldige_doelgroepverklaring_2_7                    | false      |
      | valt_onder_uitzondering_lid_2                            | false      |
      | is_wsw_of_beschut_werk_dienstbetrekking                  | false      |
      | hervat_eigen_arbeid_of_andere_functie                    | false      |
      | heeft_of_krijgt_wia_recht_bij_hervatting                 | false      |
      | heeft_geldige_doelgroepverklaring_2_15                   | false      |
      | datum_aanvang_aanvraagtermijn_doelgroepverklaring_2_15 | null |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | behoort_tot_doelgroep_10b_lid_1 | false |
      | heeft_dienstbetrekking_beschut_werk | false |
      | is_pwet_toegeleid_of_lks_lid_2 | true |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d | true |
      | loonwaarde_percentage | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | verricht_arbeid_in_dienstbetrekking                      | true       |
      | is_pwet_toegeleid_naar_dienstbetrekking | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon | false |
      | laatste_dag_persoon_lid_1_b_of_c | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd                           | true       |
      | heeft_pensioengerechtigde_leeftijd_bereikt               | false      |
      | heeft_loonaangifte_verzoek_ingediend                     | true       |
      | heeft_wia_uitkering_hoofdstuk_6 | false |
      | experiment_instrument_82a_suwi_ingezet | false |
      | verloonde_uren_voorwaarden_2_6 | 1664 |
      | verloonde_uren_voorwaarden_2_10 | 1664 |
      | verloonde_uren_voorwaarden_2_14 | 1664 |
      | verricht_wsw_arbeid_artikel_2_zonder_terbeschikkingstelling | false |
      | periode_2_12_is_verstreken | false |
      | datum_aanvang_eerste_dienstbetrekking_2_6 | 2026-01-01 |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk | null |
      | komt_uit_voortgezet_speciaal_onderwijs | false |
      | komt_uit_praktijkonderwijs | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie | false |
      | ontvangt_voorziening_wia_35_lid_2 | false |
      | ontvangt_voorziening_pwet_10 | false |
      | verzoek_van_college_of_eigen_aanvraag | false |
    When I evaluate outputs "heeft_recht_op_lkv, categorie_lkv, tegemoetkoming_banenafspraak_eurocent, hoogte_lkv_per_jaar_eurocent" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "heeft_recht_op_lkv" is true
    And output "categorie_lkv" equals "banenafspraak"
    And output "tegemoetkoming_banenafspraak_eurocent" equals 168064
    And output "hoogte_lkv_per_jaar_eurocent" equals 168064

  Scenario: Koen met peildatum maart 2026 vindt de Wfsv-versie van 2025 en Besluit Wfsv 2024 (versie-aansluiting)
    Given the calculation date is "2026-03-02"
    And the following parameters:
      | bsn                                                      | 999990101  |
      | verloonde_uren                                           | 1664       |
      | had_wia_recht_maand_voor_aanvang                         | false      |
      | was_rea_arbeidsgehandicapte_voor_2006                    | false      |
      | was_in_dienst_bij_werkgever_binnen_zes_maanden           | false      |
      | heeft_geldige_doelgroepverklaring_2_7                    | false      |
      | valt_onder_uitzondering_lid_2                            | false      |
      | is_wsw_of_beschut_werk_dienstbetrekking                  | false      |
      | hervat_eigen_arbeid_of_andere_functie                    | false      |
      | heeft_of_krijgt_wia_recht_bij_hervatting                 | false      |
      | heeft_geldige_doelgroepverklaring_2_15                   | false      |
      | datum_aanvang_aanvraagtermijn_doelgroepverklaring_2_15 | null |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | behoort_tot_doelgroep_10b_lid_1 | false |
      | heeft_dienstbetrekking_beschut_werk | false |
      | is_pwet_toegeleid_of_lks_lid_2 | true |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d | true |
      | loonwaarde_percentage | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | verricht_arbeid_in_dienstbetrekking                      | true       |
      | is_pwet_toegeleid_naar_dienstbetrekking | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon | false |
      | laatste_dag_persoon_lid_1_b_of_c | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd                           | true       |
      | heeft_pensioengerechtigde_leeftijd_bereikt               | false      |
      | heeft_loonaangifte_verzoek_ingediend                     | true       |
      | heeft_wia_uitkering_hoofdstuk_6 | false |
      | experiment_instrument_82a_suwi_ingezet | false |
      | verloonde_uren_voorwaarden_2_6 | 1664 |
      | verloonde_uren_voorwaarden_2_10 | 1664 |
      | verloonde_uren_voorwaarden_2_14 | 1664 |
      | verricht_wsw_arbeid_artikel_2_zonder_terbeschikkingstelling | false |
      | periode_2_12_is_verstreken | false |
      | datum_aanvang_eerste_dienstbetrekking_2_6 | 2026-01-01 |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk | null |
      | komt_uit_voortgezet_speciaal_onderwijs | false |
      | komt_uit_praktijkonderwijs | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie | false |
      | ontvangt_voorziening_wia_35_lid_2 | false |
      | ontvangt_voorziening_pwet_10 | false |
      | verzoek_van_college_of_eigen_aanvraag | false |
    When I evaluate outputs "heeft_recht_op_lkv, categorie_lkv, tegemoetkoming_banenafspraak_eurocent, hoogte_lkv_per_jaar_eurocent" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "heeft_recht_op_lkv" is true
    And output "categorie_lkv" equals "banenafspraak"
    And output "tegemoetkoming_banenafspraak_eurocent" equals 168064
    And output "hoogte_lkv_per_jaar_eurocent" equals 168064
