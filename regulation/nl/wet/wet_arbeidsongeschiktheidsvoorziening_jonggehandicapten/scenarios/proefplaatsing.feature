Feature: Proefplaatsing met behoud van arbeidsondersteuning (Wajong art. 2:24)
  Als UWV-uitvoerder
  Wil ik weten of een jonggehandicapte op een proefplaats mag werken en
  wat er met haar arbeidsondersteuning gebeurt
  Zodat het Financieel CV proefplaatsing niet als WW-only instrument toont

  # Toegevoegd 2026-09-02 na juristfeedback op de Koen-en-Sadee-doorloop.
  # Bevinding: proefplaatsing werd alleen aan WW art. 76a getoetst.
  # Wajong art. 2:24 geeft dezelfde zes maanden en woordelijk dezelfde
  # cumulatieve voorwaarden (lid 3 a t/m d), maar regelt in lid 2 iets
  # eigens: zowel het recht op arbeidsondersteuning als de
  # inkomensvoorziening worden niet beeindigd. Zie ook
  # Pwet art. 8a lid 2 onderdeel d, dat op twee maanden uitkomt.

  Scenario: Wajong-gerechtigde mag op proefplaats als lid 3 cumulatief is vervuld
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990100 |
      | heeft_recht_op_arbeidsondersteuning            | true      |
      | in_staat_tot_werkzaamheden                     | true      |
      | aansprakelijkheidsverzekering_aanwezig         | true      |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true      |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true      |
    When I evaluate "mag_proefplaatsing_aangaan" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_lid_3_voorwaarden" is true
    And output "mag_proefplaatsing_aangaan" is true
    And output "max_duur_proefplaatsing_maanden" equals 6

  # Lid 2 is de Wajong-eigen waarborg: de arbeidsondersteuning en de
  # inkomensvoorziening lopen door tijdens de proefplaatsing.
  Scenario: Arbeidsondersteuning loopt door tijdens de proefplaatsing
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990100 |
      | heeft_recht_op_arbeidsondersteuning            | true      |
      | in_staat_tot_werkzaamheden                     | true      |
      | aansprakelijkheidsverzekering_aanwezig         | true      |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true      |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true      |
    When I evaluate "arbeidsondersteuning_blijft_bestaan" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "arbeidsondersteuning_blijft_bestaan" is true

  # Zonder recht op arbeidsondersteuning geen proefplaatsing via deze
  # route; lid 1 maakt dat recht tot ingangsvoorwaarde.
  Scenario: Zonder recht op arbeidsondersteuning geen proefplaatsing via artikel 2:24
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990101 |
      | heeft_recht_op_arbeidsondersteuning            | false     |
      | in_staat_tot_werkzaamheden                     | true      |
      | aansprakelijkheidsverzekering_aanwezig         | true      |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true      |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true      |
    When I evaluate "mag_proefplaatsing_aangaan" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "mag_proefplaatsing_aangaan" is false
    And output "arbeidsondersteuning_blijft_bestaan" is false

  # Lid 3 is cumulatief. Zonder aansprakelijkheidsverzekering van de
  # werkgever (onderdeel b) gaat de proefplaatsing niet door, ongeacht
  # de overige voorwaarden.
  Scenario: Zonder aansprakelijkheidsverzekering van de werkgever geen proefplaatsing
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990100 |
      | heeft_recht_op_arbeidsondersteuning            | true      |
      | in_staat_tot_werkzaamheden                     | true      |
      | aansprakelijkheidsverzekering_aanwezig         | false     |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true      |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true      |
    When I evaluate "mag_proefplaatsing_aangaan" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_lid_3_voorwaarden" is false
    And output "mag_proefplaatsing_aangaan" is false
