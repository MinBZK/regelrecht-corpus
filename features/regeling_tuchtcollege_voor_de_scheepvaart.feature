# Source: BWBR0016795 (Regeling tuchtcollege voor de scheepvaart, 2013-08-20)
# Test scenarios for Article 2 (vacatiegeld calculations)

Feature: Vacatiegeld voor het tuchtcollege voor de scheepvaart

  @artikel2 @lid1
  Scenario: Lid ontvangt €342 voor bijwonen zitting
    Given de rol is "lid"
    And de activiteit is "bijwonen_zitting"
    When het vacatiegeld wordt berekend according to Artikel 2, lid 1
    Then is het vacatiegeld_bedrag 34200 eurocent

  @artikel2 @lid1
  Scenario: Plaatsvervangend lid ontvangt €342 voor bijwonen zitting
    Given de rol is "plaatsvervangend_lid"
    And de activiteit is "bijwonen_zitting"
    When het vacatiegeld wordt berekend according to Artikel 2, lid 1
    Then is het vacatiegeld_bedrag 34200 eurocent

  @artikel2 @lid2
  Scenario: Voorzitter ontvangt €684 voor voorbereiden zitting
    Given de rol is "voorzitter"
    And de activiteit is "voorbereiden_zitting"
    When het vacatiegeld wordt berekend according to Artikel 2, lid 2
    Then is het vacatiegeld_bedrag 68400 eurocent

  @artikel2 @lid2
  Scenario: Voorzitter ontvangt €684 voor leiden zitting
    Given de rol is "voorzitter"
    And de activiteit is "leiden_zitting"
    When het vacatiegeld wordt berekend according to Artikel 2, lid 2
    Then is het vacatiegeld_bedrag 68400 eurocent

  @artikel2 @lid2
  Scenario: Voorzitter ontvangt €684 voor voorbereiden uitspraak
    Given de rol is "voorzitter"
    And de activiteit is "voorbereiden_uitspraak"
    When het vacatiegeld wordt berekend according to Artikel 2, lid 2
    Then is het vacatiegeld_bedrag 68400 eurocent

  @artikel2 @lid2
  Scenario: Plaatsvervangend voorzitter ontvangt €684 voor voorbereiden zitting
    Given de rol is "plaatsvervangend_voorzitter"
    And de activiteit is "voorbereiden_zitting"
    When het vacatiegeld wordt berekend according to Artikel 2, lid 2
    Then is het vacatiegeld_bedrag 68400 eurocent

  @artikel2 @lid3
  Scenario: Voorzitter ontvangt €228 voor nemen beslissing (artikel 55j, eerste lid)
    Given de rol is "voorzitter"
    And de activiteit is "nemen_beslissing_55j"
    When het vacatiegeld wordt berekend according to Artikel 2, lid 3
    Then is het vacatiegeld_bedrag 22800 eurocent

  @artikel2 @lid3
  Scenario: Voorzitter ontvangt €228 voor beproeven minnelijke schikking (artikel 55j, vierde lid)
    Given de rol is "voorzitter"
    And de activiteit is "beproeven_minnelijke_schikking"
    When het vacatiegeld wordt berekend according to Artikel 2, lid 3
    Then is het vacatiegeld_bedrag 22800 eurocent

  @artikel2 @lid4
  Scenario: Voorzitter ontvangt €684 voor algemeen functioneren
    Given de rol is "voorzitter"
    And de activiteit is "algemeen_functioneren"
    When het vacatiegeld wordt berekend according to Artikel 2, lid 4
    Then is het vacatiegeld_bedrag 68400 eurocent

  @artikel2 @edge_case
  Scenario: Ongeldige rol ontvangt €0
    Given de rol is "secretaris"
    And de activiteit is "bijwonen_zitting"
    When het vacatiegeld wordt berekend according to Artikel 2
    Then is het vacatiegeld_bedrag 0 eurocent

  @artikel2 @edge_case
  Scenario: Ongeldige activiteit ontvangt €0
    Given de rol is "lid"
    And de activiteit is "onbekende_activiteit"
    When het vacatiegeld wordt berekend according to Artikel 2
    Then is het vacatiegeld_bedrag 0 eurocent
