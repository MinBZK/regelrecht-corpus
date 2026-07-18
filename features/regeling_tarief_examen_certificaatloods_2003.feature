# Source: BWBR0014425 (Regeling tarief examen certificaatloods 2003)
# No Memorie van Toelichting documents found for this regulation.
# Scenarios are derived from the regulation text itself.

Feature: Regeling tarief examen certificaatloods 2003
  Testscenario's afgeleid uit de regeling tekst voor tarieven van examens voor certificaatloods.

  Background:
    Given the calculation date is "2003-01-01"

  # === Artikel 1: Tarief voor examen deelname ===

  Scenario: Vergoeding verschuldigd voor deelname aan examen
    Given een candidate neemt deel aan het examen ter verkrijging van een verklaring als bedoeld in artikel 5, tweede lid, van de Loodsenwet
    When het tarief wordt berekend according to Artikel 1
    Then is de vergoeding 20700 eurocent
