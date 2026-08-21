Feature: Financieel CV — werknemer-perspectief, casus Koen
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
  # Het doelgroepregister komt niet meer als losse parameter binnen: de
  # engine leidt het af via Wfsv artikel 38b. Koen komt daar binnen op
  # grond van lid 1 onderdeel a — toegeleid vanuit de Participatiewet met
  # een UWV-loonwaardevaststelling. Alle andere gronden staan uit, zodat
  # de trace laat zien wélke grond de registratie draagt.

  Scenario: Koen krijgt no-risk polis als banenafspraak-werknemer met LKS
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                      | 999990101  |
      | is_wsw_werknemer                                         | false      |
      | is_wia_uitkeringsgerechtigd                              | false      |
      | is_wia_min_35_arbeidsongeschikt                          | false      |
      | heeft_voortgezet_wia_recht                               | false      |
      | heeft_arbeidsbeperking_wia                               | false      |
      | is_wajong_gerechtigd                                     | false      |
      | is_jonggehandicapt_schoolverlater                        | false      |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | true       |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd                           | true       |
      | is_pwet_loonkostensubsidie                               | true       |
      | is_beschut_werk                                          | false      |
      | loonwaarde_lager_dan_minimumloon                         | true       |
    When I evaluate "heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "heeft_recht_op_no_risk_polis" is true
    And output "duur_no_risk_polis_jaren" equals -1
