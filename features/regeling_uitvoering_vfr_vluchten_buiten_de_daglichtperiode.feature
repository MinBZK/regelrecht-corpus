Feature: VFR flights outside daylight period (BWBR0006173 Artikel 1)
  As a pilot of a civil aircraft
  I want to perform VFR flights for environmental or agricultural purposes
  So that I can fly during the 15 minutes before dawn or after dusk

  Background:
    Given the regulation "Regeling uitvoering VFR-vluchten buiten de daglichtperiode" (BWBR0006173) is active

  Scenario: Flight starts 15 minutes before the start of daylight period
    Given the daylight period starts at "2023-10-20T06:00:00Z"
    And the daylight period ends at "2023-10-20T18:00:00Z"
    And the flight start time is "2023-10-20T05:45:00Z"
    Then permission is granted for VFR flight outside daylight period

  Scenario: Flight starts exactly at the start of daylight period
    Given the daylight period starts at "2023-10-20T06:00:00Z"
    And the daylight period ends at "2023-10-20T18:00:00Z"
    And the flight start time is "2023-10-20T06:00:00Z"
    Then permission is NOT granted for VFR flight outside daylight period

  Scenario: Flight starts 15 minutes after the end of daylight period
    Given the daylight period starts at "2023-10-20T06:00:00Z"
    And the daylight period ends at "2023-10-20T18:00:00Z"
    And the flight start time is "2023-10-20T18:15:00Z"
    Then permission is granted for VFR flight outside daylight period

  Scenario: Flight starts exactly at the end of daylight period
    Given the daylight period starts at "2023-10-20T06:00:00Z"
    And the daylight period ends at "2023-10-20T18:00:00Z"
    And the flight start time is "2023-10-20T18:00:00Z"
    Then permission is NOT granted for VFR flight outside daylight period

  Scenario: Flight starts during daylight period
    Given the daylight period starts at "2023-10-20T06:00:00Z"
    And the daylight period ends at "2023-10-20T18:00:00Z"
    And the flight start time is "2023-10-20T12:00:00Z"
    Then permission is NOT granted for VFR flight outside daylight period

  Scenario: Flight starts 30 minutes before the start of daylight period
    Given the daylight period starts at "2023-10-20T06:00:00Z"
    And the daylight period ends at "2023-10-20T18:00:00Z"
    And the flight start time is "2023-10-20T05:30:00Z"
    Then permission is NOT granted for VFR flight outside daylight period

  Scenario: Flight starts 30 minutes after the end of daylight period
    Given the daylight period starts at "2023-10-20T06:00:00Z"
    And the daylight period ends at "2023-10-20T18:00:00Z"
    And the flight start time is "2023-10-20T18:30:00Z"
    Then permission is NOT granted for VFR flight outside daylight period
