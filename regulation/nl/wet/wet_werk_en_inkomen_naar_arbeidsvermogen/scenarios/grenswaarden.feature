Feature: Wet WIA, grenzen van artikel 4, 5 en 23
  Grensscenario's, toegevoegd op 12 oktober 2026 na een mutatietest van de
  modellen: voor elke vergelijking die geen scenario op de grens zelf had,
  staat hier het geval precies op de grens en het geval er net naast.
  Peildatum 1 juli 2026; parameterblokken uit recht_op_uitkering.

  # Artikel 4 lid 1: "ten hoogste 20% van het maatmaninkomen per uur".
  Scenario: Precies 20 procent verdiencapaciteit en duurzaam: volledig en duurzaam arbeidsongeschikt (artikel 4)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990605 |
      | is_verzekerde_wia                                       | true |
      | is_ziek_geworden                                        | true |
      | eerste_dag_wachttijd                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 20 |
      | is_medisch_duurzaam                                     | true |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false |
      | is_rechtens_vrijheid_ontnomen                           | false |
      | onttrekt_zich_aan_vrijheidsstraf                        | false |
      | woont_niet_in_nederland                                 | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false |
      | is_overleden                                            | false |
      | is_uitreiziger                                          | false |
    When I evaluate outputs "is_volledig_en_duurzaam_arbeidsongeschikt, heeft_recht_op_iva_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "is_volledig_en_duurzaam_arbeidsongeschikt" is true
    And output "heeft_recht_op_iva_uitkering" is true

  Scenario: 21 procent verdiencapaciteit is niet volledig arbeidsongeschikt (artikel 4)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990605 |
      | is_verzekerde_wia                                       | true |
      | is_ziek_geworden                                        | true |
      | eerste_dag_wachttijd                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 21 |
      | is_medisch_duurzaam                                     | true |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false |
      | is_rechtens_vrijheid_ontnomen                           | false |
      | onttrekt_zich_aan_vrijheidsstraf                        | false |
      | woont_niet_in_nederland                                 | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false |
      | is_overleden                                            | false |
      | is_uitreiziger                                          | false |
    When I evaluate outputs "is_volledig_en_duurzaam_arbeidsongeschikt, heeft_recht_op_iva_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "is_volledig_en_duurzaam_arbeidsongeschikt" is false
    And output "heeft_recht_op_iva_uitkering" is false

  # Artikel 5: "slechts in staat ten hoogste 65% van het maatmaninkomen per uur te verdienen".
  Scenario: Precies 65 procent verdiencapaciteit is nog gedeeltelijk arbeidsgeschikt (artikel 5)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990606 |
      | is_verzekerde_wia                                       | true |
      | is_ziek_geworden                                        | true |
      | eerste_dag_wachttijd                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 65 |
      | is_medisch_duurzaam                                     | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false |
      | is_rechtens_vrijheid_ontnomen                           | false |
      | onttrekt_zich_aan_vrijheidsstraf                        | false |
      | woont_niet_in_nederland                                 | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false |
      | is_overleden                                            | false |
      | is_uitreiziger                                          | false |
    When I evaluate outputs "is_gedeeltelijk_arbeidsgeschikt, heeft_recht_op_wga_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "is_gedeeltelijk_arbeidsgeschikt" is true
    And output "heeft_recht_op_wga_uitkering" is true

  Scenario: 66 procent verdiencapaciteit is niet gedeeltelijk arbeidsgeschikt (artikel 5)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990606 |
      | is_verzekerde_wia                                       | true |
      | is_ziek_geworden                                        | true |
      | eerste_dag_wachttijd                                    | 2024-03-01 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 66 |
      | is_medisch_duurzaam                                     | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false |
      | is_rechtens_vrijheid_ontnomen                           | false |
      | onttrekt_zich_aan_vrijheidsstraf                        | false |
      | woont_niet_in_nederland                                 | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false |
      | is_overleden                                            | false |
      | is_uitreiziger                                          | false |
    When I evaluate outputs "is_gedeeltelijk_arbeidsgeschikt, heeft_recht_op_wga_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "is_gedeeltelijk_arbeidsgeschikt" is false
    And output "heeft_recht_op_wga_uitkering" is false

  # 104 weken = 728 dagen; de eerste ziektedag 3 juli 2024 geeft 1 juli 2026 als eerste dag na de wachttijd.
  Scenario: De wachttijd van 104 weken is op de laatste dag precies doorlopen (artikel 23)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990607 |
      | is_verzekerde_wia                                       | true |
      | is_ziek_geworden                                        | true |
      | eerste_dag_wachttijd                                    | 2024-07-03 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 50 |
      | is_medisch_duurzaam                                     | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false |
      | is_rechtens_vrijheid_ontnomen                           | false |
      | onttrekt_zich_aan_vrijheidsstraf                        | false |
      | woont_niet_in_nederland                                 | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false |
      | is_overleden                                            | false |
      | is_uitreiziger                                          | false |
    When I evaluate outputs "wachttijd_doorlopen, heeft_recht_op_wga_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "wachttijd_doorlopen" is true
    And output "heeft_recht_op_wga_uitkering" is true

  Scenario: Eén dag later ziek geworden: de wachttijd loopt op de peildatum nog (artikel 23)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                     | 999990607 |
      | is_verzekerde_wia                                       | true |
      | is_ziek_geworden                                        | true |
      | eerste_dag_wachttijd                                    | 2024-07-04 |
      | verdiencapaciteit_percentage_maatmaninkomen             | 50 |
      | is_medisch_duurzaam                                     | false |
      | heeft_recht_op_uitkering_hoofdstuk_6_of_7               | false |
      | ontvangt_wazo_uitkering_wegens_ziekte_door_zwangerschap | false |
      | loondoorbetalings_of_ziekengeldtijdvak_loopt_nog        | false |
      | periode_zonder_ziekengeld_29_lid_11_loopt_nog           | false |
      | is_rechtens_vrijheid_ontnomen                           | false |
      | onttrekt_zich_aan_vrijheidsstraf                        | false |
      | woont_niet_in_nederland                                 | false |
      | heeft_pensioengerechtigde_leeftijd_bereikt              | false |
      | is_overleden                                            | false |
      | is_uitreiziger                                          | false |
    When I evaluate outputs "wachttijd_doorlopen, heeft_recht_op_wga_uitkering" of "wet_werk_en_inkomen_naar_arbeidsvermogen"
    Then the execution succeeds
    And output "wachttijd_doorlopen" is false
    And output "heeft_recht_op_wga_uitkering" is false
