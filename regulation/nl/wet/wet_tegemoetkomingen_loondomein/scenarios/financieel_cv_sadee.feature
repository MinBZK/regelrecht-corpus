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

  # Een Wajonger valt onder de categorie BANENAFSPRAAK, niet onder
  # arbeidsgehandicapte werknemer. Dat laatste stond hier eerder wel, en gaf
  # Sadee 5.075,20 euro per jaar in plaats van 1.680,64 — een verschil van
  # 3.394,56. Gecorrigeerd na de reviewsessie; zie de opmerking bij de
  # categorie-parameters hieronder.
  #
  # is_oudere_werknemer is weggelaten: die categorie is per 2026 vervallen en
  # de wet van 2026 kent de parameter niet meer.
  #
  # is_arbeidsgehandicapte_werknemer staat op false en niet weggelaten, omdat
  # de categoriekeuze er expliciet op toetst. Zodra de herkomst van deze
  # categorieen is belegd, hoort dit een niet-waarde te worden in plaats van
  # een gok.
  #
  # De asymmetrie is hier het punt: is_doelgroep_banenafspraak is WEL belegd —
  # het komt via een source uit Wfsv artikel 38b, met de toelichting dat dat de
  # ene bron van waarheid is, gedeeld met de no-riskpolis. De categorieen
  # arbeidsgehandicapt en herplaatsen zijn daarentegen kale parameters zonder
  # bron. Juist daar ging het mis.
  # Het doelgroepregister komt niet meer als losse parameter binnen: de
  # engine leidt het af via Wfsv artikel 38b. Sadee komt daar binnen op
  # grond van lid 1 onderdeel c — recht op arbeidsondersteuning Wajong,
  # zonder de uitsluiting 'duurzaam geen mogelijkheden'. Alle andere
  # gronden staan uit.

  # De categorie-indeling is niet langer een vinkje. Artikel 2.1 haalt
  # 'arbeidsgehandicapte werknemer' uit artikel 2.6 en 'herplaatsen' uit
  # artikel 2.14, precies zoals het de banenafspraak uit Wfsv 38b haalt.
  # Wat hieronder binnenkomt zijn de feiten die die artikelen nodig hebben.
  # Voor deze persona staan ze alle tien uit: geen uitkeringsverleden in de
  # maand vóór aanvang, geen hervatting bij dezelfde werkgever, en — de
  # harde eis — geen doelgroepverklaring voor categorie a of c.

  Scenario: Sadee krijgt LKV-banenafspraak, want Wajong valt in die categorie
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                      | 999990100  |
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
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | true       |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2023-09-12 |
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
