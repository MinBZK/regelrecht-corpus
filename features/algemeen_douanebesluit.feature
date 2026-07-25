# Source: BWBR0024235 (Algemeen douanebesluit)
# Scenarios derived from the law for executable articles (1:4, 1:4a, 1:4b, 1:5, 1:6, 1:7, 1:8, 1:9, 1:10).
# NOTE: Memorie van Toelichting (MvT) for BWBR0024235 was inaccessible due to network restrictions.
# Hypothetical examples used as per law-mvt-research/SKILL.md guidelines.

Feature: Algemeen douanebesluit
  Testscenario's afgeleid uit de wettelijke bepalingen voor douanecontrole, kosten, en procedures.

  Background:
    Given the calculation date is "2026-07-01"

  # === Artikel 1:4: Kosten voor ambtelijke werkzaamheden ===

  Scenario: Kosten verschuldigd voor werkzaamheden buiten normale openingstijden
    # Bron: Artikel 1:4, onderdeel a, onder 1° (hypothetisch voorbeeld)
    Given een aanvrager vraagt om een douanecontrole buiten de normale openingstijden
    When de inspecteur werkzaamheden verricht op verzoek van de aanvrager buiten kantooruren
    Then zijn de kosten verschuldigd volgens artikel 1:4, onderdeel a, onder 1°

  Scenario: Kosten verschuldigd voor werkzaamheden op andere locaties
    # Bron: Artikel 1:4, onderdeel a, onder 2° (hypothetisch voorbeeld)
    Given een aanvrager verzoekt om douanecontrole op een locatie die niet is aangewezen voor onderzoek van goederen
    When de inspecteur de controle uitvoert op de niet-aangewezen locatie
    Then zijn de kosten verschuldigd volgens artikel 1:4, onderdeel a, onder 2°

  Scenario: Kosten voor analyses of deskundigenverslagen
    # Bron: Artikel 1:4, onderdeel a, onder 3° (hypothetisch voorbeeld)
    Given een aanvrager verzoekt om een analyse of deskundigenverslag van goederen
    When de inspecteur de analyse uitvoert of het verslag opstelt
    Then zijn de kosten voor analyses en eventuele portokosten verschuldigd volgens artikel 1:4, onderdeel a, onder 3°

  Scenario: Kosten voor vernietigen van goederen
    # Bron: Artikel 1:4, onderdeel b (hypothetisch voorbeeld)
    Given een partij goederen moet worden vernietigd volgens artikel 197 van het Douanewetboek van de Unie
    When de inspecteur de vernietiging laat uitvoeren
    Then zijn de kosten voor het vernietigen verschuldigd volgens artikel 1:4, onderdeel b

  Scenario: Kosten voor ambtshalve onderzoek van goederen
    # Bron: Artikel 1:4, onderdeel c (hypothetisch voorbeeld)
    Given goederen worden onderzocht volgens de artikelen 239, tweede lid, en 240, tweede lid, van de Uitvoeringsverordening Douanewetboek van de Unie
    When de inspecteur het ambtshalve onderzoek uitvoert
    Then zijn de kosten verschuldigd volgens artikel 1:4, onderdeel c

  Scenario: Geen kosten verschuldigd voor aanvullend onderzoek binnen spelingen
    # Bron: Artikel 1:4, onderdeel d (hypothetisch voorbeeld)
    Given het mentre de verschillen tussen het gedeeltelijk onderzoek en het aanvullend onderzoek binnen de spelingen vallen
    When de inspecteur het aanvullend onderzoek uitvoert
    Then zijn er geen kosten verschuldigd volgens artikel 1:4, onderdeel d

  # === Artikel 1:4a: Camera's voor persoonsgegevensverwerking ===

  Scenario: Overeenkomst regelt toegang tot camerabeelden
    # Bron: Artikel 1:4a (hypothetisch voorbeeld)
    Given een overeenkomst als bedoeld in artikel 1:23a, zesde lid, van de Algemene douanewet
    When de overeenkomst de wijze en mate van toegang tot camerabeelden regelt
    Then voldoet de overeenkomst aan de eisen van artikel 1:4a, onderdeel a

  Scenario: Overeenkomst regelt beveiligingsmaatregelen voor camerabeelden
    # Bron: Artikel 1:4a, onderdeel b (hypothetisch voorbeeld)
    Given een overeenkomst voor het gebruik van camera's waarbij persoonsgegevens worden verwerkt
    When de overeenkomst beveiligingsmaatregelen zijn opgenomen voor fysieke toegang tot camerabeelden
    Then voldoet de overeenkomst aan artikel 1:4a, onderdeel b, onder 1°

  Scenario: Overeenkomst regelt procedures voor wijzigingen in apparatuur
    # Bron: Artikel 1:4a, onderdeel c (hypothetisch voorbeeld)
    Given een wijziging in apparatuur of software voor camerabeelden
    When de overeenkomst procedures bevat voor deze wijzigingen
    Then wordt voldaan aan artikel 1:4a, onderdeel c

  # === Artikel 1:4b: Registratie van camera-gerelateerde gegevens ===

  Scenario: Registratie van tijdvakken voor cameragebruik
    # Bron: Artikel 1:4b, onderdelen a en b (hypothetisch voorbeeld)
    Given camera's worden gebruikt voor taken en doelen als bedoeld in artikelen 1:23a tot en met 1:23f van de Algemene douanewet
    When de inspecteur de tijdvakken van gebruik vastlegt
    Then zijn de tijdvakken en de namen van de ambtenaren die camerabeelden inzien geregistreerd volgens artikel 1:4b

  Scenario: Registratie van gebruik van persoonsgegevens voor persoonlijke veiligheid
    # Bron: Artikel 1:4b, onderdeel c (hypothetisch voorbeeld)
    Given persoonsgegevens van camerabeelden worden gebruikt voor de persoonlijke veiligheid van een ambtenaar
    When de inspecteur het gebruik en de acties met de persoonsgegevens vastlegt
    Then zijn het aantal gevallen, de aanleiding, en de acties geregistreerd volgens artikel 1:4b, onderdeel c

  Scenario: Registratie van dringende gevallen voor cameragebruik
    # Bron: Artikel 1:4b, onderdeel d (hypothetisch voorbeeld)
    Given er is sprake van een dringend geval voor cameragebruik
    When de inspecteur de toestemming, reden, locatie, en resultaten vastlegt
    Then zijn de dringende gevallen en bijbehorende gegevens geregistreerd volgens artikel 1:4b, onderdeel d

  # === Artikel 1:5: Tarieven voor werkzaamheden ===

  Scenario: Berekening van tarieven voor werkzaamheden buiten openingstijden
    # Bron: Artikel 1:5 (hypothetisch voorbeeld)
    Given een werkzaamheid wordt verricht buiten de normale openingstijden
    When de inspecteur het tarief berekent op basis van de geldende regels
    Then wordt het juiste tarief toegepast volgens artikel 1:5

  # === Artikel 1:6: Vrijstelling van kosten ===

  Scenario: Vrijstelling van kosten voor bepaalde werkzaamheden
    # Bron: Artikel 1:6 (hypothetisch voorbeeld)
    Given een werkzaamheid valt onder een category waarvoor vrijstelling geldt
    When de inspecteur de vrijstelling toepast
    Then zijn er geen kosten verschuldigd volgens artikel 1:6
