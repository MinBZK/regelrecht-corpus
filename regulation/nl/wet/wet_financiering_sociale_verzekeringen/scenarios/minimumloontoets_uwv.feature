Feature: Toets of iemand het minimumloon kan verdienen, Besluit SUWI artikel 3.5
  Als gemeente of als persoon in de doelgroep
  Wil ik weten wanneer het UWV iemand niet in staat acht het minimumloon te verdienen
  Zodat zichtbaar is waarop Wfsv artikel 38b lid 1 onderdeel a en e rusten

  # Toegevoegd 2026-10-09. Wfsv 38b lid 1 onderdeel a en e vragen een
  # vaststelling door het UWV dat iemand niet in staat is het minimumloon te
  # verdienen. Artikel 3.5 van het Besluit SUWI zegt hoe: het arbeidsvermogen
  # wordt getoetst aan drempelfuncties. Wie er één kan uitvoeren, eventueel met
  # aanpassingen, wordt geacht het minimumloon te kunnen verdienen (lid 7). Wie
  # er geen of maar een deel van één kan uitvoeren, niet, mits de beperkingen
  # nog ten minste zes maanden duren (lid 6).
  #
  # Wfsv 38b leest de vaststelling nog als samengesteld gegeven; deze scenario's
  # toetsen het besluit zelf.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario: Kan één drempelfunctie uitvoeren: geacht het minimumloon te kunnen verdienen
    Given the following parameters:
      | bsn                                       | 999993653 |
      | kan_een_drempelfunctie_volledig_uitvoeren | true      |
      | beperkingen_duren_ten_minste_zes_maanden  | true      |
    When I evaluate outputs "wordt_geacht_minimumloon_te_kunnen_verdienen, wordt_niet_geacht_minimumloon_te_kunnen_verdienen" of "besluit_suwi"
    Then the execution succeeds
    And output "wordt_geacht_minimumloon_te_kunnen_verdienen" is true
    And output "wordt_niet_geacht_minimumloon_te_kunnen_verdienen" is false

  Scenario: Geen volledige drempelfunctie en blijvende beperkingen: niet in staat
    Given the following parameters:
      | bsn                                       | 999993653 |
      | kan_een_drempelfunctie_volledig_uitvoeren | false     |
      | beperkingen_duren_ten_minste_zes_maanden  | true      |
    When I evaluate outputs "wordt_geacht_minimumloon_te_kunnen_verdienen, wordt_niet_geacht_minimumloon_te_kunnen_verdienen" of "besluit_suwi"
    Then the execution succeeds
    And output "wordt_geacht_minimumloon_te_kunnen_verdienen" is false
    And output "wordt_niet_geacht_minimumloon_te_kunnen_verdienen" is true

  Scenario: Geen volledige drempelfunctie maar korte beperkingen: het artikel beslist niet
    Given the following parameters:
      | bsn                                       | 999993653 |
      | kan_een_drempelfunctie_volledig_uitvoeren | false     |
      | beperkingen_duren_ten_minste_zes_maanden  | false     |
    When I evaluate outputs "wordt_geacht_minimumloon_te_kunnen_verdienen, wordt_niet_geacht_minimumloon_te_kunnen_verdienen" of "besluit_suwi"
    Then the execution succeeds
    And output "wordt_geacht_minimumloon_te_kunnen_verdienen" is false
    And output "wordt_niet_geacht_minimumloon_te_kunnen_verdienen" is false
