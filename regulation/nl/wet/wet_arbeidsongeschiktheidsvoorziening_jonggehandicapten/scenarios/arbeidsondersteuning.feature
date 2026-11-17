Feature: Wajong, recht op arbeidsondersteuning (artikel 2:15)
  Als afnemende wet (Ziektewet 29b, Wfsv 38b)
  Wil ik bij de Wajong kunnen opvragen of iemand recht heeft op
  arbeidsondersteuning
  Zodat de Wajong-status één vindplaats heeft in plaats van een losse vlag

  # Afgeleid op 2026-10-09: verdiencapaciteit_wajong_percentage_maatmaninkomen
  # vervangt de boolean "niet in staat meer dan 75% van het maatmaninkomen te
  # verdienen"; waar die waar was, staat hier 60. Een aanname.

  # Artikel 2:15 lid 1 is cumulatief (jonggehandicapte, ten hoogste 75%
  # van het maatmaninkomen, geen uitsluitingsgrond 2:11, achttien jaar,
  # aanvraag op of na 1 januari 2010). Lid 2 laat het recht zestien weken
  # na de aanvraag ingaan; lid 3 op de dag van de aanvraag bij volledige en
  # duurzame arbeidsongeschiktheid of herleving. Lid 4 sluit de instroom
  # per 1 januari 2015 (Invoeringswet Participatiewet), lid 5 laat
  # herleving toe.

  # Datums die alleen gelden als er een aanvraag is (datum van de aanvraag,
  # dag waarop aan lid 1 wordt voldaan) staan op null wanneer er geen
  # aanvraag is; de afleiding gebruikt ze dan niet.

  Scenario: Sadee heeft recht op arbeidsondersteuning, ontstaan zestien weken na haar aanvraag in 2014
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990100  |
      | aanvraag_arbeidsondersteuning_ingediend          | true       |
      | is_jonggehandicapte_hoofdstuk_2                  | true       |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen | 60 |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning              | 2014-06-02 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong        | false      |
      | recht_herleeft_op_grond_van_2_17                 | false      |
      | datum_voldaan_aan_lid_1 | 2014-06-02 |
    When I evaluate outputs "heeft_recht_op_arbeidsondersteuning, voldoet_aan_voorwaarden_lid_1, ingangsdatum_recht_op_arbeidsondersteuning, recht_kan_nog_ontstaan" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
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
      | verdiencapaciteit_wajong_percentage_maatmaninkomen | 60 |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning              | null       |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong        | false      |
      | recht_herleeft_op_grond_van_2_17                 | false      |
      | datum_voldaan_aan_lid_1 | null |
    When I evaluate "heeft_recht_op_arbeidsondersteuning" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "heeft_recht_op_arbeidsondersteuning" is false

  # Toegevoegd 2026-10-25 (restpunt C12). Sadees feiten, maar de dag waarop
  # aan lid 1 wordt voldaan ontbreekt terwijl de aanvraag is ingediend. Het
  # model kan het recht dan niet vaststellen. heeft_recht_op_arbeidsondersteuning
  # valt terug op false, net als bij een afwijzing; invoer_onvolledig_artikel_2_15
  # is waar en laat zien dat het om onvolledige invoer gaat.
  Scenario: Aanvraag ingediend maar de lid-1-datum ontbreekt: geen recht, gemeld als onvolledige invoer
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990100  |
      | aanvraag_arbeidsondersteuning_ingediend          | true       |
      | is_jonggehandicapte_hoofdstuk_2                  | true       |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen | 60 |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning              | 2014-06-02 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong        | false      |
      | recht_herleeft_op_grond_van_2_17                 | false      |
      | datum_voldaan_aan_lid_1 | null |
    When I evaluate outputs "invoer_onvolledig_artikel_2_15, ingangsdatum_recht_op_arbeidsondersteuning, heeft_recht_op_arbeidsondersteuning" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "invoer_onvolledig_artikel_2_15" is true
    And output "ingangsdatum_recht_op_arbeidsondersteuning" is absent
    And output "heeft_recht_op_arbeidsondersteuning" is false

  # Eigen persona (niet Sadee of Koen): Wajonger geboren 1996, aanvraag in
  # oktober 2014, zodat het recht na 1 januari 2015 zou ingaan.
  Scenario: Een aanvraag die na 1 januari 2015 zou ingaan leidt niet meer tot een recht (lid 4)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990710  |
      | aanvraag_arbeidsondersteuning_ingediend          | true       |
      | is_jonggehandicapte_hoofdstuk_2                  | true       |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen | 60 |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning              | 2014-10-06 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong        | false      |
      | recht_herleeft_op_grond_van_2_17                 | false      |
      | datum_voldaan_aan_lid_1 | 2014-10-06 |
    When I evaluate outputs "heeft_recht_op_arbeidsondersteuning, voldoet_aan_voorwaarden_lid_1, ingangsdatum_recht_op_arbeidsondersteuning, recht_kan_nog_ontstaan" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "voldoet_aan_voorwaarden_lid_1" is true
    And output "ingangsdatum_recht_op_arbeidsondersteuning" equals "2015-01-26"
    And output "recht_kan_nog_ontstaan" is false
    And output "heeft_recht_op_arbeidsondersteuning" is false

  # Eigen persona (niet Sadee of Koen): Wajonger geboren 1996 met een
  # eerder beëindigd recht dat in 2025 op grond van artikel 2:17 herleeft.
  Scenario: Herleving op grond van artikel 2:17 blijft na 2015 mogelijk (lid 5) en gaat in op de dag van de aanvraag (lid 3)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990711  |
      | aanvraag_arbeidsondersteuning_ingediend          | true       |
      | is_jonggehandicapte_hoofdstuk_2                  | true       |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen | 60 |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 1996-05-15 |
      | datum_aanvraag_arbeidsondersteuning              | 2025-03-03 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong        | false      |
      | recht_herleeft_op_grond_van_2_17                 | true       |
      | datum_voldaan_aan_lid_1 | 2025-03-03 |
    When I evaluate outputs "heeft_recht_op_arbeidsondersteuning, ingangsdatum_recht_op_arbeidsondersteuning, recht_kan_nog_ontstaan" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "ingangsdatum_recht_op_arbeidsondersteuning" equals "2025-03-03"
    And output "recht_kan_nog_ontstaan" is true
    And output "heeft_recht_op_arbeidsondersteuning" is true

  # Een zeventienjarige heeft nooit eerder recht gehad, dus herleving op
  # grond van artikel 2:17 is niet aan de orde. Aan lid 1 kan ten vroegste
  # op de achttiende verjaardag (15 januari 2027) worden voldaan. Het recht
  # zou dan na 1 januari 2015 ingaan, zodat ook lid 4 een nieuw recht
  # uitsluit. De gecontroleerde ingangsdatum 2027-01-15 is geen ingangsdatum
  # van een recht: het is het lid-2-moment dat het model berekent (de
  # achttiende verjaardag, later dan zestien weken na de aanvraag). De
  # controle staat er om te tonen dat juist die datum na 1 januari 2015 ligt,
  # zodat recht_kan_nog_ontstaan op false uitkomt. Eigen testpersoon 999990730 (geboren 2009); tot 2026-10-25
  # deelde zij 999990102 met drie andere personen.
  Scenario: Wie nog geen achttien is voldoet niet aan lid 1 onderdeel c
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                              | 999990730  |
      | aanvraag_arbeidsondersteuning_ingediend          | true       |
      | is_jonggehandicapte_hoofdstuk_2                  | true       |
      | verdiencapaciteit_wajong_percentage_maatmaninkomen | 60 |
      | is_uitsluitingsgrond_2_11_van_toepassing         | false      |
      | geboortedatum                                    | 2009-01-15 |
      | datum_aanvraag_arbeidsondersteuning              | 2026-03-02 |
      | is_volledig_en_duurzaam_arbeidsongeschikt_wajong        | false      |
      | recht_herleeft_op_grond_van_2_17                 | false      |
      | datum_voldaan_aan_lid_1 | 2027-01-15 |
    When I evaluate outputs "heeft_recht_op_arbeidsondersteuning, recht_kan_nog_ontstaan, voldoet_aan_voorwaarden_lid_1, ingangsdatum_recht_op_arbeidsondersteuning" of "wet_arbeidsongeschiktheidsvoorziening_jonggehandicapten"
    Then the execution succeeds
    And output "ingangsdatum_recht_op_arbeidsondersteuning" equals "2027-01-15"
    And output "recht_kan_nog_ontstaan" is false
    And output "voldoet_aan_voorwaarden_lid_1" is false
    And output "heeft_recht_op_arbeidsondersteuning" is false
