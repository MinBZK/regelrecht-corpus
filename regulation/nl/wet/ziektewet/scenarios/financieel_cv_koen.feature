Feature: Financieel CV, werknemer-perspectief, casus Koen
  Als werknemer (Pwet-doelgroep, banenafspraak)
  Wil ik weten welke voorzieningen en voordelen mijn nieuwe dienstverband
  meebrengt
  Zodat ik weet wat ik zelf kan aanvragen en welk financieel kader er
  voor mijn werkgever achter mijn dienstverband zit

  # Verticale slice door de Financieel CV vanuit werknemer-perspectief.
  # Sommige outputs zijn werkgever-voordelen (LKS, LKV) — die zijn voor
  # transparantie meegenomen: een werknemer mag weten wat de
  # gemeente/Belastingdienst aan zijn werkgever uitkeert om hem een
  # fatsoenlijk loon te kunnen geven.
  #
  # De engine-assertions zijn dezelfde als bij werkgever-perspectief.
  # Het persona-verschil zit in de presentatie-laag (brief-template),
  # die buiten scope is voor deze slice.
  #
  # Werknemerprofiel — Koen
  #   - 42 jaar (geboren 1984-03-15)
  #   - Pwet-uitkering, doelgroep banenafspraak
  #   - Geschatte loonwaarde 60% van WML
  #   - In dienst per 1 januari 2026 bij logistiek MKB via gemeente
  #   - €12 per uur × 32 uur per week × 52 weken
  #     = 1664 verloonde uren, jaarloon €19.968 (1.996.800 eurocent)
  #
  # Peildatum 2026-07-01: de machine_readable hangt op de
  # 2026-07-01-wetsversies, dus die peildatum laadt precies wat wij
  # hebben gemodelleerd. Kanttekening + drift-uitleg: zie
  # financieel_cv_sadee.feature.

  # ────────────────────────────────────────────────────────────────────
  # NRP — Ziektewet artikel 29b
  # Koen triggert lid 2.e (banenafspraak via Pwet + LKS) — onbeperkte duur.
  # Werknemer-relevantie: openhartig kunnen zijn over gezondheid; zieke-
  # dagen belasten werkgever niet.
  #
  # Geen enkele doelgroep komt nog als losse vlag binnen. De engine
  # leidt ze af bij de wet waar ze thuishoren:
  #   - lid 1.a en lid 4: Wet WIA artikel 47 (IVA) en 54 (WGA), met de
  #     wachttijd van artikel 23, de mate van arbeidsongeschiktheid van
  #     artikel 4 en 5 en de uitsluitingsgronden van artikel 43;
  #   - lid 1.b: de mate van arbeidsongeschiktheid uit Wet WIA artikel 5,
  #     de overige voorwaarden staan in 29b zelf;
  #   - lid 1.c en d: leeftijd en de vijfjaarstermijn na het onderwijs,
  #     berekend uit geboortedatum en data;
  #   - lid 2.a: Wajong artikel 2:15 (recht op arbeidsondersteuning);
  #   - lid 2.e: Wfsv artikel 38b (doelgroepregister) of Pwet artikel
  #     10c/10d (loonkostensubsidie);
  #   - lid 2.f: Pwet artikel 10b (beschut werk).
  # Koen komt binnen op 38b lid 1 onderdeel a (toegeleid vanuit de
  # Participatiewet met een UWV-loonwaardevaststelling) én via de
  # loonkostensubsidie van Pwet 10d. Alle andere gronden staan uit, zodat
  # de trace laat zien wélke grond de registratie draagt. Koen is nooit
  # ziek uitgevallen, dus de WIA-route kent geen wachttijd; de leaf-feiten
  # van artikel 43 staan allemaal op onwaar.

  # Datums die alleen gelden als een bijbehorend feit waar is (eerste
  # ziektedag, datum Wajong-aanvraag) staan op 1900-01-01 wanneer dat feit
  # onwaar is: de engine geeft een ontbrekende optionele parameter nog niet
  # als "geen waarde" door aan een andere wet, en de afleiding gebruikt de
  # datum dan niet.

  Scenario: Koen krijgt no-risk polis als banenafspraak-werknemer met LKS
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                         | 999990101  |
      | geboortedatum                                               | 1984-03-15 |
      | datum_aanvang_dienstbetrekking                              | 2026-01-01 |
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
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling       | true       |
      | is_wsw_geindiceerd_of_oude_indicatie                        | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering              | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                    | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                          | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek    | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01        | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden        | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                        | false      |
      | datum_eerste_opname_doelgroepregister                       | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                              | false      |
      | registratie_nog_niet_geeindigd                              | true       |
      | behoort_tot_doelgroep_lks                                   | true       |
      | kan_minimumloon_niet_verdienen                              | true       |
      | aanvraag_lks_ingediend_binnen_zes_maanden                   | true       |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep           | true       |
      | is_wsw_dienstbetrekking                                     | false      |
      | loonwaarde_eurocent_per_maand                               | 129300     |
      | overeengekomen_arbeidsduur_uren_per_week                    | 32         |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand         | 215500     |
      | behoort_tot_doelgroep_10b_lid_1                             | false      |
      | heeft_dienstbetrekking_beschut_werk                         | false      |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht       | false      |
    When I evaluate "heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "heeft_recht_op_wia_uitkering" is false
    And output "voldoet_aan_lid_1" is false
    And output "voldoet_aan_lid_2_a" is false
    And output "voldoet_aan_lid_2_e" is true
    And output "voldoet_aan_lid_2_f" is false
    And output "voldoet_aan_lid_2" is true
    And output "voldoet_aan_lid_4" is false
    And output "heeft_recht_op_no_risk_polis" is true
    And output "duur_no_risk_polis_jaren" equals -1
