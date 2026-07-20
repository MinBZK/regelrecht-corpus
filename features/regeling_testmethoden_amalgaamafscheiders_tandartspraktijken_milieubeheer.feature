# Source: BWBR0009188 (Regeling testmethoden amalgaamafscheiders tandartspraktijken milieubeheer)
# No Memorie van Toelichting found via Overheid SRU API or official sources.
# Scenarios derived directly from the law text and existing machine_readable sections.

Feature: Regeling testmethoden amalgaamafscheiders tandartspraktijken milieubeheer — testmethoden en rendementsberekening

  Testscenario's afgeleid uit de artikelen van Regeling testmethoden amalgaamafscheiders tandartspraktijken milieubeheer (BWBR0009188).

  Background:
    Given the regulatory framework is "Regeling testmethoden amalgaamafscheiders tandartspraktijken milieubeheer"
    And the valid_from date is "1998-02-01"

  # === Artikel 7: Samenstelling standaard testmonster ===

  @artikel_7
  Scenario: Totale massa van het standaard testmonster
    # Bron: Artikel 7
    Given de samenstelling van het testmonster is als volgt:
      | fractie | massa (gram) |
      | fractie 1 | 5 |
      | fractie 2 | 2.5 |
      | fractie 3 | 1.5 |
      | fractie 4 | 1 |
    When de totale massa (A) van het testmonster wordt berekend according to Artikel 7
    Then is de totale massa A 10 gram

  # === Artikel 12: Meting van doorgelaten amalgaam ===

  @artikel_12
  Scenario: Meting van massa amalgaam dat de afscheider is gepasseerd
    # Bron: Artikel 12
    Given het water-amalgaam mengsel dat de afscheider verlaat is gefilterd en gedroogd
    And de massa amalgaam dat de afscheider is gepasseerd bedraagt 0.5 gram
    When de massa (B) van het doorgelaten amalgaam wordt gemeten according to Artikel 12
    Then is de massa B 0.5 gram
    And is de waarde van B op 3 decimalen nauwkeurig (untranslatable: precisie-eis)

  # === Artikel 13: Berekening afscheidingsrendement ===

  @artikel_13
  Scenario: Berekening afscheidingsrendement met A=10 gram en B=0.5 gram
    # Bron: Artikel 13, formule η = ((A-B)/A) * 100%
    Given de totale massa van het testmonster (A) is 10 gram
    And de massa amalgaam dat de afscheider is gepasseerd (B) is 0.5 gram
    When het afscheidingsrendement (η) wordt berekend according to Artikel 13
    Then is het afscheidingsrendement 95%

  @artikel_13
  Scenario: Berekening afscheidingsrendement met A=10 gram en B=2 gram
    # Bron: Artikel 13
    Given de totale massa van het testmonster (A) is 10 gram
    And de massa amalgaam dat de afscheider is gepasseerd (B) is 2 gram
    When het afscheidingsrendement (η) wordt berekend according to Artikel 13
    Then is het afscheidingsrendement 80%

  @artikel_13
  Scenario: Berekening afscheidingsrendement met A=10 gram en B=0 gram
    # Bron: Artikel 13
    Given de totale massa van het testmonster (A) is 10 gram
    And de massa amalgaam dat de afscheider is gepasseerd (B) is 0 gram
    When het afscheidingsrendement (η) wordt berekend according to Artikel 13
    Then is het afscheidingsrendement 100%

  @artikel_13
  Scenario: Gemiddeld rendement uit 3 testen bij vulgraad 0%
    # Bron: Artikel 13, lid 2 (untranslatable: aggregatie over meervoudige testen)
    Given er worden 3 testen uitgevoerd bij vulgraad 0%
    And de afscheidingsrendementen van de 3 testen zijn 95%, 96%, en 97%
    When het gemiddelde rendement bij vulgraad 0% wordt bepaald according to Artikel 13
    Then is het gemiddelde rendement 96% (untranslatable: gemiddelde berekening formatie)

  @artikel_13
  Scenario: Gemiddeld rendement uit 3 testen bij vulgraad 100%
    # Bron: Artikel 13, lid 2 (untranslatable: aggregatie over meervoudige testen)
    Given er worden 3 testen uitgevoerd bij vulgraad 100%
    And de afscheidingsrendementen van de 3 testen zijn 90%, 92%, en 91%
    When het gemiddelde rendement bij vulgraad 100% wordt bepaald according to Artikel 13
    Then is het gemiddelde rendement 91% (untranslatable: gemiddelde berekening)

  @artikel_13
  Scenario: Uitvoeren van blanco proef
    # Bron: Artikel 11 en 13, lid 2
    Given de amalgaamafvalhouder is tot 70% van de maximale vulhoogte volgegoten met een harde, niet waterdoorlaatbare kunststof
    When de blanco proef wordt uitgevoerd according to Artikel 11
    Then is het gemeten rendement de referentiewaarde voor de blanco proef

  # === Gecombineerd Scenario: Volledige testprocedure ===

  @artikel_7 @artikel_12 @artikel_13
  Scenario: Volledige testprocedure van testmonster tot rendementsbepaling
    # Bron: Artikelen 7, 12, en 13
    Given de totale massa van het testmonster (A) is 10 gram according to Artikel 7
    And de massa amalgaam dat de afscheider is gepasseerd (B) is 0.3 gram according to Artikel 12
    When het afscheidingsrendement (η) wordt berekend according to Artikel 13
    Then is het afscheidingsrendement 97%
    And is de waarde van B op 3 decimalen nauwkeurig (untranslatable: precisie-eis)
