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
  #   - 30 jaar op de peildatum 2026-07-01 (geboren 1996-05-15)
  #   - In dienst per 1 januari 2024
  #   - Wajong-uitkering, doelgroep banenafspraak
  #   - Geschatte loonwaarde 70% van WML (arbeidsprestatie < minimumloon)
  #   - Loondispensatie (Wajong 2:20): de werkgever betaalt de
  #     gerechtvaardigde beloning van €10,50 per uur, 70% van de
  #     gebruikelijke beloning van €15,00 (WML 1-7-2026: €14,99)
  #   - 32 uur per week × 52 weken = 1664 verloonde uren,
  #     jaarloon €17.472 (1.747.200 eurocent)
  #   (Rechtgezet 2026-10-25: stond op €14,50 per uur, onder het WML en
  #   strijdig met de beloningen in het Wajong-scenario; geen scenariowaarde
  #   gebruikte dat uurloon of jaarloon.)
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
  #     de tegenhanger van WIA art. 35 — zijn wel gemodelleerd; zie de
  #     scenario's onderaan.

  # ────────────────────────────────────────────────────────────────────
  # LDP — Wajong artikel 2:20
  # Werkgever heeft loondispensatie aangevraagd voor Sadee; UWV stelt
  # vast dat haar arbeidsprestatie < minimumloon is.
  # Gekozen waarden: de gebruikelijke beloning voor dit werk is 1500
  # eurocent per uur, net boven het minimumloon per 1 juli 2026 (1499,
  # WML artikel 8 na herziening). De gerechtvaardigde beloning is 70
  # procent daarvan (1050), in lijn met de loonwaarde van 70 procent.
  # Besluit loondispensatie Wajong artikel 1 vraagt alleen dat die ten
  # minste 25 procent lager ligt (grens 1125); de aanspraak zelf volgt uit
  # artikel 3 en hangt niet van de gebruikelijke beloning af.
  Scenario: Sadee komt in aanmerking voor loondispensatie via Wajong art. 2:20
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                               | 999990100 |
      | is_wsw_werknemer                                  | false     |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon | true      |
      | aanvraag_loondispensatie_ingediend                | true      |
      | heeft_recht_op_arbeidsondersteuning_wajong        | true      |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong  | false |
      | loondispensatie_voor_2018_verleend_voor_dezelfde_functie| false |
      | gebruikelijke_beloning_per_uur_eurocent | 1500 |
      | gerechtvaardigde_beloning_per_uur_eurocent | 1050 |
      | verwachte_duur_verminderde_prestatie_maanden | 12 |
      | vastgesteld_aanspraakpercentage_minimumloon | 70 |
    When I evaluate outputs "heeft_recht_op_loondispensatie, beding_lagere_beloning_is_nietig, aanspraak_beloning_per_uur_eurocent" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_loondispensatie" is true
    And output "beding_lagere_beloning_is_nietig" is true
    # Besluit loondispensatie Wajong artikel 3: 70 procent van het minimumloon
    # per uur per 1 juli 2026 (1499 eurocent).
    And output "aanspraak_beloning_per_uur_eurocent" equals 1049.3

  Scenario: Geen loondispensatie als de beloning minder dan 25 procent lager ligt
    # Besluit loondispensatie Wajong artikel 1: de grens is 75 procent van
    # 1500 = 1125 eurocent; een gerechtvaardigde beloning van 1200 (80
    # procent) ligt daarboven. Het oordeel van het UWV alleen is dan niet
    # genoeg.
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                               | 999990100 |
      | is_wsw_werknemer                                  | false     |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon | true      |
      | aanvraag_loondispensatie_ingediend                | true      |
      | heeft_recht_op_arbeidsondersteuning_wajong        | true      |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong  | false |
      | loondispensatie_voor_2018_verleend_voor_dezelfde_functie| false |
      | gebruikelijke_beloning_per_uur_eurocent | 1500 |
      | gerechtvaardigde_beloning_per_uur_eurocent | 1200 |
      | verwachte_duur_verminderde_prestatie_maanden | 12 |
      | vastgesteld_aanspraakpercentage_minimumloon | 70 |
    When I evaluate outputs "heeft_recht_op_loondispensatie" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_loondispensatie" is false

  # ───────────────────────────────────────────────────────────────────
  # JC/WPA — Wajong artikel 2:22
  # Tegenhanger van WIA artikel 35. Sadee valt via lid 4.a buiten de
  # WIA-route; het recht bestaat wel, maar in deze wet. Zonder deze
  # modellering toonde het Financieel CV "geen recht" waar in
  # werkelijkheid een andere route geldt (juristvalidatie 2026-07-23,
  # bevinding 2).
  Scenario: Sadee komt via Wajong art. 2:22 in aanmerking voor jobcoaching en werkplekaanpassing
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                        | 999990100 |
      | is_jonggehandicapte | true      |
      | heeft_arbeidsverhouding_of_voorbereiding   | true      |
      | is_wsw_werknemer                           | false     |
      | aanvraag_jobcoaching_ingediend             | true      |
      | aanvraag_werkplekaanpassing_ingediend      | true      |
      | ondersteuning_is_noodzakelijk_en_compenseert_beperkingen | true |
      | voorziening_is_meeneembaar_en_individueel_afgestemd | true |
    When I evaluate outputs "mag_jobcoaching_toekennen, voldoet_aan_basisvoorwaarden_lid_1, mag_werkplekaanpassing_toekennen" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_basisvoorwaarden_lid_1" is true
    And output "mag_jobcoaching_toekennen" is true
    And output "mag_werkplekaanpassing_toekennen" is true

  # Zonder aanvraag geen voorziening: lid 1 kent uitsluitend "op aanvraag"
  # toe. Beide aanvragen staan los van elkaar — een aanvraag voor
  # jobcoaching levert geen werkplekaanpassing op.
  Scenario: Sadee vraagt alleen jobcoaching aan en krijgt geen werkplekaanpassing
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                        | 999990100 |
      | is_jonggehandicapte | true      |
      | heeft_arbeidsverhouding_of_voorbereiding   | true      |
      | is_wsw_werknemer                           | false     |
      | aanvraag_jobcoaching_ingediend             | true      |
      | aanvraag_werkplekaanpassing_ingediend      | false     |
      | ondersteuning_is_noodzakelijk_en_compenseert_beperkingen | true |
      | voorziening_is_meeneembaar_en_individueel_afgestemd | false |
    When I evaluate outputs "mag_jobcoaching_toekennen, mag_werkplekaanpassing_toekennen" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "mag_jobcoaching_toekennen" is true
    And output "mag_werkplekaanpassing_toekennen" is false

  # Wsw-uitzondering uit lid 1: wie als Wsw-werknemer werkzaam is valt
  # buiten de voorzieningen, ook met een aanvraag en Wajong-recht.
  Scenario: Wsw-werknemer valt buiten Wajong art. 2:22
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                        | 999990100 |
      | is_jonggehandicapte | true      |
      | heeft_arbeidsverhouding_of_voorbereiding   | true      |
      | is_wsw_werknemer                           | true      |
      | aanvraag_jobcoaching_ingediend             | true      |
      | aanvraag_werkplekaanpassing_ingediend      | true      |
      | ondersteuning_is_noodzakelijk_en_compenseert_beperkingen | true |
      | voorziening_is_meeneembaar_en_individueel_afgestemd | true |
    When I evaluate outputs "mag_jobcoaching_toekennen, voldoet_aan_basisvoorwaarden_lid_1, mag_werkplekaanpassing_toekennen" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_basisvoorwaarden_lid_1" is false
    And output "mag_jobcoaching_toekennen" is false
    And output "mag_werkplekaanpassing_toekennen" is false
