# Source: BWBR0006049 (Regeling invoer konijne en hazevlees 1993)
# Scenarios derived from the executable articles (2, 3, 5a) of the regulation.

Feature: Regeling invoer konijne en hazevlees 1993
  Testscenario's afgeleid uit de wettelijke bepalingen voor de invoer van konijnevlees en hazevlees.

  Background:
    Given the calculation date is "2026-07-12"

  # === Artikel 2: Verbod op invoer ===

  Scenario: Invoer van konijnevlees en hazevlees is verboden
    # Bron: Artikel 2
    Given een invoerverzoek voor konijnevlees en hazevlees
    When de invoer wordt beoordeeld volgens Artikel 2
    Then is invoer_verboden true

  # === Artikel 3: Uitzonderingen op het verbod ===

  Scenario: Invoer toegestaan uit een lid-staat met voldaan aan Artikel 5
    # Bron: Artikel 3, lid a
    Given een invoerverzoek voor konijnevlees met de volgende gegevens:
      | parameter               | waarde                     |
      | land_van_herkomst       | Frankrijk                  |
      | voldoet_aan_artikel_5   | true                      |
    When de invoer wordt beoordeeld volgens Artikel 3
    Then is invoer_toegestaan true

  Scenario: Invoer toegestaan uit Noorwegen met voldaan aan Artikel 5
    # Bron: Artikel 3, lid a
    Given een invoerverzoek voor hazevlees met de volgende gegevens:
      | parameter               | waarde                     |
      | land_van_herkomst       | Noorwegen                  |
      | voldoet_aan_artikel_5   | true                      |
    When de invoer wordt beoordeeld volgens Artikel 3
    Then is invoer_toegestaan true

  Scenario: Invoer toegestaan uit een derde land met voldaan aan Artikel 7
    # Bron: Artikel 3, lid b
    Given een invoerverzoek voor konijnevlees met de volgende gegevens:
      | parameter               | waarde                     |
      | land_van_herkomst       | Argentinië                |
      | voldoet_aan_artikel_7   | true                      |
    When de invoer wordt beoordeeld volgens Artikel 3
    Then is invoer_toegestaan true

  Scenario: Invoer niet toegestaan uit een lid-staat zonder voldaan aan Artikel 5
    # Bron: Artikel 3, lid a
    Given een invoerverzoek voor konijnevlees met de volgende gegevens:
      | parameter               | waarde                     |
      | land_van_herkomst       | Duitsland                 |
      | voldoet_aan_artikel_5   | false                     |
    When de invoer wordt beoordeeld volgens Artikel 3
    Then is invoer_toegestaan false

  Scenario: Invoer niet toegestaan uit een derde land zonder voldaan aan Artikel 7
    # Bron: Artikel 3, lid b
    Given een invoerverzoek voor hazevlees met de volgende gegevens:
      | parameter               | waarde                     |
      | land_van_herkomst       | Brazilië                  |
      | voldoet_aan_artikel_7   | false                     |
    When de invoer wordt beoordeeld volgens Artikel 3
    Then is invoer_toegestaan false

  # === Artikel 5a: Uitzonderingen voor specifieke producten ===

  Scenario: Uitzondering toepasselijk voor gehakt vlees conform Richtlijn 88/657/EEG
    # Bron: Artikel 5a, lid a
    Given een product met de volgende gegevens:
      | parameter                          | waarde                     |
      | product_type                      | gehakt                    |
      | richtlijn_88_657_eee_compliant    | true                      |
    When de uitzondering wordt beoordeeld volgens Artikel 5a
    Then is uitzondering_toepasselijk true

  Scenario: Uitzondering toepasselijk voor vleesbereidingen conform Richtlijn 88/657/EEG
    # Bron: Artikel 5a, lid a
    Given een product met de volgende gegevens:
      | parameter                          | waarde                     |
      | product_type                      | vleesbereidingen          |
      | richtlijn_88_657_eee_compliant    | true                      |
    When de uitzondering wordt beoordeeld volgens Artikel 5a
    Then is uitzondering_toepasselijk true

  Scenario: Uitzondering toepasselijk voor vlees in stukken < 100 gram conform Richtlijn 88/657/EEG
    # Bron: Artikel 5a, lid a
    Given een product met de volgende gegevens:
      | parameter                          | waarde                     |
      | product_type                      | vlees in stukken          |
      | gewicht                           | 50                         |
      | richtlijn_88_657_eee_compliant    | true                      |
    When de uitzondering wordt beoordeeld volgens Artikel 5a
    Then is uitzondering_toepasselijk true

  Scenario: Uitzondering niet toepasselijk voor vlees in stukken >= 100 gram
    # Bron: Artikel 5a, lid a
    Given een product met de volgende gegevens:
      | parameter                          | waarde                     |
      | product_type                      | vlees in stukken          |
      | gewicht                           | 100                        |
      | richtlijn_88_657_eee_compliant    | true                      |
    When de uitzondering wordt beoordeeld volgens Artikel 5a
    Then is uitzondering_toepasselijk false

  Scenario: Uitzondering toepasselijk voor gehakt vlees conform Richtlijn 94/65/EG
    # Bron: Artikel 5a, lid b
    Given een product met de volgende gegevens:
      | parameter                          | waarde                     |
      | product_type                      | gehakt vlees              |
      | richtlijn_94_65_eg_compliant      | true                      |
    When de uitzondering wordt beoordeeld volgens Artikel 5a
    Then is uitzondering_toepasselijk true

  Scenario: Uitzondering toepasselijk voor vleesbereidingen conform Richtlijn 94/65/EG
    # Bron: Artikel 5a, lid b
    Given een product met de volgende gegevens:
      | parameter                          | waarde                     |
      | product_type                      | vleesbereidingen          |
      | richtlijn_94_65_eg_compliant      | true                      |
    When de uitzondering wordt beoordeeld volgens Artikel 5a
    Then is uitzondering_toepasselijk true

  Scenario: Uitzondering toepasselijk voor producten conform Verordening 745/2004
    # Bron: Artikel 5a, lid c
    Given een product met de volgende gegevens:
      | parameter                          | waarde                     |
      | verordening_745_2004_compliant      | true                      |
    When de uitzondering wordt beoordeeld volgens Artikel 5a
    Then is uitzondering_toepasselijk true

  Scenario: Uitzondering niet toepasselijk voor niet-conforme producten
    # Bron: Artikel 5a
    Given een product met de volgende gegevens:
      | parameter                          | waarde                     |
      | product_type                      | gehakt                    |
      | richtlijn_88_657_eee_compliant    | false                     |
      | richtlijn_94_65_eg_compliant      | false                     |
      | verordening_745_2004_compliant      | false                     |
    When de uitzondering wordt beoordeeld volgens Artikel 5a
    Then is uitzondering_toepasselijk false
