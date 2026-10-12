Feature: Loonkostenvoordeel per categorie (Wtl 2026)
  De drie categorieën van het loonkostenvoordeel die het Financieel CV kan
  tonen: arbeidsgehandicapte werknemer (artikel 2.6, € 3,05 per uur, max
  € 6.000, drie jaar), banenafspraak (artikel 2.10, € 1,01 per uur, max
  € 2.000) en herplaatsen (artikel 2.14, € 3,05 per uur, max € 6.000, één
  jaar). De peildatum is 1 juli 2026; de parameterblokken volgen die van de
  banenafspraak-scenario's, met alleen de feiten omgezet die de categorie
  bepalen.

  # 1664 uur x € 3,05 = € 5.075,20; onder het maximum van € 6.000 (artikel 2.9).
  Scenario: Arbeidsgehandicapte werknemer (2.6), € 3,05 per verloond uur
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn | 999990501 |
      | verloonde_uren                                           | 1664       |
      | had_wia_recht_maand_voor_aanvang | true |
      | was_rea_arbeidsgehandicapte_voor_2006                    | false      |
      | was_in_dienst_bij_werkgever_binnen_zes_maanden           | false      |
      | heeft_geldige_doelgroepverklaring_2_7 | true |
      | valt_onder_uitzondering_lid_2                            | false      |
      | is_wsw_of_beschut_werk_dienstbetrekking                  | false      |
      | hervat_eigen_arbeid_of_andere_functie                    | false      |
      | heeft_of_krijgt_wia_recht_bij_hervatting                 | false      |
      | heeft_geldige_doelgroepverklaring_2_15                   | false      |
      | datum_aanvang_aanvraagtermijn_doelgroepverklaring_2_15 | null |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | behoort_tot_doelgroep_10b_lid_1 | false |
      | heeft_dienstbetrekking_beschut_werk | false |
      | is_pwet_toegeleid_of_lks_lid_2 | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d | false |
      | loonwaarde_percentage | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | verricht_arbeid_in_dienstbetrekking                      | false      |
      | is_pwet_toegeleid_naar_dienstbetrekking | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon | false |
      | laatste_dag_persoon_lid_1_b_of_c | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd | false |
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
    When I evaluate outputs "heeft_recht_op_lkv, categorie_lkv, tegemoetkoming_arbeidsgehandicapte_eurocent, tegemoetkoming_banenafspraak_eurocent, hoogte_lkv_per_jaar_eurocent" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "heeft_recht_op_lkv" is true
    And output "categorie_lkv" equals "arbeidsgehandicapte_werknemer"
    And output "tegemoetkoming_arbeidsgehandicapte_eurocent" equals 507520
    And output "tegemoetkoming_banenafspraak_eurocent" equals 0
    And output "hoogte_lkv_per_jaar_eurocent" equals 507520

  # 2080 uur x € 3,05 = € 6.344,00, dus ten hoogste € 6.000 (artikel 2.9).
  Scenario: Arbeidsgehandicapte werknemer, het maximum van € 6.000 per jaar bindt
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn | 999990501 |
      | verloonde_uren | 2080 |
      | had_wia_recht_maand_voor_aanvang | true |
      | was_rea_arbeidsgehandicapte_voor_2006                    | false      |
      | was_in_dienst_bij_werkgever_binnen_zes_maanden           | false      |
      | heeft_geldige_doelgroepverklaring_2_7 | true |
      | valt_onder_uitzondering_lid_2                            | false      |
      | is_wsw_of_beschut_werk_dienstbetrekking                  | false      |
      | hervat_eigen_arbeid_of_andere_functie                    | false      |
      | heeft_of_krijgt_wia_recht_bij_hervatting                 | false      |
      | heeft_geldige_doelgroepverklaring_2_15                   | false      |
      | datum_aanvang_aanvraagtermijn_doelgroepverklaring_2_15 | null |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | behoort_tot_doelgroep_10b_lid_1 | false |
      | heeft_dienstbetrekking_beschut_werk | false |
      | is_pwet_toegeleid_of_lks_lid_2 | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d | false |
      | loonwaarde_percentage | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | verricht_arbeid_in_dienstbetrekking                      | false      |
      | is_pwet_toegeleid_naar_dienstbetrekking | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon | false |
      | laatste_dag_persoon_lid_1_b_of_c | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt               | false      |
      | heeft_loonaangifte_verzoek_ingediend                     | true       |
      | heeft_wia_uitkering_hoofdstuk_6 | false |
      | experiment_instrument_82a_suwi_ingezet | false |
      | verloonde_uren_voorwaarden_2_6 | 2080 |
      | verloonde_uren_voorwaarden_2_10 | 2080 |
      | verloonde_uren_voorwaarden_2_14 | 2080 |
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
    When I evaluate outputs "heeft_recht_op_lkv, categorie_lkv, tegemoetkoming_arbeidsgehandicapte_eurocent, hoogte_lkv_per_jaar_eurocent" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "heeft_recht_op_lkv" is true
    And output "categorie_lkv" equals "arbeidsgehandicapte_werknemer"
    And output "tegemoetkoming_arbeidsgehandicapte_eurocent" equals 600000
    And output "hoogte_lkv_per_jaar_eurocent" equals 600000

  # Eerste dienstbetrekking op 1 januari 2023; drie jaar zijn op 1 juli 2026 verstreken.
  Scenario: Arbeidsgehandicapte werknemer na drie jaar (2.8): geen loonkostenvoordeel meer
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn | 999990501 |
      | verloonde_uren                                           | 1664       |
      | had_wia_recht_maand_voor_aanvang | true |
      | was_rea_arbeidsgehandicapte_voor_2006                    | false      |
      | was_in_dienst_bij_werkgever_binnen_zes_maanden           | false      |
      | heeft_geldige_doelgroepverklaring_2_7 | true |
      | valt_onder_uitzondering_lid_2                            | false      |
      | is_wsw_of_beschut_werk_dienstbetrekking                  | false      |
      | hervat_eigen_arbeid_of_andere_functie                    | false      |
      | heeft_of_krijgt_wia_recht_bij_hervatting                 | false      |
      | heeft_geldige_doelgroepverklaring_2_15                   | false      |
      | datum_aanvang_aanvraagtermijn_doelgroepverklaring_2_15 | null |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | behoort_tot_doelgroep_10b_lid_1 | false |
      | heeft_dienstbetrekking_beschut_werk | false |
      | is_pwet_toegeleid_of_lks_lid_2 | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d | false |
      | loonwaarde_percentage | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | verricht_arbeid_in_dienstbetrekking                      | false      |
      | is_pwet_toegeleid_naar_dienstbetrekking | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon | false |
      | laatste_dag_persoon_lid_1_b_of_c | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt               | false      |
      | heeft_loonaangifte_verzoek_ingediend                     | true       |
      | heeft_wia_uitkering_hoofdstuk_6 | false |
      | experiment_instrument_82a_suwi_ingezet | false |
      | verloonde_uren_voorwaarden_2_6 | 1664 |
      | verloonde_uren_voorwaarden_2_10 | 1664 |
      | verloonde_uren_voorwaarden_2_14 | 1664 |
      | verricht_wsw_arbeid_artikel_2_zonder_terbeschikkingstelling | false |
      | periode_2_12_is_verstreken | false |
      | datum_aanvang_eerste_dienstbetrekking_2_6 | 2023-01-01 |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk | null |
      | komt_uit_voortgezet_speciaal_onderwijs | false |
      | komt_uit_praktijkonderwijs | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie | false |
      | ontvangt_voorziening_wia_35_lid_2 | false |
      | ontvangt_voorziening_pwet_10 | false |
      | verzoek_van_college_of_eigen_aanvraag | false |
    When I evaluate outputs "periode_2_8_is_verstreken, heeft_recht_op_lkv, categorie_lkv, tegemoetkoming_arbeidsgehandicapte_eurocent, hoogte_lkv_per_jaar_eurocent" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "periode_2_8_is_verstreken" is true
    And output "heeft_recht_op_lkv" is false
    And output "categorie_lkv" equals "geen"
    And output "tegemoetkoming_arbeidsgehandicapte_eurocent" equals 0
    And output "hoogte_lkv_per_jaar_eurocent" equals 0

  # Hervatting met WIA-recht, doelgroepverklaring 2.15, aanvraagtermijn van 2.16 (één jaar) loopt nog.
  Scenario: Herplaatsen arbeidsgehandicapte werknemer (2.14), € 3,05 per verloond uur
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn | 999990501 |
      | verloonde_uren                                           | 1664       |
      | had_wia_recht_maand_voor_aanvang                         | false      |
      | was_rea_arbeidsgehandicapte_voor_2006                    | false      |
      | was_in_dienst_bij_werkgever_binnen_zes_maanden           | false      |
      | heeft_geldige_doelgroepverklaring_2_7                    | false      |
      | valt_onder_uitzondering_lid_2                            | false      |
      | is_wsw_of_beschut_werk_dienstbetrekking                  | false      |
      | hervat_eigen_arbeid_of_andere_functie | true |
      | heeft_of_krijgt_wia_recht_bij_hervatting | true |
      | heeft_geldige_doelgroepverklaring_2_15 | true |
      | datum_aanvang_aanvraagtermijn_doelgroepverklaring_2_15 | 2026-03-01 |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | behoort_tot_doelgroep_10b_lid_1 | false |
      | heeft_dienstbetrekking_beschut_werk | false |
      | is_pwet_toegeleid_of_lks_lid_2 | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d | false |
      | loonwaarde_percentage | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | verricht_arbeid_in_dienstbetrekking                      | false      |
      | is_pwet_toegeleid_naar_dienstbetrekking | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon | false |
      | laatste_dag_persoon_lid_1_b_of_c | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd | false |
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
    When I evaluate outputs "heeft_recht_op_lkv, is_herplaatsen_arbeidsgehandicapte, categorie_lkv, tegemoetkoming_herplaatsen_eurocent, hoogte_lkv_per_jaar_eurocent" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "heeft_recht_op_lkv" is true
    And output "is_herplaatsen_arbeidsgehandicapte" is true
    And output "categorie_lkv" equals "herplaatsen_arbeidsgehandicapte"
    And output "tegemoetkoming_herplaatsen_eurocent" equals 507520
    And output "hoogte_lkv_per_jaar_eurocent" equals 507520

  # Termijn aangevangen 1 mei 2025; één jaar is op 1 juli 2026 verstreken.
  Scenario: Herplaatsen: aanvraagtermijn van 2.16 verstreken, geen loonkostenvoordeel
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn | 999990501 |
      | verloonde_uren                                           | 1664       |
      | had_wia_recht_maand_voor_aanvang                         | false      |
      | was_rea_arbeidsgehandicapte_voor_2006                    | false      |
      | was_in_dienst_bij_werkgever_binnen_zes_maanden           | false      |
      | heeft_geldige_doelgroepverklaring_2_7                    | false      |
      | valt_onder_uitzondering_lid_2                            | false      |
      | is_wsw_of_beschut_werk_dienstbetrekking                  | false      |
      | hervat_eigen_arbeid_of_andere_functie | true |
      | heeft_of_krijgt_wia_recht_bij_hervatting | true |
      | heeft_geldige_doelgroepverklaring_2_15 | true |
      | datum_aanvang_aanvraagtermijn_doelgroepverklaring_2_15 | 2025-05-01 |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | behoort_tot_doelgroep_10b_lid_1 | false |
      | heeft_dienstbetrekking_beschut_werk | false |
      | is_pwet_toegeleid_of_lks_lid_2 | false |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d | false |
      | loonwaarde_percentage | 60 |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | verricht_arbeid_in_dienstbetrekking                      | false      |
      | is_pwet_toegeleid_naar_dienstbetrekking | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon | false |
      | laatste_dag_persoon_lid_1_b_of_c | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd | false |
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
    When I evaluate outputs "periode_2_16_is_verstreken, is_herplaatsen_arbeidsgehandicapte, heeft_recht_op_lkv, hoogte_lkv_per_jaar_eurocent" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "periode_2_16_is_verstreken" is true
    And output "is_herplaatsen_arbeidsgehandicapte" is false
    And output "heeft_recht_op_lkv" is false
    And output "hoogte_lkv_per_jaar_eurocent" equals 0

  # Koens banenafspraak-feiten plus WIA-recht in de maand vóór aanvang en een doelgroepverklaring 2.7.
  Scenario: Samenloop banenafspraak en arbeidsgehandicapte: de hoogste tegemoetkoming telt (4.1 lid 3)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn | 999990502 |
      | verloonde_uren                                           | 1664       |
      | had_wia_recht_maand_voor_aanvang | true |
      | was_rea_arbeidsgehandicapte_voor_2006                    | false      |
      | was_in_dienst_bij_werkgever_binnen_zes_maanden           | false      |
      | heeft_geldige_doelgroepverklaring_2_7 | true |
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
      | verricht_arbeid_in_dienstbetrekking                      | false      |
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
    When I evaluate outputs "heeft_recht_op_lkv, tegemoetkoming_banenafspraak_eurocent, tegemoetkoming_arbeidsgehandicapte_eurocent, hoogte_lkv_per_jaar_eurocent, categorie_lkv" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "heeft_recht_op_lkv" is true
    And output "tegemoetkoming_banenafspraak_eurocent" equals 168064
    And output "tegemoetkoming_arbeidsgehandicapte_eurocent" equals 507520
    And output "hoogte_lkv_per_jaar_eurocent" equals 507520
    And output "categorie_lkv" equals "arbeidsgehandicapte_werknemer"
