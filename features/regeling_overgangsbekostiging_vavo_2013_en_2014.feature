# Source: BWBR0032257 (Regeling overgangsbekostiging vavo 2013 en 2014)
# These scenarios are inferred from the procedural rules in the regulation.
# Note: No Memorie van Toelichting documents were found for this regulation.

Feature: Overgangsbekostiging vavo 2013 en 2014
  Testscenario's afgeleid uit de regelingstekst van Regeling overgangsbekostiging vavo 2013 en 2014.

  Background:
    Given the calculation date is "2013-01-01"

  # === Artikel 2: Berekening rijksbijdrage op basis van formule ===

  @formule
  Scenario: Berekening rijksbijdrage voor instelling met vavo op 1 augustus 2012
    Given een instelling verzorgde op 1 augustus 2012 een of meer opleidingen vavo op grond van een overeenkomst als bedoeld in artikel 2.3.4 van de Wet educatie en beroepsonderwijs
    When de rijksbijdrage voor vavo voor de jaren 2013 en 2014 wordt berekend according to Artikel 2
    Then wordt de berekening uitgevoerd op grond van de formule als bedoeld in artikel VI, eerste lid, van de Wet van 13 september 2012 (Stb. 2012, 450)

  # === Artikel 3: Totale beschikbare bedragen ===

  @budget
  Scenario: Beschikbaar gesteld bedrag voor 2013
    Given het jaar is 2013
    When het budget voor rijksbijdrage vavo wordt vastgesteld according to Artikel 3
    Then bedraagt het totale beschikbare bedrag €58.321.000

  @budget
  Scenario: Beschikbaar gesteld bedrag voor 2014
    Given het jaar is 2014
    When het budget voor rijksbijdrage vavo wordt vastgesteld according to Artikel 3
    Then bedraagt het totale beschikbare bedrag €58.321.000

  @budget @bijstelling
  Scenario: Bijstelling budget als gevolg van rijksbegrotingsmaatregelen
    Given het totale budget bedraagt Initially €58.321.000
    When er een bijstelling plaatsvindt als gevolg van uit de rijksbegroting voortvloeiende maatregelen according to Artikel 3
    Then kan het totale beschikbare bedrag worden bijgesteld

  # === Artikel 4: Instellingsbudgetten ===

  @instellingsbudget
  Scenario: Vaststelling instellingsbudgetten voor 2013
    Given de instellingsbudgetten zijn berekend op grond van de formule als bedoeld in artikel VI, eerste lid, van de Wet van 13 september 2012
    When de instellingsbudgetten worden vastgesteld according to Artikel 4.1
    Then worden de instellingsbudgetten vastgesteld zoals vermeld in de bijlage behorende bij deze regeling

  @instellingsbudget
  Scenario: Vaststelling instellingsbudgetten voor 2014
    Given de instellingsbudgetten zijn berekend op grond van de formule als bedoeld in artikel VI, eerste lid, van de Wet van 13 september 2012
    When de instellingsbudgetten worden vastgesteld according to Artikel 4.1
    Then worden de instellingsbudgetten vastgesteld zoals vermeld in de bijlage behorende bij deze regeling

  @instellingsbudget @publicatie
  Scenario: Publicatie van bijgestelde instellingsbudgetten
    Given de instellingsbudgetten zijn bijgesteld als gevolg van rijksbegrotingsmaatregelen
    When de bijgestelde instellingsbudgetten worden gepubliceerd according to Artikel 4.2
    Then worden de bijgestelde instellingsbudgetten gepubliceerd in de Staatscourant

  # === Artikel 5: Begroting, verslaglegging en gegevensverstrekking ===

  @begroting
  Scenario: Naleving begrotingsvoorschriften door instelling
    Given een instelling ontvangt in 2013 een rijksbijdrage voor het vavo op grond van deze regeling
    When de instelling de begroting opstelt according to Artikel 5
    Then neemt de instelling in acht hetgeen bij of krachtens de Wet educatie en beroepsonderwijs is bepaald ten aanzien van de begroting

  @verslaglegging
  Scenario: Naleving verslagleggingsvoorschriften door instelling
    Given een instelling ontvangt in 2014 een rijksbijdrage voor het vavo op grond van deze regeling
    When de instelling de verslaglegging uitvoert according to Artikel 5
    Then neemt de instelling in acht hetgeen bij of krachtens de Wet educatie en beroepsonderwijs is bepaald ten aanzien van de verslaglegging

  @gegevensverstrekking
  Scenario: Naleving gegevensverstrekkingsvoorschriften door instelling
    Given een instelling ontvangt in 2013 en 2014 een rijksbijdrage voor het vavo op grond van deze regeling
    When de instelling gegevens verstrekt according to Artikel 5
    Then neemt de instelling in acht hetgeen bij of krachtens de Wet educatie en beroepsonderwijs is bepaald ten aanzien van de gegevensverstrekking

  # === Artikel 6: Inwerkingtreding en verval ===

  @inwerkingtreding
  Scenario: Inwerkingtreding regeling
    Given de regeling is gepubliceerd
    When de regeling in werking treedt according to Artikel 6.1
    Then treedt de regeling in werking met ingang van 1 januari 2013

  @verval
  Scenario: Verval regeling
    Given de regeling is in werking getreden op 1 januari 2013
    When de regeling vervalt according to Artikel 6.2
    Then vervalt de regeling met ingang van 1 januari 2016

  # === Artikel 7: Citeertitel ===

  @citeertitel
  Scenario: Citeertitel van de regeling
    When de regeling wordt aangehaald according to Artikel 7
    Then wordt de regeling aangehaald als "Regeling overgangsbekostiging vavo 2013 en 2014"
