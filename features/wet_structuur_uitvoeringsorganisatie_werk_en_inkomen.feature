# Source: BWBR0013060 (Wet structuur uitvoeringsorganisatie werk en inkomen)
# Scenarios derived from the procedural rules in the law for executable articles (30a, 30b, 30c, 32, 11).

Feature: Wet structuur uitvoeringsorganisatie werk en inkomen
  Testscenario's afgeleid uit de wettelijke bepalingen voor uitvoeringsorganisatie werk en inkomen.

  Background:
    Given the calculation date is "2026-07-01"

  # === Artikel 30b: Registratie van werkzoekenden ===

  Scenario: Registratie van een Nederlandse werkzoekende
    # Bron: Artikel 30b, lid 1 en 2
    Given een burger met de volgende gegevens:
      | parameter       | waarde                     |
      | BSN             | 123456782                  |
      | nationaliteit   | Nederlands                 |
      | leeftijd        | 30                         |
    When het verzoek tot registratie als werkzoekende wordt ingediend bij UWV
    Then wordt een bewijs van registratie afgegeven door UWV
    And de registratie is geldig voor 3 maanden

  # === Artikel 30a: Re-integratievisie en -plan ===

  Scenario: Opstellen van een re-integratievisie en -plan voor een uitkeringsgerechtigde
    # Bron: Artikel 30a, lid 4 en 6
    Given een uitkeringsgerechtigde met de volgende gegevens:
      | parameter               | waarde                     |
      | BSN                     | 234567893                  |
      | uitkeringstype          | Werkloosheidswet           |
      | werkervaring            | 5 jaar in de bouw          |
    When UWV het profiel van de burger beoordeelt
    Then wordt een re-integratievisie opgesteld met rechten en verplichtingen
    And wordt door de burger en UWV gezamenlijk een re-integratieplan opgesteld

  # === Artikel 30c: Ontvangst en doorsturen van Participatiewet-aanvraag ===

  Scenario: Ontvangst en doorsturen van een Participatiewet-aanvraag
    # Bron: Artikel 30c, lid 1 en 5
    Given een burger dient een aanvraag in voor Participatiewet met de volgende gegevens:
      | parameter               | waarde                     |
      | BSN                     | 345678904                  |
      | naam                    | Jan Jensen                 |
      | adres                   | Amsterdam, NL             |
      | ondersteunende_dokumenten | Ja                        |
    When UWV de aanvraag ontvangt
    Then wordt de datum van ontvangst geregistreerd
    And worden de documenten doorgestuurd naar de gemeente

  # === Artikel 32: Oordeel over ongeschiktheid tot werken ===

  Scenario: Oordeel over ongeschiktheid tot werken bij geschil tussen werknemer en werkgever
    # Bron: Artikel 32, lid 1 en 32a, lid 3
    Given een geschil tussen een werknemer en werkgever over Ziektewet-uitkering met de volgende gegevens:
      | parameter               | waarde                     |
      | BSN_werknemer           | 456789015                  |
      | werkgever_ID           | 12345678                   |
      | geschil_details         | Werknemer claimt ongeschikt |
    When UWV een onderzoek uitvoert
    Then wordt binnen 2 weken een oordeel over ongeschiktheid tot werken afgegeven

  # === Artikel 11: Certificering van re-integratiebedrijven ===

  Scenario: Certificering van een re-integratiebedrijf
    # Bron: Artikel 11
    Given een bedrijf voldoet aan de volgende eisen:
      | parameter               | waarde                     |
      | voldoet_aan_kwaliteitsnormen | Ja                  |
      | deskundigheid           | Voldoende                  |
    When het verzoek tot certificering wordt ingediend bij UWV
    Then wordt een certificaat afgegeven door UWV
    And het certificaat heeft een beperkte geldigheidsduur
