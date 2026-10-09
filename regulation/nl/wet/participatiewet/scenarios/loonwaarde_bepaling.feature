Feature: Loonwaarde, Besluit loonkostensubsidie en minimumbedragen studietoeslag Participatiewet 2021
  Als gemeente
  Wil ik zien hoe de loonwaarde volgt uit het rapport van de loonwaardedeskundige
  Zodat het percentage onder de loonkostensubsidie herleidbaar is

  # Toegevoegd 2026-10-09. Artikel 3 lid 2: de loonwaarde is de som van de
  # arbeidsprestaties per hoofdtaak, rekenkundig afgerond op hele procenten.
  # Artikel 5: per hoofdtaak AP = T * K * N * BT, voor maximaal vijf
  # hoofdtaken die samen 100 procent van de werktijd omvatten.
  #
  # Participatiewet 10d leest de loonwaarde als vastgesteld gegeven; deze
  # scenario's laten zien waar dat getal vandaan komt.

  Background:
    Given the calculation date is "2026-07-01"

  Scenario: Eén hoofdtaak, loonwaarde 60 procent zoals bij Koen
    # 80 * 100 * 75 * 100 / 100^3 = 60
    Given the following parameters:
      | bsn        | 999993653 |
      | hoofdtaken | [{"tempo_percentage":80,"kwaliteit_percentage":100,"netto_werktijd_percentage":75,"bijdrage_werktijd_percentage":100}] |
    When I evaluate outputs "loonwaarde_percentage, hoofdtaken_voldoen_aan_artikel_5_lid_1" of "besluit_loonkostensubsidie_en_minimumbedragen_studietoeslag_participatiewet_2021"
    Then the execution succeeds
    And output "loonwaarde_percentage" equals 60
    And output "hoofdtaken_voldoen_aan_artikel_5_lid_1" is true

  Scenario: Twee hoofdtaken, afgerond op hele procenten
    # 90 * 95 * 80 * 60 / 100^3 = 41,04 en 70 * 100 * 90 * 40 / 100^3 = 25,2;
    # samen 66,24, afgerond 66.
    Given the following parameters:
      | bsn        | 999993653 |
      | hoofdtaken | [{"tempo_percentage":90,"kwaliteit_percentage":95,"netto_werktijd_percentage":80,"bijdrage_werktijd_percentage":60},{"tempo_percentage":70,"kwaliteit_percentage":100,"netto_werktijd_percentage":90,"bijdrage_werktijd_percentage":40}] |
    When I evaluate outputs "loonwaarde_percentage, hoofdtaken_voldoen_aan_artikel_5_lid_1" of "besluit_loonkostensubsidie_en_minimumbedragen_studietoeslag_participatiewet_2021"
    Then the execution succeeds
    And output "loonwaarde_percentage" equals 66
    And output "hoofdtaken_voldoen_aan_artikel_5_lid_1" is true

  Scenario: Hoofdtaken die niet samen 100 procent van de werktijd omvatten
    Given the following parameters:
      | bsn        | 999993653 |
      | hoofdtaken | [{"tempo_percentage":80,"kwaliteit_percentage":100,"netto_werktijd_percentage":75,"bijdrage_werktijd_percentage":90}] |
    When I evaluate outputs "hoofdtaken_voldoen_aan_artikel_5_lid_1" of "besluit_loonkostensubsidie_en_minimumbedragen_studietoeslag_participatiewet_2021"
    Then the execution succeeds
    And output "hoofdtaken_voldoen_aan_artikel_5_lid_1" is false
