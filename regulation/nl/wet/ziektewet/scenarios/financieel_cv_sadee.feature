Feature: Financieel CV, werkgever-perspectief, casus Sadee
  Als werkgever (MKB)
  Wil ik weten welke financiële voordelen ik krijg als ik Sadee aanneem
  Zodat ik een onderbouwd besluit kan nemen over het dienstverband

  # Verticale slice door de zeven outputs van het Financieel CV voor één
  # werknemerprofiel. Doel: aan jurist + UWV-uitvoerder + ondernemer
  # concreet tonen wat regelrecht uitrekent én wat het laat zien als
  # "niet van toepassing" of "via andere regelgeving".
  #
  # Werknemerprofiel — Sadee
  #   - 28 jaar (geboren 1996-05-15)
  #   - In dienst per 1 januari 2024
  #   - Wajong-uitkering, doelgroep banenafspraak
  #   - Geschatte loonwaarde 70% van WML (arbeidsprestatie < minimumloon)
  #   - €14,50 per uur × 32 uur per week × 52 weken
  #     = 1664 verloonde uren, jaarloon €24.128 (2.412.800 eurocent)
  #
  # Peildatum 2026-07-01. De engine pakt per wet de laatst-geldende
  # versie (valid_from <= peildatum); de machine_readable hangt sinds de
  # her-hang op v0.5.4 op de 2026-07-01-versies, dus die peildatum laadt
  # precies de wetsversies die wij hebben gemodelleerd.
  #
  # KANTTEKENING voor de jurist: de versie-drift uit de juristvalidatie
  # is verwerkt. In Wtl artikel 2.1 is per 2026 het loonkostenvoordeel
  # OUDERE WERKNEMER vervallen; de lijst telt nog drie categorieen
  # (a arbeidsgehandicapte, b banenafspraak, c herplaatsen
  # arbeidsgehandicapte). Herplaatsen is dus niet geschrapt maar
  # opgeschoven van d naar c. De LKS-doelgroep is uitgebreid met
  # Pwet 10d lid 2 onderdeel c (leer-werktraject zonder
  # startkwalificatie).
  #
  # Niet in deze slice:
  #   - Wajong-voorzieningen a en b van art. 2:22 lid 2 (vervoer,
  #     intermediaire activiteiten) en de leefomstandigheden-voorziening
  #     van lid 3. Onderdelen c en d — werkplekaanpassing en jobcoaching,
  #     de tegenhanger van WIA art. 35 — zijn gemodelleerd; de scenario's
  #     staan in het Wajong-bestand.

  # ────────────────────────────────────────────────────────────────────
  # NRP — Ziektewet artikel 29b
  # Sadee triggert lid 2.a (Wajong-status) én lid 2.e (banenafspraak).
  # Lid 2 geeft duur -1 (onbeperkt) en wint van de 5-jaars termijn van lid 1.
  #
  # Geen enkele doelgroep komt nog als losse vlag binnen (zie de toelichting
  # in financieel_cv_koen.feature). Sadee's Wajong-recht wordt afgeleid
  # uit Wajong artikel 2:15: jonggehandicapte, niet meer dan 75% van het
  # maatmaninkomen, geen uitsluitingsgrond, achttien of ouder, aanvraag
  # van 2 juni 2014 — zestien weken later, op 22 september 2014, ontstond
  # het recht, nog vóór de sluiting van de instroom per 1 januari 2015
  # (lid 4). Het doelgroepregister komt uit Wfsv 38b lid 1 onderdeel c.
  # Ze heeft geen loonkostensubsidie (die is voor de Pwet-doelgroep), dus
  # onderdeel e draagt alleen via het register.

  # Datums die alleen gelden als een bijbehorend feit waar is (eerste
  # ziektedag, datum Wajong-aanvraag) staan op 1900-01-01 wanneer dat feit
  # onwaar is: de engine geeft een ontbrekende optionele parameter nog niet
  # als "geen waarde" door aan een andere wet, en de afleiding gebruikt de
  # datum dan niet.

  Scenario: Sadee krijgt no-risk polis als Wajonger op banenafspraakregister
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                         | 999990100  |
      | geboortedatum                                               | 1996-05-15 |
      | datum_aanvang_dienstbetrekking                              | 2024-01-01 |
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
      | aanvraag_arbeidsondersteuning_wajong_ingediend              | true       |
      | is_jonggehandicapte_hoofdstuk_2_wajong                      | true       |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen            | true       |
      | is_uitsluitingsgrond_2_11_wajong_van_toepassing             | false      |
      | datum_aanvraag_arbeidsondersteuning_wajong                  | 2014-06-02 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong            | false      |
      | recht_op_arbeidsondersteuning_herleeft_2_17                 | false      |
      | had_of_heeft_wajong_arbeidsongeschiktheidsuitkering         | false      |
      | dienstbetrekking_aangevangen_voor_achttien_en_voor_wajong_recht | false  |
      | is_wsw_werknemer                                            | false      |
      | had_wsw_dienstbetrekking_of_indicatie_voorafgaand           | false      |
      | is_uitgesloten_beschut_werk_pwet_10b                        | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling       | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                        | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering              | true       |
      | heeft_wajong_duurzaam_geen_mogelijkheden                    | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                          | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek    | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01        | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden        | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                        | false      |
      | datum_eerste_opname_doelgroepregister                       | 2023-09-12 |
      | was_arbeidsbeperkte_lid_1_of_2                              | false      |
      | registratie_nog_niet_geeindigd                              | true       |
      | behoort_tot_doelgroep_lks                                   | false      |
      | kan_minimumloon_niet_verdienen                              | true       |
      | aanvraag_lks_ingediend_binnen_zes_maanden                   | false      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep           | false      |
      | is_wsw_dienstbetrekking                                     | false      |
      | loonwaarde_eurocent_per_maand                               | 150850     |
      | overeengekomen_arbeidsduur_uren_per_week                    | 32         |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand         | 215500     |
      | behoort_tot_doelgroep_10b_lid_1                             | false      |
      | heeft_dienstbetrekking_beschut_werk                         | false      |
      | dienstbetrekking_voortgezet_na_vaststelling_wia_recht       | false      |
    When I evaluate "heeft_recht_op_no_risk_polis" of "ziektewet"
    Then the execution succeeds
    And output "heeft_recht_op_wia_uitkering" is false
    And output "voldoet_aan_lid_1" is false
    And output "voldoet_aan_lid_2_a" is true
    And output "voldoet_aan_lid_2_e" is true
    And output "voldoet_aan_lid_2_f" is false
    And output "voldoet_aan_lid_2" is true
    And output "heeft_recht_op_no_risk_polis" is true
    And output "duur_no_risk_polis_jaren" equals -1
