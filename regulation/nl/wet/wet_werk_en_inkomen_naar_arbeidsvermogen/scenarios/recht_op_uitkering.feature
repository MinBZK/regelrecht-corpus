Feature: Wet WIA, recht op uitkering (artikel 47 en 54)
  Als afnemende wet (Ziektewet 29b)
  Wil ik bij de Wet WIA kunnen opvragen of iemand recht heeft op een
  IVA- of WGA-uitkering
  Zodat het begrip "uitkering op grond van de Wet WIA" één vindplaats heeft

  # Artikel 47 (IVA) en 54 (WGA) zijn cumulatief: verzekerde die ziek
  # wordt, wachttijd doorlopen (artikel 23), volledig en duurzaam (4)
  # respectievelijk gedeeltelijk arbeidsgeschikt (5), geen
  # uitsluitingsgrond (43). De wachttijd wordt berekend: 104 weken vanaf de
  # eerste ziektedag. De mate van arbeidsongeschiktheid komt als resterende
  # verdiencapaciteit binnen (het UWV-oordeel); de drempels van 20% en 65%
  # staan in de wet.
  #
  # Persona in deze scenario's: Fatma, 51, ziek geworden op 1 maart 2024.
  # Op de peildatum (1 juli 2026) is de wachttijd van 104 weken (tot 27
  # februari 2026) verstreken.

  Scenario: Volledig en duurzaam arbeidsongeschikt na de wachttijd geeft recht op IVA
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990200  |
      | is_verzekerde_wia                                       | true       |
      | is_ziek_geworden                                        | true       |
      | eerste_dag_wachttijd                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 15         |
      | is_medisch_duurzaam                                     | true       |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false      |
      | is_rechtens_vrijheid_ontnomen                           | false      |
      | onttrekt_zich_aan_vrijheidsstraf                        | false      |
      | woont_niet_in_nederland                                 | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false      |
      | is_overleden                                            | false      |
      | is_uitreiziger                                          | false      |
    When I evaluate "heeft_recht_op_iva_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "heeft_recht_op_iva_uitkering" is true

  Scenario: Gedeeltelijk arbeidsgeschikt na de wachttijd geeft recht op WGA, niet op IVA
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990200  |
      | is_verzekerde_wia                                       | true       |
      | is_ziek_geworden                                        | true       |
      | eerste_dag_wachttijd                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 50         |
      | is_medisch_duurzaam                                     | false      |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false      |
      | is_rechtens_vrijheid_ontnomen                           | false      |
      | onttrekt_zich_aan_vrijheidsstraf                        | false      |
      | woont_niet_in_nederland                                 | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false      |
      | is_overleden                                            | false      |
      | is_uitreiziger                                          | false      |
    When I evaluate "heeft_recht_op_wga_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "heeft_recht_op_wga_uitkering" is true

  Scenario: Minder dan 35% arbeidsongeschikt geeft geen recht op WGA
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990200  |
      | is_verzekerde_wia                                       | true       |
      | is_ziek_geworden                                        | true       |
      | eerste_dag_wachttijd                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 70         |
      | is_medisch_duurzaam                                     | false      |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false      |
      | is_rechtens_vrijheid_ontnomen                           | false      |
      | onttrekt_zich_aan_vrijheidsstraf                        | false      |
      | woont_niet_in_nederland                                 | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false      |
      | is_overleden                                            | false      |
      | is_uitreiziger                                          | false      |
    When I evaluate "heeft_recht_op_wga_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "heeft_recht_op_wga_uitkering" is false

  Scenario: Zolang de wachttijd loopt bestaat geen recht op WGA
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990200  |
      | is_verzekerde_wia                                       | true       |
      | is_ziek_geworden                                        | true       |
      | eerste_dag_wachttijd                                    | 2025-01-06 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 50         |
      | is_medisch_duurzaam                                     | false      |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false      |
      | is_rechtens_vrijheid_ontnomen                           | false      |
      | onttrekt_zich_aan_vrijheidsstraf                        | false      |
      | woont_niet_in_nederland                                 | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false      |
      | is_overleden                                            | false      |
      | is_uitreiziger                                          | false      |
    When I evaluate "heeft_recht_op_wga_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "heeft_recht_op_wga_uitkering" is false

  Scenario: Een uitsluitingsgrond van artikel 43 sluit het recht op WGA uit
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990200  |
      | is_verzekerde_wia                                       | true       |
      | is_ziek_geworden                                        | true       |
      | eerste_dag_wachttijd                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 50         |
      | is_medisch_duurzaam                                     | false      |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false      |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false      |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false      |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false      |
      | is_rechtens_vrijheid_ontnomen                           | true       |
      | onttrekt_zich_aan_vrijheidsstraf                        | false      |
      | woont_niet_in_nederland                                 | false      |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false      |
      | is_overleden                                            | false      |
      | is_uitreiziger                                          | false      |
    When I evaluate "heeft_recht_op_wga_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "heeft_recht_op_wga_uitkering" is false

  Scenario: De wachttijd van 104 weken wordt berekend vanaf de eerste ziektedag
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                  | 999990200  |
      | is_ziek_geworden     | true       |
      | eerste_dag_wachttijd | 2024-03-01 |
    When I evaluate "wachttijd_doorlopen" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "wachttijd_einddatum" equals "2026-02-27"
    And output "wachttijd_doorlopen" is true

  Scenario: Wie niet ziek is geworden heeft geen wachttijd doorlopen
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn              | 999990200 |
      | is_ziek_geworden | false     |
    When I evaluate "wachttijd_doorlopen" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "wachttijd_doorlopen" is false
