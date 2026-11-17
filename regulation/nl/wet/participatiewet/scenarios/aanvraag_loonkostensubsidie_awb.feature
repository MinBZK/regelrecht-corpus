Feature: De aanvraag om loonkostensubsidie, met de Awb erop
  Artikel 10d vestigt een aanvraag (schema v0.8, RFC-045): de werkgever of
  de werknemer vraagt het college om loonkostensubsidie. De Awb haakt op
  elke aanvraag: artikel 4:2 zegt wat de aanvraag ten minste bevat,
  artikel 4:13 wanneer de redelijke beslistermijn in ieder geval is
  verstreken. Buiten de procedure van de Awb voert de engine het artikel in
  één keer uit, met de beslissing erop: daarom staan de vaststellingen van
  het college erbij.

  # Toegevoegd 2026-10-28. Zelfde feiten als het eerste scenario van
  # loonkostensubsidie_routes.feature (lid 1 onderdeel a, loonwaarde 60
  # procent, voltijd), met de velden van Awb 4:2 en de dag van ontvangst
  # (Awb 4:13) erbij. De uitkomst van artikel 10d blijft gelijk.
  # Acht weken na ontvangst op 2026-06-01 is 2026-07-27.

  Background:
    Given the calculation date is "2026-07-01"
    Given law "algemene_wet_bestuursrecht" is loaded

  Scenario: Een volledige aanvraag geeft de toets van 4:2 en de beslistermijn van 4:13
    Given the following parameters:
      | bsn                                                       | 999990301  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | null       |
      | datum_einde_deelname_onderwijs_lid_2_a                    | null       |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b              | null       |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | 60         |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | true       |
      | dienstbetrekking_is_tot_stand_gekomen                     | true       |
      | college_heeft_loonwaarde_vastgesteld                      | true       |
      | vaststelling_loonwaarde_blijft_achterwege                 | false      |
      | datum_aanvang_dienstbetrekking                            | 2026-06-01 |
      | aanvraag_ondertekend                                      | true       |
      | naam_aanvrager                                            | Werkgever B.V. |
      | adres_aanvrager                                           | Voorbeeldstraat 1 |
      | dagtekening                                               | 2026-05-29 |
      | gevraagde_beschikking                                     | loonkostensubsidie |
      | datum_ontvangst                                           | 2026-06-01 |
    When I evaluate outputs "heeft_recht_op_lks, hoogte_lks_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "heeft_recht_op_lks" is true
    And output "hoogte_lks_eurocent_per_maand" equals 100958.4
    And output "aanvraag_bevat_wat_artikel_4_2_eist" is true
    And output "aanvraag_bevat_wat_artikel_4_2_eist" has reactive provenance
    And output "redelijke_beslistermijn_einddatum" equals "2026-07-27"
    And output "redelijke_beslistermijn_einddatum" has reactive provenance

  Scenario: Zonder ondertekening bevat de aanvraag niet wat 4:2 eist
    Given the following parameters:
      | bsn                                                       | 999990301  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | null       |
      | datum_einde_deelname_onderwijs_lid_2_a                    | null       |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b              | null       |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | 60         |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | true       |
      | dienstbetrekking_is_tot_stand_gekomen                     | true       |
      | college_heeft_loonwaarde_vastgesteld                      | true       |
      | vaststelling_loonwaarde_blijft_achterwege                 | false      |
      | datum_aanvang_dienstbetrekking                            | 2026-06-01 |
      | aanvraag_ondertekend                                      | false      |
      | naam_aanvrager                                            | Werkgever B.V. |
      | adres_aanvrager                                           | Voorbeeldstraat 1 |
      | dagtekening                                               | 2026-05-29 |
      | gevraagde_beschikking                                     | loonkostensubsidie |
      | datum_ontvangst                                           | 2026-06-01 |
    When I evaluate outputs "heeft_recht_op_lks" of "participatiewet"
    Then the execution succeeds
    And output "aanvraag_bevat_wat_artikel_4_2_eist" is false
