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

  # Het doelgroepregister komt niet meer als losse parameter binnen: de
  # engine leidt het af via Wfsv artikel 38b. Koen komt daar binnen op
  # grond van lid 1 onderdeel a — toegeleid vanuit de Participatiewet met
  # een UWV-loonwaardevaststelling. Alle andere gronden staan uit, zodat
  # de trace laat zien wélke grond de registratie draagt.

  # De categorie-indeling is niet langer een vinkje. Artikel 2.1 haalt
  # 'arbeidsgehandicapte werknemer' uit artikel 2.6 en 'herplaatsen' uit
  # artikel 2.14, precies zoals het de banenafspraak uit Wfsv 38b haalt.
  # Wat hieronder binnenkomt zijn de feiten die die artikelen nodig hebben.
  # Voor deze persona staan ze alle tien uit: geen uitkeringsverleden in de
  # maand vóór aanvang, geen hervatting bij dezelfde werkgever, en — de
  # harde eis — geen doelgroepverklaring voor categorie a of c.

  Scenario: Werkgever ontvangt LKV-banenafspraak voor Koen — €1.680,64 per jaar
    Given the calculation date is "2026-07-01"
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
      | periode_2_16_is_verstreken                               | false      |
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
      | heeft_pensioengerechtigde_leeftijd_bereikt               | false      |
      | heeft_loonaangifte_verzoek_ingediend                     | true       |
    When I evaluate "heeft_recht_op_lkv" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "heeft_recht_op_lkv" is true
    And output "categorie_lkv" equals "banenafspraak"
    And output "tegemoetkoming_banenafspraak_eurocent" equals 168064
    And output "hoogte_lkv_per_jaar_eurocent" equals 168064
