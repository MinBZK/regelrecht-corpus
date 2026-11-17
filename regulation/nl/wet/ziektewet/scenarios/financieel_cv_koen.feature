Feature: Financieel CV, werknemer-perspectief, casus Koen
  Als werknemer (Pwet-doelgroep, banenafspraak)
  Wil ik weten welke voorzieningen en voordelen mijn nieuwe dienstverband
  meebrengt
  Zodat ik weet wat ik zelf kan aanvragen en welk financieel kader er
  voor mijn werkgever achter mijn dienstverband zit

  # Afgeleid op 2026-10-09: datum_aanvraag_lks vervangt de boolean
  # "aanvraag binnen zes maanden". Waar die waar was, staat de aanvraag op een
  # maand na de aanvang van de dienstbetrekking; waar hij onwaar was, is er
  # geen aanvraag. Die datum is een aanname, geen gegeven uit de persona.

  # Afgeleid op 2026-10-25 (review B1): datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b
  # vervangt de boolean was_persoon_7_lid_1_a_of_7a_in_zes_maanden_voorafgaand
  # (Pwet 10d lid 2 onderdeel b). Koen had een Pwet-uitkering tot zijn
  # indiensttreding op 1 januari 2026; gekozen is 2025-12-31. Dat valt binnen
  # de zes maanden, dus de uitkomst blijft gelijk.

  # Rechtgezet op 2026-10-25 (review C1): Koen is in dienst met een door het
  # college vastgestelde loonwaarde van 60%. werkgever_is_voornemens_dienstbetrekking_aan_te_gaan,
  # dienstbetrekking_is_tot_stand_gekomen, college_heeft_loonwaarde_vastgesteld
  # en verricht_arbeid_in_dienstbetrekking staan daarom op waar. De uitkomsten
  # blijven gelijk: lid 2 onderdeel e leest Pwet 10d lid 2, en
  # verricht_arbeid_in_dienstbetrekking telt alleen bij Wajong "duurzaam geen
  # mogelijkheden".

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
  #   - €15 per uur × 32 uur per week × 52 weken
  #     = 1664 verloonde uren, jaarloon €24.960 (2.496.000 eurocent)
  #     (gecorrigeerd 25 oktober 2026: stond op €12, onder het
  #     minimumuurloon van €14,99 per 1 juli 2026.)
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
  # ziektedag) staan op 1900-01-01 wanneer dat feit
  # onwaar is: de engine geeft een ontbrekende optionele parameter nog niet
  # als "geen waarde" door aan een andere wet, en de afleiding gebruikt de
  # datum dan niet.

  Scenario: Koen krijgt no-risk polis als banenafspraak-werknemer met LKS
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn | 999990101 |
      | geboortedatum | 1984-03-15 |
      | datum_aanvang_dienstbetrekking | 2026-01-01 |
      | is_verzekerde_wia | true |
      | is_ziek_geworden_wia | false |
      | eerste_dag_wachttijd_wia | 1900-01-01 |
      | verdiencapaciteit_percentage_maatmaninkomen | 100 |
      | is_medisch_duurzaam_wia | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7 | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog | false |
      | is_rechtens_vrijheid_ontnomen | false |
      | onttrekt_zich_aan_vrijheidsstraf | false |
      | woont_niet_in_nederland | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt | false |
      | is_overleden | false |
      | is_uitreiziger | false |
      | arbeidskundig_onderzoek_verricht | false |
      | datum_aanvang_dienstbetrekking_andere_werkgever_lid_1_b_2 | null |
      | datum_einde_dienstbetrekking_andere_werkgever_lid_1_b_2 | null |
      | niet_in_staat_tot_eigen_of_passende_arbeid_bij_eigen_werkgever | false |
      | heeft_belemmering_bij_onderwijs_door_ziekte_of_gebrek | false |
      | aanvraag_arbeidsondersteuning_wajong_ingediend | false |
      | is_jonggehandicapte_hoofdstuk_2_wajong | false |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen | 100 |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing | false |
      | datum_aanvraag_arbeidsondersteuning_wajong | null |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong | false |
      | recht_op_arbeidsondersteuning_herleeft_2_17 | false |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering | false |
      | datum_ontstaan_recht_wajong | null |
      | is_wsw_werknemer | false |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand | false |
      | is_uitgesloten_beschut_werk_pwet_10b | false |
      | is_pwet_toegeleid_of_lks_lid_2 | true |
      | uwv_heeft_op_verzoek_college_vastgesteld_niet_in_staat_minimumloon | false |
      | college_heeft_loonwaarde_vastgesteld_conform_10d | true |
      | is_wsw_geindiceerd_of_oude_indicatie | false |
      | heeft_wajong_arbeidsondersteuning_of_uitkering | false |
      | heeft_wajong_duurzaam_geen_mogelijkheden | false |
      | verricht_arbeid_in_dienstbetrekking | true |
      | is_pwet_toegeleid_naar_dienstbetrekking | false |
      | uwv_heeft_op_eigen_verzoek_vastgesteld_niet_in_staat_minimumloon | false |
      | laatste_dag_persoon_lid_1_b_of_c | null |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden | false |
      | is_jonggehandicapt_uwv_oordeel_lid_2 | false |
      | datum_eerste_opname_doelgroepregister | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2 | false |
      | registratie_nog_niet_geeindigd | true |
      | behoort_tot_doelgroep_lks | true |
      | kan_minimumloon_niet_verdienen | true |
      | datum_aanvraag_lks | 2026-02-01 |
      | datum_einde_deelname_onderwijs_lid_2_a | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b | 2025-12-31 |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false |
      | is_wsw_dienstbetrekking | false |
      | loonwaarde_percentage | 60 |
      | overeengekomen_arbeidsduur_uren_per_week | 32 |
      | behoort_tot_doelgroep_10b_lid_1 | false |
      | heeft_dienstbetrekking_beschut_werk | false |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht | false |
      | heeft_wia_uitkering_hoofdstuk_6 | false |
      | experiment_instrument_82a_suwi_ingezet | false |
      | verricht_arbeid_in_wsw_dienstbetrekking_artikel_2 | false |
      | loon_referteperiode_eurocent | 0 |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent | 0 |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent | 0 |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode | true |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking | null |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan | true |
      | dienstbetrekking_is_tot_stand_gekomen | true |
      | college_heeft_loonwaarde_vastgesteld | true |
      | vaststelling_loonwaarde_blijft_achterwege | false |
      | aantal_gerealiseerde_dienstbetrekkingen_beschut_werk | null |
      | einddatum_tijdvak_lid_1_b | null |
      | wsw_subsidiebedrag_per_werkdag_eurocent | null |
      | datum_voldaan_aan_lid_1 | null |
      | komt_uit_voortgezet_speciaal_onderwijs | false |
      | komt_uit_praktijkonderwijs | false |
      | heeft_zich_schriftelijk_gemeld_bij_uwv | false |
      | heeft_duurzaam_geen_mogelijkheden_arbeidsparticipatie | false |
      | ontvangt_voorziening_wia_35_lid_2 | false |
      | ontvangt_voorziening_pwet_10 | false |
      | verzoek_van_college_of_eigen_aanvraag | false |
    When I evaluate outputs "heeft_recht_op_no_risk_polis, heeft_recht_op_wia_uitkering, voldoet_aan_lid_1, voldoet_aan_lid_2_a, voldoet_aan_lid_2_e, voldoet_aan_lid_2_f, voldoet_aan_lid_2, voldoet_aan_lid_4, duur_no_risk_polis_jaren" of "ziektewet"
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
