# Source: BWBR0015007 (Spoorwegwet)
# Scenarios derived from Memorie van Toelichting (MvT) kst-36807-3
# All monetary values converted to eurocent

Feature: Spoorwegwet Rekenvoorbeelden
  Testscenario's afgeleid uit rekenvoorbeelden in de MvT (kst-36807-3)

  Background:
    Given the calculation date is "2024-01-01"

  # === Regulatory Costs (Lines 7177–7189) ===

  Scenario: Initiële administrativelast voor spoorwegondernemingen
    # Bron: kst-36807-3, lines 7177–7189
    Given een spoorwegonderneming valt onder de aanmeldplicht
    When de initiële administrativelast wordt berekend
    Then moet de kostprijs tussen 2000000 en 4000000 eurocent bedragen

  Scenario: Structurele administrativelast voor spoorwegondernemingen
    # Bron: kst-36807-3, lines 7177–7189
    Given een spoorwegonderneming is onderworpen aan structurele verplichtingen
    When de structurele administrativelast wordt berekend
    Then moet de kostprijs tussen 100000 en 400000 eurocent bedragen

  Scenario: Compliance kostprijs voor spoorwegondernemingen
    # Bron: kst-36807-3, lines 7187–7189
    Given een spoorwegonderneming moet voldoen aan compliance-eisen
    When de compliance-kostprijs wordt berekend
    Then moet de kostprijs ten minste 450000 eurocent bedragen

  # === Siding Operators (Zelfrangeerders, Lines 7233–7239) ===

  Scenario: Eenmalige regulatoire kosten voor bestaande zelfrangeerders
    # Bron: kst-36807-3, lines 7233–7234
    Given er zijn 5 bestaande zelfrangeerders
    When de eenmalige regulatoire kosten worden berekend
    Then moet de totale kostprijs 450000 eurocent bedragen

  Scenario: Eenmalige regulatoire kosten voor nieuwe zelfrangeerders
    # Bron: kst-36807-3, lines 7237–7239
    Given een nieuwe zelfrangeerder meldt zich aan
    When de eenmalige regulatoire kosten worden berekend
    Then moet de kostprijs 90000 eurocent bedragen

  # === Machinist Requirements (Lines 13669–13728, 13847–13856) ===

  Scenario: Minimumleeftijd voor machinisten
    # Bron: kst-36807-3, lines 13669–13672
    Given een kandidaat wil een machinistenvergunning behalen
    When de leeftijdseis wordt gecontroleerd
    Then moet de kandidaat ten minste 18 jaar oud zijn

  Scenario: Geldigheidsduur machinistenvergunning
    # Bron: kst-36807-3, lines 13704–13705
    Given een machinist heeft een vergunning behaald
    When de geldigheidsduur van de vergunning wordt gecontroleerd
    Then moet de vergunning 10 jaar geldig zijn

  Scenario: Taalvaardigheidseis voor machinisten
    # Bron: kst-36807-3, lines 13727–13728
    Given een machinist moet communiceren in een internationale context
    When de taalvaardigheid wordt gecontroleerd
    Then moet de machinist ten minste niveau B1 beheersen

  Scenario: Periodiek medisch onderzoek voor machinisten
    # Bron: kst-36807-3, lines 13847–13856
    Given een machinist is actief in dienst
    When de medische geschiktheid wordt gecontroleerd
    Then moet de machinist periodiek een medisch onderzoek ondergaan

  Scenario: Gewichtslimiet voor machinisten in opleiding
    # Bron: kst-36807-3, lines 5658–5660
    Given een machinist in opleiding rijdt met een treinstel
    When het gewicht van de trein wordt gecontroleerd
    Then moet het gewicht beperkt zijn tot 10000 kg

---

