Feature: De aanvraagtermijn van de doelgroepverklaring, Wtl artikel 2.7 lid 1
  "De doelgroepverklaring wordt aangevraagd binnen drie maanden na aanvang
  van de dienstbetrekking."

  # Toegevoegd 2026-11-04. De uitkomst
  # uiterste_datum_aanvraag_doelgroepverklaring is de overeenkomstige dag drie
  # maanden na de aanvang. Bestaat die dag niet in de doelmaand, dan geeft
  # DATE_ADD de laatste dag van die maand: 30 november wordt 28 februari, of
  # 29 februari in een schrikkeljaar. Verlenging door de Algemene
  # termijnenwet is niet gemodelleerd. Peildatum 1 juli 2026.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario Outline: Aanvang op <aanvang> geeft als uiterste aanvraagdatum <uiterste_datum> (artikel 2.7 lid 1)
    Given the following parameters:
      | datum_aanvang_dienstbetrekking | <aanvang> |
    When I evaluate outputs "uiterste_datum_aanvraag_doelgroepverklaring" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    And output "uiterste_datum_aanvraag_doelgroepverklaring" equals "<uiterste_datum>"

    Examples:
      | aanvang    | uiterste_datum | toelichting                                  |
      | 2026-06-15 | 2026-09-15     | overeenkomstige dag                          |
      | 2026-11-30 | 2027-02-28     | geen 30 februari: laatste dag van februari   |
      | 2027-11-30 | 2028-02-29     | idem, schrikkeljaar                          |
      | 2026-12-31 | 2027-03-31     | over de jaargrens heen                       |
