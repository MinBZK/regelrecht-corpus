# Source: BWBR0002109 (Runderhorzelwet)
# Scenarios derived from the law for executable articles (2, 3, 4, 5).
# NOTE: Memorie van Toelichting (MvT) for BWBR0002109 was inaccessible due to network restrictions.
# Hypothetical examples used as per law-mvt-research/SKILL.md guidelines.

Feature: Runderhorzelwet
  Testscenario's afgeleid uit de wettelijke bepalingen voor bestrijding van runderhorzel.

  Background:
    Given the calculation date is "2002-01-01"

  # === Artikel 2: Verplichting larven doden ===

  Scenario: Houder moeten larven van runderhorzelvliegen doden bij aanwezigheid
    # Bron: Artikel 2 (hypothetisch voorbeeld)
    Given een houder van runderen heeft runderen met bulten of andere uiterlijke kentekenen van runderhorzelvliegen
    When de houder de larven aantreft op de runderen
    Then moet de houder alle larven doden of laten doden volgens artikel 2

  Scenario: Houder voorziet in doden van larven via derden
    # Bron: Artikel 2 (hypothetisch voorbeeld)
    Given een houder van runderen heeft runderen met uiterlijke kentekenen van runderhorzelvliegen
    When de houder een professionele partij inschakelt om de larven te doden
    Then is de verplichting uit artikel 2 ingevuld door het "doen doden"

  # === Artikel 3: Verbod in weiland ===

  Scenario: Verbod om runderen met horzellarven in weiland te brengen
    # Bron: Artikel 3 (hypothetisch voorbeeld)
    Given een houder van runderen heeft runderen met bulten die duiden op larven van runderhorzelvliegen
    When de houder deze runderen naar het weiland wil brengen
    Then is het verboden volgens artikel 3 om deze runderen in het weiland te brengen

  Scenario: Toegestaan om runderen zonder larven in weiland te brengen
    # Bron: Artikel 3 (hypothetisch voorbeeld)
    Given een houder van runderen heeft runderen zonder bulten of andere uiterlijke kentekenen
    When de houder deze runderen naar het weiland brengt
    Then is dit toegestaan want artikel 3 verbiedt alleen runderen met larven

  # === Artikel 4: Verbod op markten en verzamelplaatsen ===

  Scenario: Verbod om runderen met horzellarven aan te voeren op markt
    # Bron: Artikel 4 (hypothetisch voorbeeld)
    Given een houder van runderen heeft runderen op welke zich blijkens bulten larven van runderhorzelvliegen bevinden
    When de houder deze runderen naar een markt transporteert
    Then is het verboden volgens artikel 4 om deze runderen op de markt aan te voeren

  Scenario: Verbod om runderen met horzellarven aan te voeren op keuring
    # Bron: Artikel 4 (hypothetisch voorbeeld)
    Given een houder heeft runderen met uiterlijke kentekenen van runderhorzelvliegtlarven
    When de houder deze runderen naar een keuring brengt
    Then is het verboden volgens artikel 4 om deze runderen aan te voeren op een keuring

  Scenario: Toegestaan om runderen zonder larven naar tentoonstelling te brengen
    # Bron: Artikel 4 (hypothetisch voorbeeld)
    Given een houder heeft runderen zonder bulten of andere kentekenen van horzellarven
    When de houder deze runderen naar een tentoonstelling brengt
    Then is dit toegestaan want artikel 4 verbiedt alleen runderen met larven

  # === Artikel 5: Strafbepaling ===

  Scenario: Overtreding van artikel 2 wordt gestraft
    # Bron: Artikel 5, lid 1 (hypothetisch voorbeeld)
    Given een houder overtreept artikel 2 door larven niet te doden
    When het Openbaar Ministerie vervolgt
    Then kan de houder worden gestraft met hechtenis van ten hoogste één jaar of geldboete van de eerste categorie

  Scenario: Overtreding van artikel 3 wordt gestraft
    # Bron: Artikel 5, lid 1 (hypothetisch voorbeeld)
    Given een houder brengt runderen met larven in het weiland in strijd met artikel 3
    When het Openbaar Ministerie vervolgt
    Then kan de houder worden gestraft met hechtenis van ten hoogste één jaar of geldboete van de eerste categorie

  Scenario: Overtreding is een overtreding
    # Bron: Artikel 5, lid 2 (hypothetisch voorbeeld)
    Given een overtreding van artikel 2, 3 of 4
    Then is het feit gekwalificeerd als een overtreding volgens artikel 5, lid 2
