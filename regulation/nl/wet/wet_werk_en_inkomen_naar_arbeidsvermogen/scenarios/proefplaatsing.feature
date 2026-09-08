Feature: Proefplaatsing met behoud van WIA-uitkering (Wet WIA art. 37)
  Als UWV-uitvoerder of eigenrisicodrager
  Wil ik weten of een gedeeltelijk arbeidsgeschikte op een proefplaats
  mag werken en wat dat voor zijn verplichtingen betekent
  Zodat het Financieel CV proefplaatsing niet als WW-only instrument toont

  # Toegevoegd 2026-09-02 na juristfeedback op de Koen-en-Sadee-doorloop.
  # Bevinding: proefplaatsing werd alleen aan WW art. 76a getoetst,
  # terwijl de figuur ook in Wet WIA art. 37, Wajong art. 2:24 en Pwet
  # art. 8a lid 2 onderdeel d staat. De voorwaarden van lid 2 zijn
  # woordelijk gelijk aan WW art. 76a lid 3 en Wajong art. 2:24 lid 3;
  # de duur is met zes maanden ook gelijk. Het verschil zit elders:
  #
  #   - lid 1 belegt de toestemming bij UWV *of* de eigenrisicodrager,
  #     zonder criterium om te bepalen wie beslist
  #   - lid 4 schort de plicht om passende arbeid te verkrijgen op
  #     (art. 30 lid 1 onderdeel b), waar de WW het uitkeringsrecht
  #     laat doorlopen en de Wajong de arbeidsondersteuning

  Scenario: WIA-gerechtigde mag op proefplaats als lid 2 cumulatief is vervuld
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990100 |
      | heeft_recht_op_wia_uitkering                   | true      |
      | in_staat_tot_werkzaamheden                     | true      |
      | aansprakelijkheidsverzekering_aanwezig         | true      |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true      |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true      |
    When I evaluate "mag_proefplaatsing_aangaan" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "voldoet_aan_lid_2_voorwaarden" is true
    And output "mag_proefplaatsing_aangaan" is true
    And output "max_duur_proefplaatsing_maanden" equals 6

  # Lid 4: gedurende de proefplaatsing vervalt de plicht passende arbeid
  # te verkrijgen. Dat is de WIA-eigen tegenprestatie voor het onbeloond
  # werken — de WW regelt op deze plaats het uitkeringsrecht, de Wajong
  # de arbeidsondersteuning.
  Scenario: Tijdens de proefplaatsing is de sollicitatieplicht opgeschort
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990100 |
      | heeft_recht_op_wia_uitkering                   | true      |
      | in_staat_tot_werkzaamheden                     | true      |
      | aansprakelijkheidsverzekering_aanwezig         | true      |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true      |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true      |
    When I evaluate "sollicitatieplicht_opgeschort" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "sollicitatieplicht_opgeschort" is true

  # Zonder WIA-recht geen proefplaatsing via deze route. Voor wie uit de
  # WIA is gestroomd naar gemeentelijke ondersteuning (art. 35 lid 4.b,
  # Pwet art. 7 lid 1 a) loopt de proefplaatsing via Pwet art. 8a lid 2
  # onderdeel d, met een termijn van twee maanden in plaats van zes.
  Scenario: Zonder WIA-recht geen proefplaatsing via artikel 37
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990101 |
      | heeft_recht_op_wia_uitkering                   | false     |
      | in_staat_tot_werkzaamheden                     | true      |
      | aansprakelijkheidsverzekering_aanwezig         | true      |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true      |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true      |
    When I evaluate "mag_proefplaatsing_aangaan" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "mag_proefplaatsing_aangaan" is false
    And output "sollicitatieplicht_opgeschort" is false

  # Lid 2 is cumulatief: één ontbrekende voorwaarde blokkeert de
  # proefplaatsing. Herhaling bij dezelfde werkgever (onderdeel c) is de
  # meest voorkomende afwijzingsgrond in de uitvoering.
  Scenario: Eerdere proefplaatsing bij dezelfde werkgever blokkeert een tweede
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990100 |
      | heeft_recht_op_wia_uitkering                   | true      |
      | in_staat_tot_werkzaamheden                     | true      |
      | aansprakelijkheidsverzekering_aanwezig         | true      |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | false     |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true      |
    When I evaluate "mag_proefplaatsing_aangaan" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "voldoet_aan_lid_2_voorwaarden" is false
    And output "mag_proefplaatsing_aangaan" is false