Feature: Spoorwegwet Randgevallen
  Testscenario's voor randgevallen beschreven in de MvT (kst-36807-3)

  # === Historical Railways (Lines 3704–3739) ===

  Scenario: Toepassing van de wet op historische spoorwegen
    # Bron: kst-36807-3, lines 3704–3739
    Given een spoorweg is aangemerkt als historisch
    When de toepassing van de Spoorwegwet wordt beoordeeld
    Then kan de wet afwijkend worden toegepast voor historische spoorwegen

  # === Metro Systems (Lines 4107–4199) ===

  Scenario: Toepassing van de wet op metrosystemen
    # Bron: kst-36807-3, lines 4107–4199
    Given een metrosysteem valt onder de definitie van spoorweg
    When de toepassing van de Spoorwegwet wordt beoordeeld
    Then kan de wet afwijkend worden toegepast voor metrosystemen

  # === Zelfrangeerders (Lines 3755–3761) ===

  Scenario: Specifieke regels voor zelfrangeerders
    # Bron: kst-36807-3, lines 3755–3761
    Given een zelfrangeerder voert rangeerwerkzaamheden uit
    When de toepassing van de Spoorwegwet wordt beoordeeld
    Then zijn specifieke regels van toepassing voor zelfrangeerders

  # === Aannemers (Lines 4264–4267) ===

  Scenario: Verantwoordelijkheid van aannemers bij spoorweginfrastructuur
    # Bron: kst-36807-3, lines 4264–4267
    Given een aannemer voert werkzaamheden uit aan spoorweginfrastructuur
    When de verantwoordelijkheid wordt beoordeeld
    Then is de aannemer verantwoordelijk voor de veiligheid tijdens de werkzaamheden

  # === Spoorwegpersoneel (Lines 5658–5660) ===

  Scenario: Specifieke eisen voor spoorwegpersoneel
    # Bron: kst-36807-3, lines 5658–5660
    Given een medewerker is werkzaam als spoorwegpersoneel
    When de eisen voor het personeel worden beoordeeld
    Then moeten specifieke eisen worden nageleefd

  Scenario: Uitzondering voor licht spoorwegmaterieel
    # Bron: kst-36807-3, lines 4116–4126
    When een lichte spoorwegvoertuig wordt beoordeeld
    Then kunnen afwijkende regels gelden voor licht spoorwegmaterieel

---

Feature: Spoorwegwet Afwijzingsscenario's
  Testscenario's voor afwijzingsgevallen beschreven in de MvT (kst-36807-3)

  # === Unused Tracks (Lines 2181–2199) ===

  Scenario: Afwijzing van een aanvraag voor niet turniejugebruikte spoorwegen
    # Bron: kst-36807-3, lines 2181–2199
    Given een aanvraag wordt ingediend voor een spoorweg die niet wordt gebruikt voor turnijen
    When de aanvraag wordt beoordeeld
    Then moet de aanvraag worden afgewezen

  # === Private Railways (Lines 2478–2503) ===

  Scenario: Afwijzing van een aanvraag voor privé-spoorwegen
    # Bron: kst-36807-3, lines 2478–2503
    Given een aanvraag wordt ingediend voor een privé-spoorweg
    When de aanvraag wordt beoordeeld
    Then moet de aanvraag worden afgewezen als de spoorweg niet voldoet aan de wettelijke eisen

  # === Economic Balance Test Failures (Lines 2505–2510) ===

  Scenario: Afwijzing van een aanvraag bij falen van de economische balanstest
    # Bron: kst-36807-3, lines 2505–2510
    Given een aanvraag wordt ingediend voor een nieuwe spoorweginfrastructuur
    When de economische balanstest wordt uitgevoerd
    Then moet de aanvraag worden toegewezen als de test faalt

  # === Overbooked Infrastructure (Lines 4116–4126) ===

  Scenario: Afwijzing van een aanvraag bij overboekte infrastructuur
    # Bron: kst-36807-3, lines 4116–4126
    Given een aanvraag wordt ingediend voor gebruik van spoorweginfrastructuur
    When de beschikbare capaciteit wordt beoordeeld
    Then moet de aanvraag worden afgewezen als de infrastructuur overboekt is

  # === Non-Compliant Vehicles (Lines 4738–4746) ===

  Scenario: Afwijzing van een aanvraag voor niet-conforme spoorvoertuigen
    # Bron: kst-36807-3, lines 4738–4746
    Given een aanvraag wordt ingediend voor een spoorvoertuig
    When de conformiteit van het voertuig wordt beoordeeld
    Then moet de aanvraag worden afgewezen als het voertuig niet voldoet aan de technische eisen

  Scenario: Afwijzing van een aanvraag bij gebrek aan voldoende verzekering
    # Bron: kst-36807-3, lines 4904–4907
    Given een aanvraag wordt ingediend voor het gebruik van spoorweginfrastructuur
    When de verzekeringsdekking wordt beoordeeld
    Then moet de aanvraag worden afgewezen als er onvoldoende verzekering is

  Scenario: Afwijzing van een aanvraag bij gebrek aan certificering
    # Bron: kst-36807-3, lines 2505–2510
    Given een aanvraag wordt ingediend voor een spoorwegonderneming
    When de certificering van de onderneming wordt beoordeeld
    Then moet de aanvraag worden afgewezen als de onderneming niet gecertificeerd is
