Feature: Advies van het UWV over beschut werk, Besluit advisering beschut werk artikel 3
  Als college
  Wil ik zien wanneer het UWV adviseert dat iemand uitsluitend beschut kan werken
  Zodat de vaststelling van Participatiewet 10b herleidbaar is

  # Toegevoegd 2026-10-09. Het UWV adviseert dat alleen als de persoon is
  # aangewezen op aanpassingen of op toezicht of begeleiding die een werkgever
  # niet binnen redelijke grenzen kan bieden (lid 1 en 2). Bij een herhaald
  # verzoek van de persoon zelf binnen twaalf maanden antwoordt het UWV zonder
  # onderzoek ontkennend (lid 3 onderdeel b), tenzij er nieuwe feiten zijn
  # (lid 6). Fictieve testpersoon.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario: Aangewezen op intensieve begeleiding: het UWV adviseert beschut werk
    Given the following parameters:
      | bsn                                                         | 999990300  |
      | aangewezen_op_aanpassingen_buiten_redelijke_grenzen         | false      |
      | aangewezen_op_toezicht_of_begeleiding_buiten_redelijke_grenzen | true    |
      | is_wsw_geindiceerd_met_advies_begeleid_werken               | false      |
      | is_wsw_geindiceerd_met_advies_niet_begeleid_werken          | false      |
      | is_aangevraagd_door_persoon_10b_lid_3                       | false      |
      | datum_verzoek_advies                                        | 2026-06-01 |
      | datum_vorig_advies_10b                                      | null       |
      | vermeldt_nieuwe_feiten_of_veranderde_omstandigheden         | false      |
    When I evaluate outputs "criteria_vaststelling_beschut_werk, is_herhaald_verzoek_binnen_twaalf_maanden" of "besluit_advisering_beschut_werk"
    Then the execution succeeds
    And output "is_herhaald_verzoek_binnen_twaalf_maanden" is false
    And output "criteria_vaststelling_beschut_werk" is true

  Scenario: Herhaald verzoek binnen twaalf maanden: zonder onderzoek ontkennend
    Given the following parameters:
      | bsn                                                         | 999990300  |
      | aangewezen_op_aanpassingen_buiten_redelijke_grenzen         | false      |
      | aangewezen_op_toezicht_of_begeleiding_buiten_redelijke_grenzen | true    |
      | is_wsw_geindiceerd_met_advies_begeleid_werken               | false      |
      | is_wsw_geindiceerd_met_advies_niet_begeleid_werken          | false      |
      | is_aangevraagd_door_persoon_10b_lid_3                       | true       |
      | datum_verzoek_advies                                        | 2026-06-01 |
      | datum_vorig_advies_10b                                      | 2025-09-15 |
      | vermeldt_nieuwe_feiten_of_veranderde_omstandigheden         | false      |
    When I evaluate outputs "criteria_vaststelling_beschut_werk, is_herhaald_verzoek_binnen_twaalf_maanden, antwoord_zonder_onderzoek_ontkennend" of "besluit_advisering_beschut_werk"
    Then the execution succeeds
    And output "is_herhaald_verzoek_binnen_twaalf_maanden" is true
    And output "antwoord_zonder_onderzoek_ontkennend" is true
    And output "criteria_vaststelling_beschut_werk" is false

  Scenario: Herhaald verzoek met nieuwe feiten: toch onderzoek
    Given the following parameters:
      | bsn                                                         | 999990300  |
      | aangewezen_op_aanpassingen_buiten_redelijke_grenzen         | false      |
      | aangewezen_op_toezicht_of_begeleiding_buiten_redelijke_grenzen | true    |
      | is_wsw_geindiceerd_met_advies_begeleid_werken               | false      |
      | is_wsw_geindiceerd_met_advies_niet_begeleid_werken          | false      |
      | is_aangevraagd_door_persoon_10b_lid_3                       | true       |
      | datum_verzoek_advies                                        | 2026-06-01 |
      | datum_vorig_advies_10b                                      | 2025-09-15 |
      | vermeldt_nieuwe_feiten_of_veranderde_omstandigheden         | true       |
    When I evaluate outputs "criteria_vaststelling_beschut_werk, antwoord_zonder_onderzoek_ontkennend" of "besluit_advisering_beschut_werk"
    Then the execution succeeds
    And output "antwoord_zonder_onderzoek_ontkennend" is false
    And output "criteria_vaststelling_beschut_werk" is true
