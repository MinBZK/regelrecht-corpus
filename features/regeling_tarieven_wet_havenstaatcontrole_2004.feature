# Source: BWBR0016089 (Regeling tarieven Wet havenstaatcontrole 2004)
# No Memorie van Toelichting documents found for this regulation.
# Scenarios are derived from the regulation text itself.

Feature: Regeling tarieven Wet havenstaatcontrole 2004
  Testscenario's afgeleid uit de regeling tekst voor tarieven van de Wet havenstaatcontrole.

  Background:
    Given the calculation date is "2004-01-01"

  # === Artikel 1: Tarief voor vergoeding (artikel 14, eerste lid, Wet havenstaatcontrole) ===

  Scenario: Tarief voor vergoeding bedoeld in artikel 14, eerste lid, van de Wet havenstaatcontrole
    Given het tarief wordt berekend according to Artikel 1
    Then is de tarief_artikel_14_eerste_lid 91800 eurocent

  # === Artikel 2: Tarief voor vergoeding (artikel 14, tweede lid, Wet havenstaatcontrole) ===

  Scenario: Tarief voor vergoeding bedoeld in artikel 14, tweede lid, van de Wet havenstaatcontrole
    Given het tarief wordt berekend according to Artikel 2
    Then is de tarief_artikel_14_tweede_lid 33900 eurocent