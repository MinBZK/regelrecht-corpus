Feature: Financieel CV — werkgever-perspectief, casus Sadee
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
  #     de tegenhanger van WIA art. 35 — zijn wel gemodelleerd; zie de
  #     scenario's onderaan.

  # ────────────────────────────────────────────────────────────────────
  # LDP — Wajong artikel 2:20
  # Werkgever heeft loondispensatie aangevraagd voor Sadee; UWV stelt
  # vast dat haar arbeidsprestatie < minimumloon is.
  Scenario: Sadee komt in aanmerking voor loondispensatie via Wajong art. 2:20
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                               | 999990100 |
      | is_wsw_werknemer                                  | false     |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon | true      |
      | aanvraag_loondispensatie_ingediend                | true      |
      | heeft_recht_op_arbeidsondersteuning_wajong        | true      |
    When I evaluate "heeft_recht_op_loondispensatie" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_loondispensatie" is true
    And output "beding_lagere_beloning_is_nietig" is true

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
      | heeft_recht_op_arbeidsondersteuning_wajong | true      |
      | heeft_arbeidsverhouding_of_voorbereiding   | true      |
      | is_wsw_werknemer                           | false     |
      | aanvraag_jobcoaching_ingediend             | true      |
      | aanvraag_werkplekaanpassing_ingediend      | true      |
    When I evaluate "heeft_recht_op_jobcoaching" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_basisvoorwaarden_lid_1" is true
    And output "heeft_recht_op_jobcoaching" is true
    And output "heeft_recht_op_werkplekaanpassing" is true

  # Zonder aanvraag geen voorziening: lid 1 kent uitsluitend "op aanvraag"
  # toe. Beide aanvragen staan los van elkaar — een aanvraag voor
  # jobcoaching levert geen werkplekaanpassing op.
  Scenario: Sadee vraagt alleen jobcoaching aan — geen werkplekaanpassing
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                        | 999990100 |
      | heeft_recht_op_arbeidsondersteuning_wajong | true      |
      | heeft_arbeidsverhouding_of_voorbereiding   | true      |
      | is_wsw_werknemer                           | false     |
      | aanvraag_jobcoaching_ingediend             | true      |
      | aanvraag_werkplekaanpassing_ingediend      | false     |
    When I evaluate "heeft_recht_op_jobcoaching" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_jobcoaching" is true
    And output "heeft_recht_op_werkplekaanpassing" is false

  # Wsw-uitzondering uit lid 1: wie als Wsw-werknemer werkzaam is valt
  # buiten de voorzieningen, ook met een aanvraag en Wajong-recht.
  Scenario: Wsw-werknemer valt buiten Wajong art. 2:22
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                        | 999990100 |
      | heeft_recht_op_arbeidsondersteuning_wajong | true      |
      | heeft_arbeidsverhouding_of_voorbereiding   | true      |
      | is_wsw_werknemer                           | true      |
      | aanvraag_jobcoaching_ingediend             | true      |
      | aanvraag_werkplekaanpassing_ingediend      | true      |
    When I evaluate "heeft_recht_op_jobcoaching" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_basisvoorwaarden_lid_1" is false
    And output "heeft_recht_op_jobcoaching" is false
    And output "heeft_recht_op_werkplekaanpassing" is false
