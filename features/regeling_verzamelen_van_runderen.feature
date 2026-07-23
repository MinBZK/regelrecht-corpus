# Source: BWBR0012542 - Regeling verzamelen van runderen
# No MvT documents found - scenarios derived from legal text

Feature: Regeling verzamelen van runderen

  Testscenario's afgeleid uit de juridische tekst van de regeling.

  Background:
    Given the regulation date is "2001-11-01"

  @erkenning
  Scenario: Erkenning geldigheid tussen regelingen
    Given een runderverzamelcentrum heeft een erkenning verkregen op grond van artikel 3.16 van de Regeling handel levende dieren en levende producten
    When artikel IV, eerste lid wordt toegepast
    Then geldt deze erkenning als een door de Minister verleende erkenning op grond van artikel 9b van de Regeling betreffende het bijeenbrengen van dieren 2000

  @eis_voldoen
  Scenario: Voldoen aan eisen per 1 november 2001
    Given een runderverzamelcentrum is erkend op grond van artikel 3.16 van de Regeling handel levende dieren en levende producten
    When de datum is "2001-11-01"
    Then voldoet het centrum aan de eis bedoeld in artikel 9c, onderdeel s

  @afstandseis_vrijgesteld
  Scenario: Vrijstelling afstandseis
    Given een runderverzamelcentrum is erkend op grond van artikel 3.16 van de Regeling handel levende dieren en levende producten
    When artikel IV, derde lid wordt toegepast
    Then is het centrum vrijgesteld van de afstandseis bedoeld in artikel 9c, onderdeel b, van de Regeling betreffende het bijeenbrengen van dieren 2000

  @inwerkingtreding
  Scenario: Onmiddellijke inwerkingtreding met uitzonderingen
    Given de regeling wordt bekendgemaakt op 8 juni 2001 om 19.00 uur
    When artikel V, eerste lid wordt toegepast
    Then treedt de regeling onmiddellijk in werking
    And artikel 9c, onderdelen e, q, r en s treedt NIET onmiddellijk in werking

  @inwerkingtreding_uitzonderingen
  Scenario: Inwerkingtreding artikel 9c onderdelen e,q,r,s
    Given de datum is "2001-11-01"
    When artikel V, tweede lid wordt toegepast
    Then treedt artikel 9c, onderdelen e, q, r en s in werking

  @verval_erkenning
  Scenario: Verval erkenning bij niet-voldoen
    Given een runderverzamelcentrum voldoet niet aan de eisen bedoeld in artikel 9c, onderdelen e, q, r en s op 1 november 2001
    When artikel V, tweede lid wordt toegepast
    Then vervalt de door de Minister verleende erkenning van rechtswege