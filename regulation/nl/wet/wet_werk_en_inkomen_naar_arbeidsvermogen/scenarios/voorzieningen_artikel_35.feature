Feature: Voorzieningen op grond van Wet WIA artikel 35, met het drempelbedrag
  Als UWV-uitvoerder
  Wil ik weten of een voorziening op grond van artikel 35 kan worden toegekend
  Zodat het Financieel CV ook de route toont voor wie niet uit de Participatiewet
  of de Wajong komt

  # Toegevoegd 2026-09-28. De twee persona's van het dossier, Koen en Sadee,
  # vallen beide buiten artikel 35: Koen via lid 4 onderdeel b omdat het college
  # voor zijn arbeidsinschakeling zorg draagt, Sadee via onderdeel a omdat zij
  # recht heeft op arbeidsondersteuning. Het gevolg was dat de materiële eisen
  # van lid 2 en het drempelbedrag van Reintegratiebesluit artikel 3 in geen
  # enkel scenario werden geraakt: het model had ze wel, de suite niet.
  #
  # Deze scenario's gaan over een WGA-gerechtigde die rechtstreeks bij het UWV
  # aanklopt. Geen Wajong, geen ondersteuning door het college, dus artikel 35
  # staat open. Daarmee worden drie dingen voor het eerst getoetst: dat de
  # bevoegdheid van lid 1 een kan-bepaling is, dat de materiële eisen van lid 2
  # onderdeel c en d meedoen, en dat de drempel van 1,85 maal het minimumloon
  # gedeeld door 21,75 de verlening tegenhoudt.
  #
  # Het drempelbedrag voor kalenderjaar 2026 is 1,85 x 229440 / 21,75 =
  # 19515,59 eurocent, dus € 195,16. Het minimumloon dat daarin staat is de
  # stand per 1 januari 2026 en niet die per 1 juli; zie de marking bij
  # Reintegratiebesluit artikel 3.

  Scenario: Boven het drempelbedrag kan het UWV de voorziening toekennen
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                      | 999990400 |
      | heeft_structurele_functionele_beperking                  | true      |
      | heeft_arbeidsverhouding_of_voorbereiding                 | true      |
      | is_wsw_werknemer                                         | false     |
      | heeft_recht_op_arbeidsondersteuning_wajong               | false     |
      | pwet_college_draagt_zorg_uitsluiting                     | false     |
      | aanvraag_jobcoaching_ingediend                            | true      |
      | aanvraag_werkplekaanpassing_ingediend                     | true      |
      | ondersteuning_is_noodzakelijk_en_compenseert_beperkingen  | true      |
      | voorziening_is_meeneembaar_en_individueel_afgestemd       | true      |
      | kosten_voorziening_eurocent                               | 250000    |
      | gezamenlijke_waarde_voorzieningen_kalenderjaar_eurocent    | 250000    |
    When I evaluate outputs "mag_werkplekaanpassing_toekennen, artikel_35_van_toepassing, voldoet_aan_basisvoorwaarden_lid_1, mag_jobcoaching_toekennen" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "artikel_35_van_toepassing" is true
    And output "voldoet_aan_basisvoorwaarden_lid_1" is true
    And output "mag_jobcoaching_toekennen" is true
    And output "mag_werkplekaanpassing_toekennen" is true

  # Onder de drempel blijft artikel 35 van toepassing en blijven de
  # basisvoorwaarden vervuld; wat wegvalt is de verlening zelf.
  Scenario: Onder het drempelbedrag wordt de voorziening niet verleend
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                      | 999990400 |
      | heeft_structurele_functionele_beperking                  | true      |
      | heeft_arbeidsverhouding_of_voorbereiding                 | true      |
      | is_wsw_werknemer                                         | false     |
      | heeft_recht_op_arbeidsondersteuning_wajong               | false     |
      | pwet_college_draagt_zorg_uitsluiting                     | false     |
      | aanvraag_jobcoaching_ingediend                            | true      |
      | aanvraag_werkplekaanpassing_ingediend                     | true      |
      | ondersteuning_is_noodzakelijk_en_compenseert_beperkingen  | true      |
      | voorziening_is_meeneembaar_en_individueel_afgestemd       | true      |
      | kosten_voorziening_eurocent                               | 15000     |
      | gezamenlijke_waarde_voorzieningen_kalenderjaar_eurocent    | 15000     |
    When I evaluate outputs "mag_werkplekaanpassing_toekennen, artikel_35_van_toepassing, voldoet_aan_basisvoorwaarden_lid_1, mag_jobcoaching_toekennen" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "artikel_35_van_toepassing" is true
    And output "voldoet_aan_basisvoorwaarden_lid_1" is true
    And output "mag_jobcoaching_toekennen" is false
    And output "mag_werkplekaanpassing_toekennen" is false

  # De drempel is "minder bedragen dan", dus precies op het bedrag valt de
  # voorziening er nog binnen. 19516 eurocent ligt net boven 19515,59.
  Scenario: Precies boven de drempel valt de voorziening er nog binnen
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                      | 999990400 |
      | heeft_structurele_functionele_beperking                  | true      |
      | heeft_arbeidsverhouding_of_voorbereiding                 | true      |
      | is_wsw_werknemer                                         | false     |
      | heeft_recht_op_arbeidsondersteuning_wajong               | false     |
      | pwet_college_draagt_zorg_uitsluiting                     | false     |
      | aanvraag_jobcoaching_ingediend                            | true      |
      | aanvraag_werkplekaanpassing_ingediend                     | true      |
      | ondersteuning_is_noodzakelijk_en_compenseert_beperkingen  | true      |
      | voorziening_is_meeneembaar_en_individueel_afgestemd       | true      |
      | kosten_voorziening_eurocent                               | 19516     |
      | gezamenlijke_waarde_voorzieningen_kalenderjaar_eurocent    | 19516     |
    When I evaluate "mag_werkplekaanpassing_toekennen" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "mag_werkplekaanpassing_toekennen" is true

  # De materiële eisen van lid 2 doen zelfstandig mee: valt de voorziening niet
  # onder onderdeel c, dan blijft de aanvraag zonder gevolg, ook boven de
  # drempel. Lid 2 opent met "worden uitsluitend verstaan".
  Scenario: Zonder de materiele eis van lid 2 onderdeel c geen werkplekaanpassing
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                      | 999990400 |
      | heeft_structurele_functionele_beperking                  | true      |
      | heeft_arbeidsverhouding_of_voorbereiding                 | true      |
      | is_wsw_werknemer                                         | false     |
      | heeft_recht_op_arbeidsondersteuning_wajong               | false     |
      | pwet_college_draagt_zorg_uitsluiting                     | false     |
      | aanvraag_jobcoaching_ingediend                            | true      |
      | aanvraag_werkplekaanpassing_ingediend                     | true      |
      | ondersteuning_is_noodzakelijk_en_compenseert_beperkingen  | true      |
      | voorziening_is_meeneembaar_en_individueel_afgestemd       | false     |
      | kosten_voorziening_eurocent                               | 250000    |
      | gezamenlijke_waarde_voorzieningen_kalenderjaar_eurocent    | 250000    |
    When I evaluate outputs "mag_werkplekaanpassing_toekennen, mag_jobcoaching_toekennen" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "mag_jobcoaching_toekennen" is true
    And output "mag_werkplekaanpassing_toekennen" is false
