# Source: BWBR0016088 (Regeling tarief ontheffing vaarbewijsplicht 2004)
# No Memorie van Toelichting documents found for this regulation.
# Scenarios are derived from the regulation text itself.

@regeling_tarief_ontheffing_vaarbewijsplicht_2004
Feature: Regeling tarief ontheffing vaarbewijsplicht 2004
  Testscenario's afgeleid uit de regeling tekst voor tarieven van ontheffing vaarbewijsplicht.

  Background:
    Given the calculation date is "2004-01-01"

  # === Artikel 1: Kosten van behandeling ontheffingsaanvraag ===

  Scenario: Vergoeding verschuldigd voor behandeling ontheffingsaanvraag vaarbewijsplicht
    Given een aanvrager Seuyn diens een ontheffing van de verplichting tot het voorzien zijn van een geldig vaarbewijs
    When het tarief wordt berekend according to Artikel 1
    Then is de vergoeding 14100 eurocent
