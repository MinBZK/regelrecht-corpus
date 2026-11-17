Feature: De beslistermijn van vijf weken, Participatiewet artikel 10d lid 12
  "De beschikking tot loonkostensubsidie wordt genomen binnen vijf weken:
  a. nadat de loonwaarde is vastgesteld, bedoeld in artikel 10d, eerste lid,
  aanhef en onderdeel a; of b. nadat is vastgesteld dat de vaststelling van
  de loonwaarde achterwege kan blijven, bedoeld in artikel 10d, eerste lid,
  aanhef en onderdeel b."

  # Toegevoegd 2026-11-04. De uitkomst beslistermijn_lks_einddatum is de
  # laatste dag van de termijn: de dag van de vaststelling telt niet mee,
  # de termijn eindigt op dezelfde weekdag vijf weken later (telling als bij
  # Awb 4:13). Verlenging door de Algemene termijnenwet is niet gemodelleerd.
  # Parameterblok uit loonkostensubsidie_routes.feature; alleen de route van
  # lid 1 en de datum van de vaststelling verschillen.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario Outline: Vijf weken na de vaststelling van lid 1 onderdeel <onderdeel>
    Given the following parameters:
      | bsn                                                       | 999990301  |
      | behoort_tot_doelgroep_lks                                 | true       |
      | kan_minimumloon_niet_verdienen                            | true       |
      | datum_aanvraag_lks                                        | null       |
      | datum_einde_deelname_onderwijs_lid_2_a                    | null       |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b              | null       |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false      |
      | is_wsw_dienstbetrekking                                   | false      |
      | loonwaarde_percentage                                     | <loonwaarde> |
      | overeengekomen_arbeidsduur_uren_per_week                  | 36         |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan      | true       |
      | dienstbetrekking_is_tot_stand_gekomen                     | true       |
      | college_heeft_loonwaarde_vastgesteld                      | <a>        |
      | vaststelling_loonwaarde_blijft_achterwege                 | <b>        |
      | datum_aanvang_dienstbetrekking                            | 2026-06-01 |
      | datum_vaststelling_lid_1_a_of_b                           | <vaststelling> |
    When I evaluate outputs "beslistermijn_lks_einddatum" of "participatiewet"
    Then the execution succeeds
    And output "beslistermijn_lks_einddatum" equals "<einddatum>"

    Examples:
      | onderdeel | a     | b     | loonwaarde | vaststelling | einddatum  | toelichting                              |
      | a         | true  | false | 60         | 2026-05-20   | 2026-06-24 | woensdag tot woensdag                    |
      | b         | false | true  | 0          | 2026-01-30   | 2026-03-06 | over het einde van februari heen         |
      | a         | true  | false | 60         | 2026-12-01   | 2027-01-05 | over de jaargrens heen                   |
