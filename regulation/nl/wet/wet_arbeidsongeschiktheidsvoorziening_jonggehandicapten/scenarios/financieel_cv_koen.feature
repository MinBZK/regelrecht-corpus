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
  # LDP — Wajong artikel 2:20
  # Koen heeft geen Wajong-status (komt uit Pwet) → loondispensatie via
  # Wajong is niet aan de orde. Werknemer-relevantie: zekerheid dat werk-
  # gever niet via deze route minder dan WML mag betalen.
  # Bijgewerkt 2026-10-25: de beloningen volgen Koens profiel (gebruikelijk
  # €15,00, gerechtvaardigd 60% = €9,00, aanspraakpercentage 60) in plaats van
  # 1450/1000/70. De rij minimumloon_per_uur_eurocent is geschrapt: de Wajong
  # leest die niet; het Besluit haalt het minimumloon uit de Wet minimumloon.
  # De uitkomst hangt alleen af van de ontbrekende Wajong-status.
  Scenario: Koen heeft geen recht op loondispensatie, want geen Wajong-status
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                               | 999990101 |
      | is_wsw_werknemer                                  | false     |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon | true      |
      | aanvraag_loondispensatie_ingediend                | false     |
      | heeft_recht_op_arbeidsondersteuning_wajong        | false     |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong  | false |
      | loondispensatie_voor_2018_verleend_voor_dezelfde_functie| false |
      | gebruikelijke_beloning_per_uur_eurocent | 1500 |
      | gerechtvaardigde_beloning_per_uur_eurocent | 900 |
      | verwachte_duur_verminderde_prestatie_maanden | 12 |
      | vastgesteld_aanspraakpercentage_minimumloon | 60 |
    When I evaluate "heeft_recht_op_loondispensatie" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_loondispensatie" is false
