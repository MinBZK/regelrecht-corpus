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
      | uwv_heeft_toestemming_verleend                 | false |
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
      | uwv_heeft_toestemming_verleend                 | false |
    When I evaluate outputs "uitkeringsduur_hoofdstuk_ii_is_verstreken" of "werkloosheidswet"
    Then the execution succeeds
    And output "uitkeringsduur_hoofdstuk_ii_is_verstreken" is false

  # ── 76a lid 2: behoud van uitkering alleen binnen de verleende periode ──
  # Toegevoegd 25 oktober 2026 na review: het model liet de uitkering ook
  # na de einddatum van de proefplaatsing doorlopen en las "kan toestemming
  # verlenen" (lid 1) als verleende toestemming.
  # Aanvang 1 juli 2026 (peildata vanaf de 2026-07-01-versie van de WW),
  # geen ziektedagen, dus einddatum 1 januari 2027; 31 december is de
  # laatste dag binnen de periode.

  Scenario: Verleende toestemming, peildatum op de laatste dag van de proefplaatsing: uitkering blijft (76a lid 2)
    Given the calculation date is "2026-12-31"
    And the following parameters:
      | bsn                                            | 999990618 |
      | heeft_recht_op_ww_uitkering                    | true |
      | in_staat_tot_werkzaamheden                     | true |
      | aansprakelijkheidsverzekering_aanwezig         | true |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true |
      | einddatum_uitkeringsduur_hoofdstuk_ii          | 2027-06-01 |
      | dagen_ziekte_onderbreking_proefplaatsing       | 0 |
      | datum_aanvang_proefplaatsing                   | 2026-07-01 |
      | uwv_heeft_toestemming_verleend                 | true |
    When I evaluate outputs "einddatum_proefplaatsing, peildatum_valt_in_periode_proefplaatsing, ww_uitkering_blijft_bestaan" of "werkloosheidswet"
    Then the execution succeeds
    And output "einddatum_proefplaatsing" equals "2027-01-01"
    And output "peildatum_valt_in_periode_proefplaatsing" is true
    And output "ww_uitkering_blijft_bestaan" is true

  Scenario: Verleende toestemming, peildatum op de einddatum: periode voorbij, lid 2 werkt niet meer (76a lid 2)
    Given the calculation date is "2027-01-01"
    And the following parameters:
      | bsn                                            | 999990618 |
      | heeft_recht_op_ww_uitkering                    | true |
      | in_staat_tot_werkzaamheden                     | true |
      | aansprakelijkheidsverzekering_aanwezig         | true |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true |
      | einddatum_uitkeringsduur_hoofdstuk_ii          | 2027-06-01 |
      | dagen_ziekte_onderbreking_proefplaatsing       | 0 |
      | datum_aanvang_proefplaatsing                   | 2026-07-01 |
      | uwv_heeft_toestemming_verleend                 | true |
    When I evaluate outputs "peildatum_valt_in_periode_proefplaatsing, ww_uitkering_blijft_bestaan" of "werkloosheidswet"
    Then the execution succeeds
    And output "peildatum_valt_in_periode_proefplaatsing" is false
    And output "ww_uitkering_blijft_bestaan" is false

  Scenario: UWV mag toestemming verlenen maar heeft dat niet gedaan: lid 2 werkt niet (76a lid 1 en 2)
    Given the calculation date is "2026-09-01"
    And the following parameters:
      | bsn                                            | 999990618 |
      | heeft_recht_op_ww_uitkering                    | true |
      | in_staat_tot_werkzaamheden                     | true |
      | aansprakelijkheidsverzekering_aanwezig         | true |
      | niet_eerder_proefplaatsing_zelfde_werkgever    | true |
      | reeel_uitzicht_op_dienstbetrekking_zes_maanden | true |
      | einddatum_uitkeringsduur_hoofdstuk_ii          | 2027-06-01 |
      | dagen_ziekte_onderbreking_proefplaatsing       | 0 |
      | datum_aanvang_proefplaatsing                   | 2026-07-01 |
      | uwv_heeft_toestemming_verleend                 | false |
    When I evaluate outputs "uwv_mag_toestemming_verlenen, ww_uitkering_blijft_bestaan" of "werkloosheidswet"
    Then the execution succeeds
    And output "uwv_mag_toestemming_verlenen" is true
    And output "ww_uitkering_blijft_bestaan" is false
