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

  # Besluit loondispensatie Wajong artikel 1: "ten minste 25% lager". € 11,25 is precies 75 procent van € 15,00.
  # Bijgewerkt 2026-10-25: de gebruikelijke beloning was € 14,00 (drempel 1050) en
  # in de scenario's hieronder € 14,50, beide onder het WML per 1-7-2026 (1499). Nu
  # overal 1500 eurocent, net boven het WML en gelijk aan Sadee. De grens is
  # 1500 × 75 / 100 = 1125: 1125 ligt er precies op, 1126 één cent boven. In de
  # overige scenario's is de gerechtvaardigde beloning 1050 (70 procent), ruim onder
  # de grens, zodat ze alleen hun eigen voorwaarde toetsen. De rij
  # minimumloon_per_uur_eurocent is geschrapt: geen Wajong-parameter; het Besluit
  # haalt het minimumloon zelf uit de Wet minimumloon.
  Scenario: Beloning precies 25 procent onder de gebruikelijke beloning is duidelijk minder (Besluit artikel 1)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                               | 999990610 |
      | is_wsw_werknemer                                  | false |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon | true |
      | aanvraag_loondispensatie_ingediend                | true |
      | heeft_recht_op_arbeidsondersteuning_wajong        | true |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong  | false |
      | loondispensatie_voor_2018_verleend_voor_dezelfde_functie| false |
      | gebruikelijke_beloning_per_uur_eurocent           | 1500 |
      | gerechtvaardigde_beloning_per_uur_eurocent        | 1125 |
      | verwachte_duur_verminderde_prestatie_maanden      | 12 |
      | vastgesteld_aanspraakpercentage_minimumloon       | 70 |
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
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong  | false |
      | loondispensatie_voor_2018_verleend_voor_dezelfde_functie| false |
      | gebruikelijke_beloning_per_uur_eurocent           | 1500 |
      | gerechtvaardigde_beloning_per_uur_eurocent        | 1126 |
      | verwachte_duur_verminderde_prestatie_maanden      | 12 |
      | vastgesteld_aanspraakpercentage_minimumloon       | 70 |
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
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong  | false |
      | loondispensatie_voor_2018_verleend_voor_dezelfde_functie| false |
      | gebruikelijke_beloning_per_uur_eurocent           | 1500 |
      | gerechtvaardigde_beloning_per_uur_eurocent        | 1050 |
      | verwachte_duur_verminderde_prestatie_maanden      | 6 |
      | vastgesteld_aanspraakpercentage_minimumloon       | 70 |
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
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong  | false |
      | loondispensatie_voor_2018_verleend_voor_dezelfde_functie| false |
      | gebruikelijke_beloning_per_uur_eurocent           | 1500 |
      | gerechtvaardigde_beloning_per_uur_eurocent        | 1050 |
      | verwachte_duur_verminderde_prestatie_maanden      | 5 |
      | vastgesteld_aanspraakpercentage_minimumloon       | 70 |
    When I evaluate outputs "heeft_recht_op_loondispensatie" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_loondispensatie" is false

  # Toegevoegd 2026-10-25. Artikel 2:30 lid 1: "De artikelen 2:18 tot en met
  # 2:20 [...] en 2:24 zijn niet van toepassing op de jonggehandicapte die
  # volledig en duurzaam arbeidsongeschikt is." Lid 2 maakt voor 2:20 een
  # uitzondering bij loondispensatie vóór 1 januari 2018 voor dezelfde functie.
  Scenario: Volledig en duurzaam arbeidsongeschikt: artikel 2:20 is niet van toepassing (artikel 2:30 lid 1)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                      | 999990612 |
      | is_wsw_werknemer                                         | false |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon        | true |
      | aanvraag_loondispensatie_ingediend                       | true |
      | heeft_recht_op_arbeidsondersteuning_wajong               | true |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong         | true |
      | loondispensatie_voor_2018_verleend_voor_dezelfde_functie | false |
      | gebruikelijke_beloning_per_uur_eurocent                  | 1500 |
      | gerechtvaardigde_beloning_per_uur_eurocent               | 1050 |
      | verwachte_duur_verminderde_prestatie_maanden             | 12 |
      | vastgesteld_aanspraakpercentage_minimumloon              | 70 |
    When I evaluate outputs "artikel_2_20_van_toepassing, heeft_recht_op_loondispensatie" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "artikel_2_20_van_toepassing" is false
    And output "heeft_recht_op_loondispensatie" is false


  Scenario: Volledig en duurzaam arbeidsongeschikt met loondispensatie vóór 2018 in dezelfde functie: artikel 2:20 blijft gelden (artikel 2:30 lid 2)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                      | 999990612 |
      | is_wsw_werknemer                                         | false |
      | arbeidsprestatie_duidelijk_minder_dan_minimumloon        | true |
      | aanvraag_loondispensatie_ingediend                       | true |
      | heeft_recht_op_arbeidsondersteuning_wajong               | true |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong         | true |
      | loondispensatie_voor_2018_verleend_voor_dezelfde_functie | true |
      | gebruikelijke_beloning_per_uur_eurocent                  | 1500 |
      | gerechtvaardigde_beloning_per_uur_eurocent               | 1050 |
      | verwachte_duur_verminderde_prestatie_maanden             | 12 |
      | vastgesteld_aanspraakpercentage_minimumloon              | 70 |
    When I evaluate outputs "artikel_2_20_van_toepassing, heeft_recht_op_loondispensatie" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "artikel_2_20_van_toepassing" is true
    And output "heeft_recht_op_loondispensatie" is true
