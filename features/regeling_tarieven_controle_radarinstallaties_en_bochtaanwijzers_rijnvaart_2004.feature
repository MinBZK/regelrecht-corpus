# Source: BWBR0016078 (Regeling tarieven controle radarinstallaties en bochtaanwijzers Rijnvaart 2004)
# No Memorie van Toelichting found via Overheid SRU API or official sources.
# Scenarios derived directly from Artikel 1 of the law text.

Feature: Regeling tarieven controle radarinstallaties en bochtaanwijzers Rijnvaart 2004 — tariefberekening

  Testscenario's afgeleid uit de artikelen van Regeling tarieven controle radarinstallaties en bochtaanwijzers Rijnvaart 2004 (BWBR0016078).

  Background:
    Given the regulatory framework is "Regeling tarieven controle radarinstallaties en bochtaanwijzers Rijnvaart 2004"
    And the valid_from date is "2004-01-01"

  # === Artikel 1: Vergoeding voor controle radarinstallaties en bochtaanwijzers ===

  @artikel_1
  Scenario: Periodieke inspectie en afgifte van verklaring
    # Bron: Artikel 1, lid a
    Given inspectietype is "periodieke_inspectie"
    When de vergoeding wordt berekend according to Artikel 1
    Then is de vergoeding "16100" eurocent

  @artikel_1
  Scenario: Herinspectie als gevolg van geconstateerde gebreken
    # Bron: Artikel 1, lid b
    Given inspectietype is "herinspectie_gebreken"
    When de vergoeding wordt berekend according to Artikel 1
    Then is de vergoeding "13000" eurocent
