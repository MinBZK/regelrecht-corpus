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

  # ────────────────────────────────────────────────────────────────────
  # LKS — Participatiewet artikel 10c + 10d
  # Sadee zit niet in de Pwet-doelgroep (zij heeft Wajong, geen
  # bijstand). LKS is een gemeente-instrument voor Pwet-doelgroep met
  # loonwaarde < 100%, dus niet van toepassing.
  Scenario: Sadee komt niet in aanmerking voor LKS — geen Pwet-doelgroep
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                 | 999990100 |
      | behoort_tot_doelgroep_lks                           | false     |
      | kan_minimumloon_niet_verdienen                      | true      |
      | aanvraag_lks_ingediend_binnen_zes_maanden           | true      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep   | true      |
      | is_wsw_dienstbetrekking                             | false     |
      | loonwaarde_eurocent_per_maand                       | 150850    |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand | 215500    |
      | overeengekomen_arbeidsduur_uren_per_week            | 32        |
    When I evaluate "heeft_recht_op_lks" of "participatiewet"
    Then the execution succeeds
    And output "heeft_recht_op_lks" is false
    And output "hoogte_lks_voltijd_eurocent_per_maand" equals 0
    And output "hoogte_lks_eurocent_per_maand" equals 0
