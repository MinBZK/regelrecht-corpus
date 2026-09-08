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
  # JC + WPA — Wet WIA artikel 35
  # KEY INSIGHT: lid 4.b sluit ook de Participatiewet uit. Koen ontvangt
  # algemene bijstand en is via de gemeente in dienst gekomen, dus het
  # college draagt op grond van Pwet art. 7 lid 1 onderdeel a zorg voor
  # zijn ondersteuning bij arbeidsinschakeling. De uitsluiting duurt
  # voort tot hij twee aaneengesloten jaren ten minste het minimumloon
  # verdient zonder loonkostensubsidie — Koen zit met een loonwaarde van
  # 60% en lopende LKS ver van die grens af.
  #
  # Tot 2026-09-02 stond dit scenario op
  # pwet_college_draagt_zorg_uitsluiting = false en concludeerde het dat
  # Koen jobcoaching en werkplekaanpassing bij UWV kon aanvragen. Dat was
  # onjuist: de SZW-jurist wees erop dat lid 4.b hem juist uitsluit.
  #
  # Werknemer-relevantie: Koen kan JC en WPA NIET bij UWV aanvragen. De
  # route loopt via de gemeente — Pwet art. 10 lid 1 (persoonlijke
  # ondersteuning en noodzakelijke voorziening) en art. 10da (aanspraak
  # op begeleiding op de werkplek voor de LKS-doelgroep). Zie de
  # scenario's in het Participatiewet-bestand. Dezelfde vorm als de
  # WIA/Wajong-splitsing bij Sadee: geen ander recht, een andere
  # vindplaats.
  Scenario: Koen valt buiten WIA artikel 35 voor JC en WPA (lid 4.b Participatiewet)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                        | 999990101 |
      | heeft_structurele_functionele_beperking    | true      |
      | heeft_arbeidsverhouding_of_voorbereiding   | true      |
      | is_wsw_werknemer                           | false     |
      | heeft_recht_op_arbeidsondersteuning_wajong | false     |
      | pwet_college_draagt_zorg_uitsluiting       | true      |
      | aanvraag_jobcoaching_ingediend             | true      |
      | aanvraag_werkplekaanpassing_ingediend      | true      |
    When I evaluate "artikel_35_van_toepassing" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "artikel_35_van_toepassing" is false
    And output "heeft_recht_op_jobcoaching" is false
    And output "heeft_recht_op_werkplekaanpassing" is false

  # Spiegelscenario: is de tweejaarsgrens van lid 4.b eenmaal gepasseerd
  # — twee aaneengesloten jaren minimumloon zonder LKS — dan vervalt de
  # college-zorg en komt Koen alsnog bij UWV terecht. Dit scenario
  # bewaakt dat de uitsluiting niet permanent is gemodelleerd.
  Scenario: Na twee jaar minimumloon zonder LKS kan Koen wel bij UWV terecht
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                        | 999990101 |
      | heeft_structurele_functionele_beperking    | true      |
      | heeft_arbeidsverhouding_of_voorbereiding   | true      |
      | is_wsw_werknemer                           | false     |
      | heeft_recht_op_arbeidsondersteuning_wajong | false     |
      | pwet_college_draagt_zorg_uitsluiting       | false     |
      | aanvraag_jobcoaching_ingediend             | true      |
      | aanvraag_werkplekaanpassing_ingediend      | true      |
    When I evaluate "artikel_35_van_toepassing" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "artikel_35_van_toepassing" is true
    And output "heeft_recht_op_jobcoaching" is true
    And output "heeft_recht_op_werkplekaanpassing" is true
