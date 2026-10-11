Feature: Aanspraak per uur bij loondispensatie, Besluit loondispensatie Wajong artikel 3
  Als werkgever van een werknemer met loondispensatie
  Wil ik weten welke beloning per uur de werknemer na de vermindering toekomt
  Zodat zichtbaar is wat Wajong artikel 2:20 met "naar evenredigheid" bedoelt

  # Toegevoegd 2026-10-09. Wajong 2:20 lid 1 zegt dat het UWV de aanspraak op
  # beloning "naar evenredigheid" vermindert. Artikel 3 van het Besluit
  # loondispensatie Wajong geeft de rekenvorm: de aanspraak per uur is een
  # percentage van het minimumloon per uur. Het percentage stelt het UWV vast
  # uit de loonwaarde; bij Sadee is dat 70.
  #
  # Het minimumloon per uur komt uit de Wet minimumloon, artikel 8 met de
  # herziening per 1 juli 2026: 1499 eurocent. 70 procent daarvan is 1049,3
  # eurocent. Het artikel noemt geen afronding.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario: Sadee, loonwaarde 70 procent
    Given the following parameters:
      | bsn                              | 999990100 |
      | vastgesteld_aanspraakpercentage_minimumloon | 70        |
    When I evaluate outputs "aanspraak_beloning_per_uur_eurocent" of "besluit_loondispensatie_wajong"
    Then the execution succeeds
    And output "aanspraak_beloning_per_uur_eurocent" equals 1049.3

  Scenario: Geen vermindering bij 100 procent
    Given the following parameters:
      | bsn                              | 999990100 |
      | vastgesteld_aanspraakpercentage_minimumloon | 100       |
    When I evaluate outputs "aanspraak_beloning_per_uur_eurocent" of "besluit_loondispensatie_wajong"
    Then the execution succeeds
    And output "aanspraak_beloning_per_uur_eurocent" equals 1499

  # Toegevoegd 2026-10-11, artikel 6 van het besluit: loondispensatie eindigt
  # bij achttien jaar voor wie dan geen Wajong-arbeidsondersteuning heeft.
  Scenario: Zestien jaar zonder Wajong-arbeidsondersteuning, de dispensatie eindigt bij achttien
    Given the following parameters:
      | bsn                                       | 999990500  |
      | geboortedatum                             | 2010-01-01 |
      | heeft_recht_op_arbeidsondersteuning_wajong | false     |
    When I evaluate outputs "is_jonger_dan_achttien, loondispensatie_eindigt_bij_achttien" of "besluit_loondispensatie_wajong"
    Then the execution succeeds
    And output "is_jonger_dan_achttien" is true
    And output "loondispensatie_eindigt_bij_achttien" is true

  Scenario: Volwassen Wajonger, artikel 6 speelt niet
    Given the following parameters:
      | bsn                                       | 999990100  |
      | geboortedatum                             | 1996-05-14 |
      | heeft_recht_op_arbeidsondersteuning_wajong | true      |
    When I evaluate outputs "is_jonger_dan_achttien, loondispensatie_eindigt_bij_achttien" of "besluit_loondispensatie_wajong"
    Then the execution succeeds
    And output "is_jonger_dan_achttien" is false
    And output "loondispensatie_eindigt_bij_achttien" is false
