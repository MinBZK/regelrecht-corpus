Feature: ZW-dagloon, Dagloonbesluit werknemersverzekeringen artikel 12e
  Als werkgever met een no-riskpolis
  Wil ik weten over welk dagloon het ziekengeld wordt berekend
  Zodat zichtbaar is wat 70 procent van het dagloon in Ziektewet 29b betekent

  # Toegevoegd 2026-10-09. Het dagloon is (A - B + C) / D: het loon in de
  # referteperiode, min de daarin uitbetaalde opgebouwde vakantiebijslag, plus
  # de daarin opgebouwde vakantiebijslag, gedeeld door 261 dagloondagen. Begon
  # de dienstbetrekking pas na de aanvang van de referteperiode, zoals bij Koen
  # en Sadee, dan deelt het besluit door het aantal dagloondagen sinds de
  # aanvang.
  #
  # Deze scenario's rekenen met ronde voorbeeldbedragen, niet met de lonen van
  # Koen en Sadee. Ziektewet 29b leest het dagloon nog als gegeven; de koppeling
  # met dit artikel volgt apart.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario: Een heel jaar in dienst: D is 261
    Given the following parameters:
      | bsn                                                    | 999990100 |
      | loon_referteperiode_eurocent                           | 3132000   |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent    | 0         |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent     | 250560    |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode | false     |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking     | null      |
    When I evaluate outputs "aantal_dagloondagen_d, zw_dagloon_eurocent" of "dagloonbesluit_werknemersverzekeringen"
    Then the execution succeeds
    And output "aantal_dagloondagen_d" equals 261
    And output "zw_dagloon_eurocent" equals 12960

  Scenario: Een starter: D is het aantal dagloondagen sinds de aanvang
    Given the following parameters:
      | bsn                                                    | 999990100 |
      | loon_referteperiode_eurocent                           | 1044000   |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent    | 0         |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent     | 83520     |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode | true      |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking     | 87        |
    When I evaluate outputs "aantal_dagloondagen_d, zw_dagloon_eurocent" of "dagloonbesluit_werknemersverzekeringen"
    Then the execution succeeds
    And output "aantal_dagloondagen_d" equals 87
    And output "zw_dagloon_eurocent" equals 12960

  Scenario: Een starter zonder opgave van het aantal dagloondagen
    Given the following parameters:
      | bsn                                                    | 999990100 |
      | loon_referteperiode_eurocent                           | 1044000   |
      | uitbetaalde_vakantiebijslag_referteperiode_eurocent    | 0         |
      | opgebouwde_vakantiebijslag_referteperiode_eurocent     | 83520     |
      | dienstbetrekking_aangevangen_na_aanvang_referteperiode | true      |
      | aantal_dagloondagen_sinds_aanvang_dienstbetrekking     | null      |
    When I evaluate outputs "aantal_dagloondagen_d, zw_dagloon_eurocent" of "dagloonbesluit_werknemersverzekeringen"
    Then the execution succeeds
    And output "zw_dagloon_eurocent" is absent
