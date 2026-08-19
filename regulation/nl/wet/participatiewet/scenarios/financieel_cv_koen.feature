Feature: Financieel CV — werknemer-perspectief, casus Koen
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
  # LKS — Participatiewet artikel 10c + 10d
  # Koen heeft loonwaarde 60% van WML+VB (215500 ec/mnd) = 129300 ec.
  # Bruto subsidie = 215500 - 129300 = 86200 ec.
  # Max 70% van WML+VB = 150850 ec.
  # Voltijdbedrag (36 uur) = MIN(86200, 150850) = 86200 ec (€862/mnd).
  # Koen werkt 32 uur; lid 4 tweede zin vermindert de subsidie naar
  # evenredigheid: 86200 x 32 / 36 = 76622,22 ec (€766,22 per maand).
  #
  # Vóór de juristvalidatie van 2026-07-23 toonde het model hier het
  # 36-uursbedrag; dat was te hoog voor iedereen met een deeltijd-
  # dienstverband.
  #
  # De deling is niet rond: de engine rekent exact en kent geen
  # afrondingsoperatie, dus de assertion draagt decimalen (zie de
  # untranslatable over afronding). De presentatielaag rondt af.
  #
  # Werknemer-relevantie: Koen weet dat de gemeente per maand €766,22 aan
  # zijn werkgever betaalt om hem het WML-loon te kunnen geven.
  #
  # NB: WML+VB-waarde 215500 is 2025-cijfer; voor exacte 2026-cijfers
  # moet deze input worden geüpdatet uit officiële bron.
  Scenario: Gemeente betaalt €766,22 per maand LKS aan werkgever van Koen (32 uur)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                | 999990101 |
      | behoort_tot_doelgroep_lks                          | true      |
      | kan_minimumloon_niet_verdienen                     | true      |
      | aanvraag_lks_ingediend_binnen_zes_maanden          | true      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep  | true      |
      | is_wsw_dienstbetrekking                            | false     |
      | loonwaarde_eurocent_per_maand                      | 129300    |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand | 215500   |
      | overeengekomen_arbeidsduur_uren_per_week           | 32        |
    When I evaluate "heeft_recht_op_lks" of "participatiewet"
    Then the execution succeeds
    And output "heeft_recht_op_lks" is true
    And output "bruto_subsidie_eurocent_per_maand" equals 86200
    And output "maximum_subsidie_eurocent_per_maand" equals 150850
    And output "hoogte_lks_voltijd_eurocent_per_maand" equals 86200
    And output "hoogte_lks_eurocent_per_maand" equals 76622.222222222

  # Voltijd: 36 uur laat het bedrag ongemoeid — de evenredigheidsfactor
  # is dan 1. Dit scenario bewaakt dat de correctie geen bedrag afsnoept
  # bij een volledige dienstbetrekking.
  Scenario: Bij 36 uur blijft de LKS gelijk aan het voltijdbedrag
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                | 999990101 |
      | behoort_tot_doelgroep_lks                          | true      |
      | kan_minimumloon_niet_verdienen                     | true      |
      | aanvraag_lks_ingediend_binnen_zes_maanden          | true      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep  | true      |
      | is_wsw_dienstbetrekking                            | false     |
      | loonwaarde_eurocent_per_maand                      | 129300    |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand | 215500   |
      | overeengekomen_arbeidsduur_uren_per_week           | 36        |
    When I evaluate "heeft_recht_op_lks" of "participatiewet"
    Then the execution succeeds
    And output "hoogte_lks_eurocent_per_maand" equals 86200

  # Lid 4 spreekt van verminderen "of vermeerderen": boven 36 uur gaat
  # het bedrag omhoog. 40 uur is geen deler-vriendelijk getal, 27 wel —
  # 86200 x 27 / 36 = 64650. Drie kwart dienstverband, drie kwart
  # subsidie.
  Scenario: Bij 27 uur is de LKS drie kwart van het voltijdbedrag
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                | 999990101 |
      | behoort_tot_doelgroep_lks                          | true      |
      | kan_minimumloon_niet_verdienen                     | true      |
      | aanvraag_lks_ingediend_binnen_zes_maanden          | true      |
      | voorafgaand_relevante_onderwijsroute_of_doelgroep  | true      |
      | is_wsw_dienstbetrekking                            | false     |
      | loonwaarde_eurocent_per_maand                      | 129300    |
      | minimumloon_plus_vakantiebijslag_eurocent_per_maand | 215500   |
      | overeengekomen_arbeidsduur_uren_per_week           | 27        |
    When I evaluate "heeft_recht_op_lks" of "participatiewet"
    Then the execution succeeds
    And output "hoogte_lks_voltijd_eurocent_per_maand" equals 86200
    And output "hoogte_lks_eurocent_per_maand" equals 64650

  # ────────────────────────────────────────────────────────────────────
  # OPEN: Samenloop LKS ↔ LKV (Pwet 10d lid 9)
  #
  # Engine geeft onafhankelijk "recht = true" voor zowel LKS (gemeente,
  # €766,22/mnd) als LKV-banenafspraak (Belastingdienst, €1.680/jaar).
  # Pwet 10d lid 9 bevat een samenloopverbod tussen LKS en bepaalde
  # andere subsidies — moet door aggregator-laag worden uitgerekend.
  #
  # Wanneer de aggregator er is, komt hier een Scenario dat asserteert
  # of LKS en LKV-banenafspraak tegelijk uitgekeerd mogen worden.
