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
  #     de tegenhanger van WIA art. 35 — zijn gemodelleerd; de scenario's
  #     staan in het Wajong-bestand.

  # ────────────────────────────────────────────────────────────────────
  # PP — WW artikel 76a
  # Sadee heeft geen WW-uitkering (komt uit Wajong), dus deze route is
  # niet van toepassing.
  #
  # GECORRIGEERD 2026-10-25, zoals bij Koen op 2026-09-02 na
  # juristfeedback: hier stond dat proefplaatsing "een WW-instrument" is,
  # "niet beschikbaar voor Wajongers". Dat is onjuist — proefplaatsing
  # staat in vier wetten, met verschillende kaders:
  #
  #   WW art. 76a       — 6 maanden, WW-uitkering loopt door
  #   Wet WIA art. 37   — 6 maanden, sollicitatieplicht opgeschort
  #   Wajong art. 2:24  — 6 maanden, arbeidsondersteuning loopt door
  #   Pwet art. 8a.2.d  — 2 maanden, verlengbaar met maximaal 4
  #
  # Werkgever-relevantie: een proefplaatsing met Sadee loopt via de Wajong
  # (art. 2:24), niet via de WW.
  Scenario: Sadee mag geen proefplaatsing aangaan zonder WW-uitkering
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990100 |
      | heeft_recht_op_ww_uitkering                    | false     |
      | in_staat_tot_werkzaamheden                     | true      |
      | aansprakelijkheidsverzekering_aanwezig         | true      |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true      |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true      |
      | einddatum_uitkeringsduur_hoofdstuk_ii | null |
      | dagen_ziekte_onderbreking_proefplaatsing | 0 |
      | datum_aanvang_proefplaatsing | null |
      | uwv_heeft_toestemming_verleend                 | false |
    When I evaluate outputs "uwv_mag_toestemming_verlenen, ww_uitkering_blijft_bestaan" of "werkloosheidswet"
    Then the execution succeeds
    And output "uwv_mag_toestemming_verlenen" is false
    And output "ww_uitkering_blijft_bestaan" is false
