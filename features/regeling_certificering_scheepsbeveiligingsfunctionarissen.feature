# Source: BWBR0023729 (Regeling certificering scheepsbeveiligingsfunctionarissen)
# No Memorie van Toelichting documents found for this regulation.
# Scenarios are derived from the procedural rules in the regulation itself.

Feature: Regeling certificering scheepsbeveiligingsfunctionarissen
  Testscenario's afgeleid uit de regeling tekst voor certificering van scheepsbeveiligingsfunctionarissen.

  Background:
    Given the calculation date is "2013-08-20"

  # === Artikel 2: Afgifte van certificaat ===

  Scenario: Certificaat afgifte bij voldoende STCW-Verdrag VI/5 en erkende opleiding
    Given een aanvrager voldoet aan voorschrift VI/5, paragraaf 1.1, van de bijlage bij het STCW-Verdrag
    And de aanvrager heeft met goed gevolg een door de minister erkende opleiding en training afgerond die voldoet aan sectie A-VI/5, paragrafen 1 tot en met 4, van de STCW-Code
    When het certificaat scheepsbeveiligingsfunctionaris wordt aangevraagd according to Artikel 2
    Then wordt het certificaat scheepsbeveiligingsfunctionaris afgifte

  # === Artikel 3: Verplichting certificaat ===

  Scenario: Bemanningslid als scheepsbeveiligingsfunctionaris moet certificaat hebben
    Given een bemanningslid is aangesteld als scheepsbeveiligingsfunctionaris
    And de datum is na 1 juli 2009
    When controleren of het bemanningslid in het bezit is van het certificaat according to Artikel 3.1
    Then is het bemanningslid in het bezit van het certificaat scheepsbeveiligingsfunctionaris

  Scenario: Overgangsrecht voor certificaat tot 1 juli 2009
    Given een bemanningslid is aangesteld als scheepsbeveiligingsfunctionaris
    And het bemanningslid heeft voor 1 januari 2008 een training als scheepsbeveiligingsfunctionaris afgerond
    And de datum is voor 1 juli 2009
    When controleren of voldoen wordt aan de overgangsregeling according to Artikel 3.2
    Then mag het bemanningslid als scheepsbeveiligingsfunctionaris zijn aangesteld
