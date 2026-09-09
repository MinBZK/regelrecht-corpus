Feature: Financieel CV, werknemer-perspectief, casus Koen
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
  # PP — WW artikel 76a
  # Koen heeft geen WW-uitkering (komt uit Pwet), dus deze route is niet
  # van toepassing.
  #
  # GECORRIGEERD 2026-09-02 na juristfeedback: hier stond dat
  # proefplaatsing "een WW-instrument" is en dat voor de Pwet "een ander
  # re-integratie-traject" geldt. Dat is onjuist — proefplaatsing staat
  # in vier wetten, met verschillende kaders:
  #
  #   WW art. 76a       — 6 maanden, WW-uitkering loopt door
  #   Wet WIA art. 37   — 6 maanden, sollicitatieplicht opgeschort
  #   Wajong art. 2:24  — 6 maanden, arbeidsondersteuning loopt door
  #   Pwet art. 8a.2.d  — 2 maanden, verlengbaar met maximaal 4
  #
  # Werknemer-relevantie: Koen kan wél op een proefplaats, maar via de
  # gemeente en in beginsel twee maanden in plaats van zes. Zie
  # participatiewet/scenarios/proefplaatsing.feature.
  Scenario: Koen kan geen proefplaatsing met behoud van uitkering aangaan zonder WW
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990101 |
      | heeft_recht_op_ww_uitkering                    | false     |
      | in_staat_tot_werkzaamheden                     | true      |
      | aansprakelijkheidsverzekering_aanwezig         | true      |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true      |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true      |
    When I evaluate "mag_proefplaatsing_aangaan" of "werkloosheidswet"
    Then the execution succeeds
    And output "mag_proefplaatsing_aangaan" is false
    And output "ww_uitkering_blijft_bestaan" is false
