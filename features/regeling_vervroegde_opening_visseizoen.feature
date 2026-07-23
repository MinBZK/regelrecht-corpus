@regeling_vervroegde_opening_visseizoen
Feature: Regeling vervroegde opening visseizoen (BWBR0006591)
  As a fisherman
  I want to know when I can fish for baars and snoekbaars
  So that I comply with the regulation

  Background:
    Given the regulation "Regeling vervroegde opening visseizoen" (BWBR0006591)

  Scenario: Exemption applies for baars on the last Saturday in May
    Given the year is 2026
    And the fishing date is the last Saturday in May 2026
    And the fish species is "baars"
    When checking if the exemption applies
    Then the exemption should be granted

  Scenario: Exemption applies for snoekbaars on May 31st
    Given the year is 2026
    And the fishing date is "2026-05-31"
    And the fish species is "snoekbaars"
    When checking if the exemption applies
    Then the exemption should be granted

  Scenario: Exemption does not apply for baars before the last Saturday in May
    Given the year is 2026
    And the fishing date is "2026-05-20"
    And the fish species is "baars"
    When checking if the exemption applies
    Then the exemption should not be granted

  Scenario: Exemption does not apply for snoekbaars after May 31st
    Given the year is 2026
    And the fishing date is "2026-06-01"
    And the fish species is "snoekbaars"
    When checking if the exemption applies
    Then the exemption should not be granted

  Scenario: Exemption does not apply for non-specified fish species
    Given the year is 2026
    And the fishing date is the last Saturday in May 2026
    And the fish species is "karper"
    When checking if the exemption applies
    Then the exemption should not be granted

  Scenario: Exemption does not apply in IJsselmeer for baars
    Given the year is 2026
    And the fishing date is the last Saturday in May 2026
    And the fish species is "baars"
    And the water type is "IJsselmeer"
    When checking if the exemption applies
    Then the exemption should not be granted

  Scenario: Exemption applies in non-IJsselmeer waters for snoekbaars
    Given the year is 2026
    And the fishing date is "2026-05-30"
    And the fish species is "snoekbaars"
    And the water type is "Amstel"
    When checking if the exemption applies
    Then the exemption should be granted

  Scenario: Effective date is two days after publication
    Given the publication date is "2026-01-01"
    When calculating the effective date
    Then the effective date should be "2026-01-03"
