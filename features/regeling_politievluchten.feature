Feature: Police flight lighting exemptions (BWBR0007095 Artikel 1)
  As a police aircraft operator
  I want to ensure compliance with Article 1 of Regeling politievluchten
  So that flights can proceed when standard lighting rules cannot be followed

  Background:
    Given the regulation "Regeling politievluchten" (BWBR0007095) is active
    And the flight involves a police aircraft where standard lighting rules per Article 28 of Luchtverkeersreglement cannot be followed

  Scenario: Flight with disabled lights requires service order (condition a)
    Given a police aircraft flight where lighting rules cannot be followed
    When the flight is documented in a "dienstopdracht" (service order)
    Then the flight satisfies Article 1 condition (a)

  Scenario: Flight requires prior coordination with air traffic services (condition b)
    Given a police aircraft flight where lighting rules cannot be followed
    When the flight is pre-coordinated with the relevant "luchtverkeersdienst" or "luchtverkeersdiensten"
    And the air traffic service imposes procedural conditions
    Then the flight satisfies Article 1 condition (b)

  Scenario: Flight plan must note intention to disable lights (condition c)
    Given a police aircraft flight where lighting rules cannot be followed
    When the flight plan includes a notification of the intention to disable required lights during the flight or part thereof
    Then the flight satisfies Article 1 condition (c)

  Scenario: Aircraft must have functional SSR-transponder (condition d)
    Given a police aircraft flight where lighting rules cannot be followed
    When the aircraft is equipped with a functional SSR-transponder
    And the transponder supports 4096 code possibilities in mode A
    And the transponder supports automatic altitude reporting in mode C
    Then the flight satisfies Article 1 condition (d)

  Scenario: All conditions must be met for exemption
    Given a police aircraft flight where lighting rules cannot be followed
    When condition (a) is satisfied
    And condition (b) is satisfied
    And condition (c) is satisfied
    And condition (d) is satisfied
    Then the flight may proceed under Article 1 exemption

  Scenario: Missing any condition disqualifies exemption
    Given a police aircraft flight where lighting rules cannot be followed
    When condition (a) is satisfied
    But condition (b) is not satisfied
    Then the flight does NOT qualify for Article 1 exemption
