# Source: BWBR0005479 (Regeling grenswaarden voor PCP in afvalwater)
# No MvT (Memorie van Toelichting) documents found for this regulation
# Feature file created based on legal text analysis

Feature: Regeling grenswaarden voor PCP in afvalwater
  Testscenario's afgeleid uit de wettelijke bepalingen voor PCP-grenswaarden in afvalwater.

  Background:
    Given the calculation date is "2009-12-22"

  # === Artikel 2: Grenswaarden voor nieuw bedrijf ===

  Scenario: Grenswaarden voor nieuw bedrijf in bijlage I genoemde bedrijfstak met specifieke waarde
    # Bron: Artikel 2
    # Test: Nieuw bedrijf in sector met bekende bijlage I grenswaarde
    Given een nieuw bedrijf behorende tot bedrijfstak "chemische industrie"
    And bedrijfstak "chemische industrie" staat in bijlage I met grenzwaarde:
      | gewichtshoeveelheid | concentratie |
      | 0.5                 | 0.1          |
    When de grenswaarde voor PCP in afvalwater wordt bepaald volgens artikel 2
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "0.5 kg"
    And is de maximaal toelaatbare concentratie PCP "0.1 mg/L"

  Scenario: Grenswaarden voor nieuw bedrijf in bijlage I genoemde bedrijfstak met hoge waarde
    # Bron: Artikel 2
    # Test: Nieuw bedrijf in sector met hogere bijlage I grenswaarde
    Given een nieuw bedrijf behorende tot bedrijfstak "textielindustrie"
    And bedrijfstak "textielindustrie" staat in bijlage I met grenzwaarde:
      | gewichtshoeveelheid | concentratie |
      | 2.0                 | 0.5          |
    When de grenswaarde voor PCP in afvalwater wordt bepaald volgens artikel 2
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "2.0 kg"
    And is de maximaal toelaatbare concentratie PCP "0.5 mg/L"

  Scenario: Grenswaarden voor nieuw bedrijf niet in bijlage I genoemde bedrijfstak
    # Bron: Artikel 2
    # Test: Nieuw bedrijf in sector ZONDER bijlage I grenzwaarde -> gebruik beste bestaande technieken
    Given een nieuw bedrijf behorende tot bedrijfstak "overige industrie"
    And bedrijfstak "overige industrie" staat NIET in bijlage I
    And de besteaande technieken grenzwaarde voor PCP is:
      | gewichtshoeveelheid | concentratie |
      | 1.0                 | 0.2          |
    When de grenswaarde voor PCP in afvalwater wordt bepaald volgens artikel 2
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "1.0 kg"
    And is de maximaal toelaatbare concentratie PCP "0.2 mg/L"

  Scenario: Grenswaarden voor nieuw bedrijf met leeg bedrijfstak
    # Bron: Artikel 2
    # Test: Edge case - lege bedrijfstak
    Given een nieuw bedrijf behorende tot bedrijfstak ""
    And de besteaande technieken grenzwaarde voor PCP is:
      | gewichtshoeveelheid | concentratie |
      | 0.8                 | 0.15         |
    When de grenswaarde voor PCP in afvalwater wordt bepaald volgens artikel 2
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "0.8 kg"
    And is de maximaal toelaatbare concentratie PCP "0.15 mg/L"

  # === Artikel 3: Grenswaarden voor bestaand bedrijf ===

  Scenario: Grenswaarden voor bestaand bedrijf in bijlage I genoemde bedrijfstak
    # Bron: Artikel 3, onder a
    # Test: Bestaand bedrijf in sector met bekende bijlage I grenswaarde
    Given een bestaand bedrijf behorende tot bedrijfstak "chemische industrie"
    And bedrijfstak "chemische industrie" staat in bijlage I met grenzwaarde:
      | gewichtshoeveelheid | concentratie |
      | 0.5                 | 0.1          |
    When de grenswaarde voor PCP in afvalwater wordt bepaald volgens artikel 3
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "0.5 kg"
    And is de maximaal toelaatbare concentratie PCP "0.1 mg/L"

  Scenario: Grenswaarden voor bestaand bedrijf in bijlage I met andere waarde dan artikel 2
    # Bron: Artikel 3, onder a
    # Test: Bestaand bedrijf in sector met specifieke bijlage I waarde
    Given een bestaand bedrijf behorende tot bedrijfstak "textielindustrie"
    And bedrijfstak "textielindustrie" staat in bijlage I met grenzwaarde:
      | gewichtshoeveelheid | concentratie |
      | 1.5                 | 0.3          |
    When de grenswaarde voor PCP in afvalwater wordt bepaald volgens artikel 3
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "1.5 kg"
    And is de maximaal toelaatbare concentratie PCP "0.3 mg/L"

  Scenario: Grenswaarden voor bestaand bedrijf niet in bijlage I genoemde bedrijfstak
    # Bron: Artikel 3, onder b
    # Test: Bestaand bedrijf in sector ZONDER bijlage I grenzwaarde -> gebruik beste bestaande technieken per 1987-12-31
    Given een bestaand bedrijf behorende tot bedrijfstak "overige industrie"
    And bedrijfstak "overige industrie" staat NIET in bijlage I
    And de besteaande technieken grenzwaarde per 31 december 1987 voor PCP is:
      | gewichtshoeveelheid | concentratie |
      | 0.7                 | 0.12         |
    When de grenswaarde voor PCP in afvalwater wordt bepaald volgens artikel 3
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "0.7 kg"
    And is de maximaal toelaatbare concentratie PCP "0.12 mg/L"

  Scenario: Grenswaarden voor bestaand bedrijf met 1987 baseline
    # Bron: Artikel 3, onder b
    # Test: Expliciet testen van 1987-12-31 baseline voor bestaande bedrijven
    Given een bestaand bedrijf behorende tot bedrijfstak "metaalindustrie"
    And bedrijfstak "metaalindustrie" staat NIET in bijlage I
    And de besteaande technieken grenzwaarde per 31 december 1987 voor PCP is:
      | gewichtshoeveelheid | concentratie |
      | 0.9                 | 0.18         |
    When de grenswaarde voor PCP in afvalwater wordt bepaald op "2009-12-22"
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "0.9 kg"
    And is de maximaal toelaatbare concentratie PCP "0.18 mg/L"
    And is de grenzwaarde gebaseerd op de beste bestaande technieken per "1987-12-31"

  # === Artikel 4: Metingseisen ===

  Scenario: Metingseisen voldoet aan bijlage II
    # Bron: Artikel 4
    # Test: Meetmethode die voldoet aan bijlage II eisen
    Given de meetmethode heeft eigenschappen:
      | Eigenschap               | Waarde |
      | detectielimiet           | 0.01   |
      | nauwkeurigheid           | 95%    |
      | reproduteerbaarheid      | ja     |
    And bijlage II eist:
      | Eigenschap               | Waarde |
      | detectielimiet           | >=0.01 |
      | nauwkeurigheid           | >=90%  |
      | reproduteerbaarheid      | ja     |
    When de meting wordt uitgevoerd volgens de geselecteerde meetmethode
    Then voldoet de meetmethode aan de in bijlage II gestelde eisen

  Scenario: Metingseisen voldoet niet aan bijlage II door ontoereikende detectielimiet
    # Bron: Artikel 4
    # Test: Meetmethode met te hoge detectielimiet
    Given de meetmethode heeft eigenschappen:
      | Eigenschap               | Waarde |
      | detectielimiet           | 0.1    |
      | nauwkeurigheid           | 95%    |
      | reproduteerbaarheid      | ja     |
    And bijlage II eist:
      | Eigenschap               | Waarde |
      | detectielimiet           | >=0.01 |
      | nauwkeurigheid           | >=90%  |
      | reproduteerbaarheid      | ja     |
    When de meting wordt uitgevoerd volgens de geselecteerde meetmethode
    Then voldoet de meetmethode NIET aan de in bijlage II gestelde eisen

  Scenario: Metingseisen voldoet niet aan bijlage II door ontoereikende nauwkeurigheid
    # Bron: Artikel 4
    # Test: Meetmethode met te lage nauwkeurigheid
    Given de meetmethode heeft eigenschappen:
      | Eigenschap               | Waarde |
      | detectielimiet           | 0.01   |
      | nauwkeurigheid           | 85%    |
      | reproduteerbaarheid      | ja     |
    And bijlage II eist:
      | Eigenschap               | Waarde |
      | detectielimiet           | >=0.01 |
      | nauwkeurigheid           | >=90%  |
      | reproduteerbaarheid      | ja     |
    When de meting wordt uitgevoerd volgens de geselecteerde meetmethode
    Then voldoet de meetmethode NIET aan de in bijlage II gestelde eisen

  Scenario: Metingseisen voor nieuw en bestaand bedrijf
    # Bron: Artikel 4 (toepassing op artikelen 2 en 3)
    # Test: Beide bedrijfstypes moeten voldoen aan dezelfde metingseisen
    Given een meetmethode die voldoet aan bijlage II
    When de meting wordt uitgevoerd voor een nieuw bedrijf volgens artikel 2
    Then moeten de meetresultaten voldoen aan de in bijlage II gestelde eisen
    And when de meting wordt uitgevoerd voor een bestaand bedrijf volgens artikel 3
    Then moeten de meetresultaten voldoen aan de in bijlage II gestelde eisen

  # === Cross-artikel scenario's ===

  Scenario: Verschil tussen nieuw en bestaand bedrijf in dezelfde sector
    # Bron: Artikelen 2 en 3
    # Test: Vergelijking tussen nieuw en bestaand bedrijf in sector met bijlage I grenzwaarde
    Given bedrijfstak "chemische industrie" staat in bijlage I met grenzwaarde:
      | gewichtshoeveelheid | concentratie |
      | 0.5                 | 0.1          |
    And de besteaande technieken grenzwaarde voor nieuwe bedrijven is:
      | gewichtshoeveelheid | concentratie |
      | 0.4                 | 0.08         |
    When de grenzwaarde voor een nieuw bedrijf in "chemische industrie" wordt bepaald
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "0.5 kg"
    And is de maximaal toelaatbare concentratie PCP "0.1 mg/L"
    When de grenzwaarde voor een bestaand bedrijf in "chemische industrie" wordt bepaald
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "0.5 kg"
    And is de maximaal toelaatbare concentratie PCP "0.1 mg/L"

  Scenario: Verschil tussen nieuw en bestaand bedrijf in sector zonder bijlage I
    # Bron: Artikelen 2 en 3
    # Test: Nieuw vs bestaand bedrijf in sector ZONDER bijlage I grenzwaarde
    Given bedrijfstak "overige industrie" staat NIET in bijlage I
    And de besteaande technieken grenzwaarde voor nieuwe bedrijven is:
      | gewichtshoeveelheid | concentratie |
      | 1.0                 | 0.2          |
    And de besteaande technieken grenzwaarde per 31 december 1987 is:
      | gewichtshoeveelheid | concentratie |
      | 0.7                 | 0.12         |
    When de grenzwaarde voor een nieuw bedrijf in "overige industrie" wordt bepaald
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "1.0 kg"
    And is de maximaal toelaatbare concentratie PCP "0.2 mg/L"
    When de grenzwaarde voor een bestaand bedrijf in "overige industrie" wordt bepaald
    Then is de maximaal toelaatbare gewichtshoeveelheid PCP "0.7 kg"
    And is de maximaal toelaatbare concentratie PCP "0.12 mg/L"

  # === Definitie scenario's (Artikel 1) ===

  Scenario: Identificatie van PCP op basis van chemische naam
    # Bron: Artikel 1, onder a
    Given de chemische verbinding is "2,3,4,5,6-pentachloor-1-hydroxybenzeen"
    When de definitie van PCP wordt toegepast
    Then wordt de stof geïdentificeerd als PCP

  Scenario: Identificatie van PCP op basis van CAS nummer
    # Bron: Artikel 1, onder a
    Given het CAS nummer is "87-86-5"
    When de definitie van PCP wordt toegepast
    Then wordt de stof geïdentificeerd als PCP

  Scenario: Classificatie als verwerken van PCP voor productie
    # Bron: Artikel 1, onder b
    Given een industriële proces waarbij PCP wordt geproduceerd
    When de definitie van verwerken van PCP wordt toegepast
    Then wordt het proces geclassificeerd als "verwerken van PCP"

  Scenario: Classificatie als verwerken van PCP voor omzetting
    # Bron: Artikel 1, onder b
    Given een industriële proces waarbij PCP-bevattende stoffen worden omgezet
    When de definitie van verwerken van PCP wordt toegepast
    Then wordt het proces geclassificeerd als "verwerken van PCP"

  Scenario: Classificatie als verwerken van PCP voor gebruik
    # Bron: Artikel 1, onder b
    Given een industriële proces waarbij PCP-bevattende stoffen worden gebruikt
    When de definitie van verwerken van PCP wordt toegepast
    Then wordt het proces geclassificeerd als "verwerken van PCP"

  Scenario: Classificatie als verwerken van PCP voor vrijkoming
    # Bron: Artikel 1, onder b
    Given een industriële proces waarbij PCP vrijkomen
    When de definitie van verwerken van PCP wordt toegepast
    Then wordt het proces geclassificeerd als "verwerken van PCP"

  Scenario: Definitie bestaand bedrijf
    # Bron: Artikel 1, onder c
    Given een bedrijf dat PCP verwerkt
    And het bedrijf was op 16 juni 1987 in werking
    And de capaciteit voor het verwerken van PCP is na 16 juni 1987 niet aanzienlijk uitgebreid
    When de definitie van bestaand bedrijf wordt toegepast
    Then wordt het bedrijf geclassificeerd als "bestaand bedrijf"

  Scenario: Definitie nieuw bedrijf
    # Bron: Artikel 1, onder d
    Given een bedrijf dat PCP verwerkt
    And het bedrijf is geen bestaand bedrijf
    When de definitie van nieuw bedrijf wordt toegepast
    Then wordt het bedrijf geclassificeerd als "nieuw bedrijf"
