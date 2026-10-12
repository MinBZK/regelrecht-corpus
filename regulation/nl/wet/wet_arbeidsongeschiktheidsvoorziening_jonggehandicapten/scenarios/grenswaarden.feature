Feature: Wajong 2:15 en 2:20 met het Besluit loondispensatie, grenzen van percentages en termijnen
  Grensscenario's, toegevoegd op 12 oktober 2026 na een mutatietest van de
  modellen: voor elke vergelijking die geen scenario op de grens zelf had,
  staat hier het geval precies op de grens en het geval er net naast.
  Peildatum 1 juli 2026; parameterblokken uit arbeidsondersteuning en financieel_cv_sadee.

  # Artikel 2:15 lid 1 onderdeel a: "niet in staat ... meer dan 75% van het maatmaninkomen te verdienen".
  Scenario: Precies 75 procent verdiencapaciteit voldoet nog aan artikel 2:15 lid 1
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                | 999990609 |
      | aanvraag_arbeidsondersteuning_ingediend            | true |
      | is_jonggehandicapte_hoofdstuk_2                    | true |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen | 75 |
      | is_uitsluitingsgrond_2_11_van_toepassing           | false |
      | geboortedatum                                      | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning                | 2014-06-02 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong   | false |
      | recht_herleeft_op_grond_van_2_17                   | false |
      | datum_voldaan_aan_lid_1                            | 2014-06-02 |
    When I evaluate outputs "voldoet_aan_voorwaarden_lid_1, heeft_recht_op_arbeidsondersteuning" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_voorwaarden_lid_1" is true
    And output "heeft_recht_op_arbeidsondersteuning" is true

  Scenario: 76 procent verdiencapaciteit voldoet niet aan artikel 2:15 lid 1
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                | 999990609 |
      | aanvraag_arbeidsondersteuning_ingediend            | true |
      | is_jonggehandicapte_hoofdstuk_2                    | true |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen | 76 |
      | is_uitsluitingsgrond_2_11_van_toepassing           | false |
      | geboortedatum                                      | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning                | 2014-06-02 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong   | false |
      | recht_herleeft_op_grond_van_2_17                   | false |
      | datum_voldaan_aan_lid_1                            | 2014-06-02 |
    When I evaluate outputs "voldoet_aan_voorwaarden_lid_1, heeft_recht_op_arbeidsondersteuning" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_voorwaarden_lid_1" is false
    And output "heeft_recht_op_arbeidsondersteuning" is false

  # Besluit loondispensatie Wajong artikel 1: "ten minste 25% lager". € 10,50 is precies 75 procent van € 14,00.
  Scenario: Beloning precies 25 procent onder de gebruikelijke beloning is duidelijk minder (Besluit artikel 1)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                               | 999990610 |
      | is_wsw_werknemer                                  | false |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon | true |
      | aanvraag_loondispensatie_ingediend                | true |
      | heeft_recht_op_arbeidsondersteuning_wajong        | true |
      | gebruikelijke_beloning_per_uur_eurocent           | 1400 |
      | gerechtvaardigde_beloning_per_uur_eurocent        | 1050 |
      | verwachte_duur_verminderde_prestatie_maanden      | 12 |
      | vastgesteld_aanspraakpercentage_minimumloon       | 70 |
      | minimumloon_per_uur_eurocent                      | 1450 |
    When I evaluate outputs "heeft_recht_op_loondispensatie" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_loondispensatie" is true

  Scenario: Beloning één cent boven de drempel van 75 procent is niet duidelijk minder (Besluit artikel 1)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                               | 999990610 |
      | is_wsw_werknemer                                  | false |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon | true |
      | aanvraag_loondispensatie_ingediend                | true |
      | heeft_recht_op_arbeidsondersteuning_wajong        | true |
      | gebruikelijke_beloning_per_uur_eurocent           | 1400 |
      | gerechtvaardigde_beloning_per_uur_eurocent        | 1051 |
      | verwachte_duur_verminderde_prestatie_maanden      | 12 |
      | vastgesteld_aanspraakpercentage_minimumloon       | 70 |
      | minimumloon_per_uur_eurocent                      | 1450 |
    When I evaluate outputs "heeft_recht_op_loondispensatie" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_loondispensatie" is false

  Scenario: Een verwachte duur van precies zes maanden voldoet aan de zesmaandeneis (Besluit artikel 2)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                               | 999990611 |
      | is_wsw_werknemer                                  | false |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon | true |
      | aanvraag_loondispensatie_ingediend                | true |
      | heeft_recht_op_arbeidsondersteuning_wajong        | true |
      | gebruikelijke_beloning_per_uur_eurocent           | 1450 |
      | gerechtvaardigde_beloning_per_uur_eurocent        | 1000 |
      | verwachte_duur_verminderde_prestatie_maanden      | 6 |
      | vastgesteld_aanspraakpercentage_minimumloon       | 70 |
      | minimumloon_per_uur_eurocent                      | 1450 |
    When I evaluate outputs "heeft_recht_op_loondispensatie" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_loondispensatie" is true

  Scenario: Een verwachte duur van vijf maanden voldoet niet aan de zesmaandeneis (Besluit artikel 2)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                               | 999990611 |
      | is_wsw_werknemer                                  | false |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon | true |
      | aanvraag_loondispensatie_ingediend                | true |
      | heeft_recht_op_arbeidsondersteuning_wajong        | true |
      | gebruikelijke_beloning_per_uur_eurocent           | 1450 |
      | gerechtvaardigde_beloning_per_uur_eurocent        | 1000 |
      | verwachte_duur_verminderde_prestatie_maanden      | 5 |
      | vastgesteld_aanspraakpercentage_minimumloon       | 70 |
      | minimumloon_per_uur_eurocent                      | 1450 |
    When I evaluate outputs "heeft_recht_op_loondispensatie" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_loondispensatie" is false
