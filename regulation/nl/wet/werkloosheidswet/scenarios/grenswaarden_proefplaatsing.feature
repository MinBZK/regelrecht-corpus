Feature: Werkloosheidswet 76a, de einddatum van de uitkeringsduur
  Grensscenario's, toegevoegd op 12 oktober 2026 na een mutatietest van de
  modellen: voor elke vergelijking die geen scenario op de grens zelf had,
  staat hier het geval precies op de grens en het geval er net naast.
  Peildatum 1 juli 2026; parameterblok uit financieel_cv_koen.

  Scenario: Op de einddatum van de uitkeringsduur zelf is de duur verstreken (76a lid 1 b)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990617 |
      | heeft_recht_op_ww_uitkering                    | true |
      | in_staat_tot_werkzaamheden                     | true |
      | aansprakelijkheidsverzekering_aanwezig         | true |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true |
      | einddatum_uitkeringsduur_hoofdstuk_ii          | 2026-07-01 |
      | dagen_ziekte_onderbreking_proefplaatsing       | 0 |
      | datum_aanvang_proefplaatsing                   | null |
    When I evaluate outputs "uitkeringsduur_hoofdstuk_ii_is_verstreken" of "werkloosheidswet"
    Then the execution succeeds
    And output "uitkeringsduur_hoofdstuk_ii_is_verstreken" is true

  Scenario: Eén dag vóór de einddatum van de uitkeringsduur is de duur nog niet verstreken (76a lid 1 b)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990617 |
      | heeft_recht_op_ww_uitkering                    | true |
      | in_staat_tot_werkzaamheden                     | true |
      | aansprakelijkheidsverzekering_aanwezig         | true |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true |
      | einddatum_uitkeringsduur_hoofdstuk_ii          | 2026-07-02 |
      | dagen_ziekte_onderbreking_proefplaatsing       | 0 |
      | datum_aanvang_proefplaatsing                   | null |
    When I evaluate outputs "uitkeringsduur_hoofdstuk_ii_is_verstreken" of "werkloosheidswet"
    Then the execution succeeds
    And output "uitkeringsduur_hoofdstuk_ii_is_verstreken" is false
