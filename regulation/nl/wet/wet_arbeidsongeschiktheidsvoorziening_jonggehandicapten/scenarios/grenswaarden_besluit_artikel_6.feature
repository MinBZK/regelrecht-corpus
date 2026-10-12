Feature: Besluit loondispensatie Wajong artikel 6, de grens van achttien jaar
  Grensscenario's, toegevoegd op 12 oktober 2026 na een mutatietest van de
  modellen: voor elke vergelijking die geen scenario op de grens zelf had,
  staat hier het geval precies op de grens en het geval er net naast.
  Peildatum 1 juli 2026; parameterblok uit loondispensatie_aanspraak.

  Scenario: Op de achttiende verjaardag is de werknemer niet meer jonger dan achttien (artikel 6)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                        | 999990612 |
      | geboortedatum                              | 2008-07-01 |
      | heeft_recht_op_arbeidsondersteuning_wajong | false |
    When I evaluate outputs "is_jonger_dan_achttien, loondispensatie_eindigt_bij_achttien" of "besluit_loondispensatie_wajong"
    Then the execution succeeds
    And output "is_jonger_dan_achttien" is false
    And output "loondispensatie_eindigt_bij_achttien" is false

  Scenario: Eén dag vóór de achttiende verjaardag is de werknemer nog jonger dan achttien (artikel 6)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                        | 999990612 |
      | geboortedatum                              | 2008-07-02 |
      | heeft_recht_op_arbeidsondersteuning_wajong | false |
    When I evaluate outputs "is_jonger_dan_achttien, loondispensatie_eindigt_bij_achttien" of "besluit_loondispensatie_wajong"
    Then the execution succeeds
    And output "is_jonger_dan_achttien" is true
    And output "loondispensatie_eindigt_bij_achttien" is true
