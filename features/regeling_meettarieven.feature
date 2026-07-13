# Source: BWBR0028965 (Regeling meettarieven)
# No Memorie van Toelichting found via Overheid SRU API or official sources.
# Scenarios derived directly from the law text.

Feature: Regeling meettarieven — tariefberekening voor elektriciteit en gas

  Testscenario's afgeleid uit de artikelen van Regeling meettarieven (BWBR0028965).

  Background:
    Given the regulatory framework is "Regeling meettarieven"
    And the valid_from date is "2014-08-01"

  # === Artikel 1: Tariefberekening elektriciteitsmeting ===

  @artikel_1
  Scenario: Tariefberekening elektriciteit met inflatiecorrectie
    # Bron: Artikel 1, lid 1 en 2
    Given een netbeheerder brengt tarieven in rekening voor meting van elektriciteit
    And het voorafgaande kalenderjaar tarief voor afnemers bedraagt €50,00
    And de consumentenprijsindex (CPI) in de vierde maand voorafgaand aan het huidige jaar is 110
    And de CPI in de zestiende maand voorafgaand aan het huidige jaar is 100
    When het tarief voor het huidige jaar wordt berekend according to Artikel 1
    Then is het nieuwe tarief €55,00

  @artikel_1
  Scenario: Tariefberekening elektriciteit zonder inflatie
    # Bron: Artikel 1, lid 1 en 2
    Given een netbeheerder brengt tarieven in rekening voor meting van elektriciteit
    And het voorafgaande kalenderjaar tarief voor afnemers bedraagt €100,00
    And de consumentenprijsindex (CPI) in de vierde maand voorafgaand aan het huidige jaar is 100
    And de CPI in de zestiende maand voorafgaand aan het huidige jaar is 100
    When het tarief voor het huidige jaar wordt berekend according to Artikel 1
    Then is het nieuwe tarief €100,00

  # === Artikel 2: Tariefberekening gasmeting ===

  @artikel_2
  Scenario: Tariefberekening gas met inflatiecorrectie
    # Bron: Artikel 2, lid 1 en 2
    Given een netbeheerder brengt tarieven in rekening voor meting van gas
    And het voorafgaande kalenderjaar tarief voor afnemers bedraagt €75,00
    And de consumentenprijsindex (CPI) in de vierde maand voorafgaand aan het huidige jaar is 115
    And de CPI in de zestiende maand voorafgaand aan het huidige jaar is 100
    When het tarief voor het huidige jaar wordt berekend according to Artikel 2, lid 1
    Then is het nieuwe tarief €86,25

  @artikel_2
  Scenario: Tariefberekening gas voor jaar 2012 (speciale regel)
    # Bron: Artikel 2, lid 3
    Given het kalenderjaar is 2012
    And het gewogen gemiddelde tarief van alle netbeheerders voor afnemers in 2005 bedraagt €60,00
    And de consumentenprijsindex (CPI) in augustus 2011 is 112
    And de CPI in augustus 2005 is 100
    When het tarief voor 2012 wordt berekend according to Artikel 2, lid 3
    Then is het tarief voor 2012 €67,20

  # === Artikel 4a: Verschilbepaling door ACM ===

  @artikel_4a
  Scenario: ACM stelt verschil vast tussen inkomsten en kosten voor elektriciteit (2011-2013)
    # Bron: Artikel 4a, lid 1 en 2
    Given de Autoriteit Consument en Markt (ACM) voert toezicht uit
    And het kalenderjaar is 2012
    And de inkomsten uit tarieven voor elektriciteitsmeting bedragen €1.000.000
    And de kosten voor elektriciteitsmeting bedragen €800.000
    When de ACM het verschil vaststelt according to Artikel 4a, lid 1
    Then is het vastgestelde verschil €200.000

  @artikel_4a
  Scenario: ACM stelt verschil vast tussen inkomsten en kosten voor gas (2012-2013)
    # Bron: Artikel 4a, lid 2
    Given de Autoriteit Consument en Markt (ACM) voert toezicht uit
    And het kalenderjaar is 2012
    And de inkomsten uit tarieven voor gasmeting bedragen €1.500.000
    And de kosten voor gasmeting bedragen €1.200.000
    When de ACM het verschil vaststelt according to Artikel 4a, lid 2
    Then is het vastgestelde verschil €300.000

  @artikel_4a
  Scenario: ACM stelt gestandaardiseerde activawaarde vast
    # Bron: Artikel 4a, lid 3
    Given de Autoriteit Consument en Markt (ACM) voert toezicht uit
    And een netbeheerder heeft activiteiten genoemd in Artikel 30a van de Elektriciteitswet 1998
    And de kapitaalkosten voor deze activiteiten moeten worden bepaald
    When de ACM de gestandaardiseerde activawaarde vaststelt according to Artikel 4a, lid 3
    Then is de gestandaardiseerde activawaarde vastgesteld voor kapitaalkostenberekening

  # === Artikel 5: Inwerkingtreding ===

  @artikel_5
  Scenario: Inwerkingtreding Artikel 1
    # Bron: Artikel 5, lid 1
    Given Artikel 1 van Regeling meettarieven
    When de regeling in werking treedt
    Then treedt Artikel 1 in werking met ingang van 1 januari 2011

  @artikel_5
  Scenario: Inwerkingtreding Artikel 2
    # Bron: Artikel 5, lid 2
    Given Artikel 2 van Regeling meettarieven
    When de regeling in werking treedt
    Then treedt Artikel 2 in werking met ingang van 1 januari 2012

  @artikel_5
  Scenario: Inwerkingtreding Artikel 4a
    # Bron: Artikel 5, lid 3
    Given Artikel 4a van Regeling meettarieven
    When de regeling in werking treedt
    Then treedt Artikel 4a in werking met ingang van 1 januari 2013

  # === Artikel 6: Citeertitel ===

  @artikel_6
  Scenario: Citeertitel van de regeling
    # Bron: Artikel 6
    When deze regeling wordt aangehaald
    Then wordt de regeling aangehaald als "Regeling meettarieven"
