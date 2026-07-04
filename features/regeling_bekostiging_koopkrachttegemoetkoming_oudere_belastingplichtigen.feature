# Source: Stcrt. 2011, 9158 (TOELICHTING) en BWBR0030013
# These scenarios are inferred from the procedural rules in the regulation.

Feature: Bekostiging Koopkrachttegemoetkoming Oudere Belastingplichtigen

  @KOB
  Scenario: Indienen raming KOB door SVB
    Given de SVB heeft een raming van geraamde KOB-uitgaven voor het komende jaar
    When de SVB uiterlijk op 1 oktober een opgave met maandelijkse uitsplitsing indient according to Artikel 2
    Then wordt de opgave ontvangen door de Minister van Sociale Zaken en Werkgelegenheid

  @KOB @voorschot
  Scenario: Maandelijkse afdracht voorschot KOB
    Given de geraamde jaarlijkse KOB-uitgaven bedragen €2.400.000
    And de SVB heeft een opgave ingediend according to Artikel 2
    When de Minister een periodiek voorschot afdracht according to Artikel 3
    Then wordt maandelijks een voorschot van €200.000 gestort op de rekening-courant van de SVB
    And de valutadatum is de 22ste van elke maand

   @uitvoeringskosten @voorschot
   Scenario: Maandelijkse afdracht voorschot uitvoeringskosten
     Given de geraamde jaarlijkse uitvoeringskosten bedragen €120.000
     And de SVB heeft een opgave ingediend in het jaarplan met begroting according to Artikel 2
     When de Minister ééntwaalfde van het bedrag afdracht according to Artikel 3.1.b
     Then wordt maandelijks €10.000 gestort op de rekening-courant van de SVB
     And de valutadatum is de vijftiende dag van elke maand

   @afrekening
   Scenario: Opname in jaarrekening van baten, lasten en voorschotten
     Given de SVB heeft de jaarrekening opgesteld voor het afgelopen kalenderjaar
     When de SVB de baten en lasten en ontvangen voorschotten opneemt according to Artikel 4.1
     Then worden de baten en lasten, alsmede de ontvangen voorschotten, uitgesplitst naar lasten KOB en uitvoeringskosten opgenomen in de jaarrekening

   @afrekening @betaling
   Scenario: Afrekening na goedkeuring jaarrekening
     Given de SVB heeft de jaarrekening ingediend
     And het besluit tot vaststelling van de jaarrekening is goedgekeurd according to Artikel 4.2
     When de Minister de bata en lasten afrekent according to Artikel 4.2
     Then vindt afrekening plaats met als valutadatum 1 juni van het volgende kalenderjaar

   @overgangsrecht
   Scenario: Intrekking oude regeling en citeertitel
     Given de nieuwe regeling treedt in werking op 1 juni 2011
     When Artikel 8 vervalt according to Artikel 9
     Then vervalt Artikel 8 met ingang van 1 januari 2012
     And deze regeling wordt aangehaald als "Regeling bekostiging koopkrachttegemoetkoming oudere belastingplichtigen" according to Artikel 10
