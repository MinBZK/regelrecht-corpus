Feature: Wajong, recht op arbeidsondersteuning (artikel 2:15)
  Als afnemende wet (Ziektewet 29b, Wfsv 38b)
  Wil ik bij de Wajong kunnen opvragen of iemand recht heeft op
  arbeidsondersteuning
  Zodat de Wajong-status één vindplaats heeft in plaats van een losse vlag

  # Artikel 2:15 lid 1 is cumulatief (jonggehandicapte, ten hoogste 75%
  # van het maatmaninkomen, geen uitsluitingsgrond 2:11, achttien jaar,
  # aanvraag op of na 1 januari 2010). Lid 2 laat het recht zestien weken
  # na de aanvraag ingaan; lid 3 op de dag van de aanvraag bij volledige en
  # duurzame arbeidsongeschiktheid of herleving. Lid 4 sluit de instroom
  # per 1 januari 2015 (Invoeringswet Participatiewet), lid 5 laat
  # herleving toe.

  # Datums die alleen gelden als een bijbehorend feit waar is (eerste
  # ziektedag, datum Wajong-aanvraag) staan op 1900-01-01 wanneer dat feit
  # onwaar is: de engine geeft een ontbrekende optionele parameter nog niet
  # als "geen waarde" door aan een andere wet, en de afleiding gebruikt de
  # datum dan niet.

  Scenario: Sadee heeft recht op arbeidsondersteuning, ontstaan zestien weken na haar aanvraag in 2014
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990100  |
      | aanvraag_arbeidsondersteuning_ingediend          | true       |
      | is_jonggehandicapte_hoofdstuk_2                  | true       |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen | true       |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning              | 2014-06-02 |
      | is_volledig_en_duurzaam_arbeidsongeschikt        | false      |
      | recht_herleeft_op_grond_van_2_17                 | false      |
    When I evaluate "heeft_recht_op_arbeidsondersteuning" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_voorwaarden_lid_1" is true
    And output "ingangsdatum_recht_op_arbeidsondersteuning" equals "2014-09-22"
    And output "recht_kan_nog_ontstaan" is true
    And output "heeft_recht_op_arbeidsondersteuning" is true

  Scenario: Zonder aanvraag bestaat geen recht op arbeidsondersteuning
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990100  |
      | aanvraag_arbeidsondersteuning_ingediend          | false      |
      | is_jonggehandicapte_hoofdstuk_2                  | true       |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen | true       |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning              | 1900-01-01 |
      | is_volledig_en_duurzaam_arbeidsongeschikt        | false      |
      | recht_herleeft_op_grond_van_2_17                 | false      |
    When I evaluate "heeft_recht_op_arbeidsondersteuning" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_arbeidsondersteuning" is false

  Scenario: Een aanvraag die na 1 januari 2015 zou ingaan leidt niet meer tot een recht (lid 4)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990101  |
      | aanvraag_arbeidsondersteuning_ingediend          | true       |
      | is_jonggehandicapte_hoofdstuk_2                  | true       |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen | true       |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning              | 2014-10-06 |
      | is_volledig_en_duurzaam_arbeidsongeschikt        | false      |
      | recht_herleeft_op_grond_van_2_17                 | false      |
    When I evaluate "heeft_recht_op_arbeidsondersteuning" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_voorwaarden_lid_1" is true
    And output "ingangsdatum_recht_op_arbeidsondersteuning" equals "2015-01-26"
    And output "recht_kan_nog_ontstaan" is false
    And output "heeft_recht_op_arbeidsondersteuning" is false

  Scenario: Herleving op grond van artikel 2:17 blijft na 2015 mogelijk (lid 5) en gaat in op de dag van de aanvraag (lid 3)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990101  |
      | aanvraag_arbeidsondersteuning_ingediend          | true       |
      | is_jonggehandicapte_hoofdstuk_2                  | true       |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen | true       |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning              | 2025-03-03 |
      | is_volledig_en_duurzaam_arbeidsongeschikt        | false      |
      | recht_herleeft_op_grond_van_2_17                 | true       |
    When I evaluate "heeft_recht_op_arbeidsondersteuning" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "ingangsdatum_recht_op_arbeidsondersteuning" equals "2025-03-03"
    And output "recht_kan_nog_ontstaan" is true
    And output "heeft_recht_op_arbeidsondersteuning" is true

  Scenario: Wie nog geen achttien is voldoet niet aan lid 1 onderdeel c
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990102  |
      | aanvraag_arbeidsondersteuning_ingediend          | true       |
      | is_jonggehandicapte_hoofdstuk_2                  | true       |
      | niet_in_staat_meer_dan_75_procent_maatmaninkomen | true       |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 2009-01-15 |
      | datum_aanvraag_arbeidsondersteuning              | 2026-03-02 |
      | is_volledig_en_duurzaam_arbeidsongeschikt        | false      |
      | recht_herleeft_op_grond_van_2_17                 | true       |
    When I evaluate "heeft_recht_op_arbeidsondersteuning" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "recht_kan_nog_ontstaan" is true
    And output "voldoet_aan_voorwaarden_lid_1" is false
    And output "heeft_recht_op_arbeidsondersteuning" is false
