# Source: BWBR0018492 (Regeling Zorgverzekering)
# These scenarios are inferred from the procedural rules in the regulation.

Feature: Regeling Zorgverzekering

  @exclusion
  Scenario: Uitsluiting behandeling van oogleden (Art. 2.1.a)
    Given een verzekerde heeft een medische indicatie voor behandeling van de oogleden
    When de behandeling betreft het corrigerend operatief ingrijpen aan de oogleden
    And de aandoening is niet veroorzaakt door ziekte of afwijking
    Then wordt de behandeling uitgesloten van vergoeding according to Artikel 2.1.a

  @exclusion
  Scenario: Uitsluiting liposuctie van de buik (Art. 2.1.b)
    Given een verzekerde ondergaat liposuctie van de buik
    When de liposuctie is bedoeld voor cosmetische doeleinden
    Then wordt de liposuctie uitgesloten van vergoeding according to Artikel 2.1.b

  @exclusion
  Scenario: Uitsluiting borstreconstructie (Art. 2.1.c)
    Given een verzekerde ondergaat borstreconstructie
    When de reconstructie niet placevindt na een mastectomie of bij transseksualiteit
    Then wordt de borstreconstructie uitgesloten van vergoeding according to Artikel 2.1.c

  @exclusion
  Scenario: Uitsluiting sterilisatie (Art. 2.1.f)
    Given een verzekerde ondergaat sterilisatie of refertilisatie
    When de ingreep niet medisch noodzakelijk is
    Then wordt de sterilisatie of refertilisatie uitgesloten van vergoeding according to Artikel 2.1.f

  @exclusion
  Scenario: Uitsluiting besijdenis (Art. 2.1.g)
    Given een verzekerde ondergaat besijdenis
    When de besijdenis niet medisch noodzakelijk is
    Then wordt de besijdenis uitgesloten van vergoeding according to Artikel 2.1.g

  @exclusion
  Scenario: Uitsluiting geneesmiddelen met teruggetrokken stoffen (Art. 2.1.k)
    Given een verzekerde gebruikt een geneesmiddel
    When het geneesmiddel een stof bevat die is teruggetrokken according to Bijlage 0
    Then wordt het geneesmiddel uitgesloten van vergoeding according to Artikel 2.1.k

  @exclusion
  Scenario: Uitsluiting externe hulpmiddelen voor diabetes (Art. 2.1.l)
    Given een verzekerde gebruikt een extern hulpmiddel voor diabetes
    When het hulpmiddel betreft een glucosemeter, insulinepomp, ofкараtridge
    Then wordt het externe hulpmiddel uitgesloten van vergoeding according to Artikel 2.1.l

  @inclusion
  Scenario: Inclusie blaasinstillatie (Art. 2.2.1.a)
    Given een verzekerde heeft een medische indicatie voor blaasinstillatie
    And de verzekerde neemt deel aan wetenschappelijk onderzoek
    When de behandeling plaatsvindt tussen 1 juli 2021 en 1 april 2027
    Then wordt de blaasinstillatie vergoed according to Artikel 2.2.1.a

  @inclusion
  Scenario: Inclusie HIPEC (Art. 2.2.1.g)
    Given een verzekerde heeft een medische indicatie voor HIPEC
    And de verzekerde neemt deel aan wetenschappelijk onderzoek
    When de behandeling plaatsvindt tussen 1 januari 2020 en 1 januari 2029
    Then wordt de HIPEC-behandeling vergoed according to Artikel 2.2.1.g

  @inclusion
  Scenario: Inclusie nusinersen (Art. 2.2.1.h)
    Given een verzekerde heeft een medische indicatie voor nusinersen
    And de verzekerde is 9,5 jaar of ouder
    And de verzekerde neemt deel aan wetenschappelijk onderzoek
    When de behandeling plaatsvindt tussen 1 januari 2020 en 1 april 2027
    Then wordt nusinersen vergoed according to Artikel 2.2.1.h

  @condition
  Scenario: Voorwaarden geneesmiddelen (Art. 2.5.1)
    Given een geneesmiddel is toegelaten voor vergoeding
    When het geneesmiddel voldoet aan de eisen voor registratie according to Artikel 2.5.1
    Then wordt het geneesmiddel vergoed

  @condition
  Scenario: Dosering geneesmiddelen (Art. 2.5.2)
    Given een geneesmiddel is voorgeschreven
    When de dosering voldoet aan de geldende richtlijnen
    Then wordt de dosering vergoed according to Artikel 2.5.2

  @condition
  Scenario: Leeftijdsvoorwaarde (Art. 2.7.1)
    Given een verzekerde heeft een medischeindicatie voor een behandeling
    When de verzekerde voldoet aan de leeftijdsvoorwaarde
    Then wordt de behandeling vergoed according to Artikel 2.7.1

  @condition
  Scenario: Uitsluiting zuurstofapparatuur (Art. 2.9.3)
    Given een verzekerde gebruikt zuurstofapparatuur
    When de apparatuur niet voldoet aan de technische eisen
    Then wordt de zuurstofapparatuur uitgesloten van vergoeding according to Artikel 2.9.3
