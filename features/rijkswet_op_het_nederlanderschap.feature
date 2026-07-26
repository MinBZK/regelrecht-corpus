# Source: BWBR0003738 (Rijkswet op het Nederlanderschap)
# Hypothetical examples for Article 3 (no MvT available).
Feature: Rijkswet op het Nederlanderschap
  Testscenario's voor verkrijging Nederlanderschap door geboorte (Artikel 3).

  Background:
    Given the calculation date is "2023-10-01"

  @artikel3
  Scenario: Kind met Nederlandse ouder bij geboorte
    Given de geboorte_locatie is "Nederland"
    And de ouder_nederlander is true
    And de ouder_overleden is false
    When rijkswet_op_het_nederlanderschap artikel 3 wordt uitgevoerd
    Then is de is_nederlander_door_geboorte true

  @artikel3
  Scenario: Kind met overleden Nederlandse ouder bij geboorte
    Given de ouder_nederlander is true
    And de ouder_overleden is true
    When rijkswet_op_het_nederlanderschap artikel 3 wordt uitgevoerd
    Then is de is_nederlander_door_geboorte true

  @artikel3
  Scenario: Gevonden kind in Nederland zonder vreemde nationaliteit
    Given de geboorte_locatie is "Nederland"
    And de vreemde_nationaliteit_binnen_5_jaar is false
    When rijkswet_op_het_nederlanderschap artikel 3 wordt uitgevoerd
    Then is de is_nederlander_door_geboorte true

  @artikel3
  Scenario: Kind met hoofdverblijf in Koninkrijk en ouders met hoofdverblijf
    Given de ouder_hoofdverblijf is "Nederland"
    And de kind_hoofdverblijf is "Nederland"
    When rijkswet_op_het_nederlanderschap artikel 3 wordt uitgevoerd
    Then is de is_nederlander_door_geboorte true

  @artikel3
  Scenario: Kind zonder Nederlandse ouder en zonder hoofdverblijf in Koninkrijk
    Given de ouder_nederlander is false
    And de geboorte_locatie is "Duitsland"
    When rijkswet_op_het_nederlanderschap artikel 3 wordt uitgevoerd
    Then is de is_nederlander_door_geboorte false
