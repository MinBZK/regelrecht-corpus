Feature: Besluit loondispensatie Wajong artikel 4, de ingangsdatum
  "Loondispensatie wordt steeds verleend met ingang van de eerste dag van de
  maand waarin deze is aangevraagd."

  # Toegevoegd 2026-11-04. De uitkomst ingangsdatum_loondispensatie is de
  # eerste dag van de maand van de aanvraag, ook bij een aanvraag op de
  # eerste of de laatste dag van de maand. Peildatum 1 juli 2026.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario Outline: Aanvraag op <datum_aanvraag> geeft ingang op <ingangsdatum> (artikel 4)
    Given the following parameters:
      | bsn                            | 999990612        |
      | datum_aanvraag_loondispensatie | <datum_aanvraag> |
    When I evaluate outputs "ingangsdatum_loondispensatie" of "besluit_loondispensatie_wajong"
    Then the execution succeeds
    And output "ingangsdatum_loondispensatie" equals "<ingangsdatum>"

    Examples:
      | datum_aanvraag | ingangsdatum | toelichting                         |
      | 2026-06-15     | 2026-06-01   | midden in de maand                  |
      | 2026-06-01     | 2026-06-01   | eerste dag van de maand             |
      | 2026-05-31     | 2026-05-01   | laatste dag van de maand            |
      | 2028-02-29     | 2028-02-01   | laatste dag van februari, schrikkeljaar |
