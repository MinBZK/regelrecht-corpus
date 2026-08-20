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
  Scenario: Sadee krijgt LKV-banenafspraak — Wajong valt in die categorie
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                          | 999990100 |
      | verloonde_uren                               | 1664      |
      | is_arbeidsgehandicapte_werknemer             | false     |
      | is_herplaatsen_arbeidsgehandicapte           | false     |
      | is_doelgroep_banenafspraak                   | true      |
      | heeft_pensioengerechtigde_leeftijd_bereikt   | false     |
      | heeft_loonaangifte_verzoek_ingediend         | true      |
    When I evaluate "heeft_recht_op_lkv" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "heeft_recht_op_lkv" is true
    And output "categorie_lkv" equals "banenafspraak"
    And output "tegemoetkoming_banenafspraak_eurocent" equals 168064
    And output "hoogte_lkv_per_jaar_eurocent" equals 168064
