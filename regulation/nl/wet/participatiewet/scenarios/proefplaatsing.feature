Feature: Proefplaatsing met behoud van algemene bijstand (Pwet art. 8a lid 2 d)
  Als gemeentelijk uitvoerder
  Wil ik weten of iemand met bijstand op een proefplaats mag werken en
  voor hoe lang
  Zodat ik de termijn niet verwar met de zes maanden uit de
  werknemersverzekeringen

  # Toegevoegd 2026-09-02 na juristfeedback op de Koen-en-Sadee-doorloop.
  # Bevinding: het model toetste proefplaatsing alleen aan WW art. 76a,
  # terwijl de figuur in vier wetten staat, met verschillende kaders:
  #
  #   WW art. 76a       — 6 maanden, met behoud van WW-uitkering
  #   Wet WIA art. 37   — 6 maanden, met opschorting sollicitatieplicht
  #   Wajong art. 2:24  — 6 maanden, arbeidsondersteuning loopt door
  #   Pwet art. 8a.2.d  — 2 maanden, verlenging met maximaal 4
  #
  # Alleen de Participatiewet wijkt af, en alleen bij volledige
  # verlenging komt zij op dezelfde zes maanden uit. Bovendien is de
  # Participatiewet de enige waar het kader niet in de wet zelf staat:
  # de gemeenteraad legt bij verordening vast onder welke voorwaarden
  # het college toestemming verleent. De wet levert de doelgroep, de
  # bijstandseis en de maximumtermijnen; de rest is lokaal recht.

  Scenario: Bijstandsgerechtigde uit de doelgroep mag op proefplaats
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                         | 999990101 |
      | behoort_tot_doelgroep_artikel_7_lid_1_a     | true      |
      | ontvangt_algemene_bijstand                  | true      |
      | college_verleent_toestemming_proefplaatsing | true      |
    When I evaluate "mag_proefplaatsing_aangaan" of "participatiewet"
    Then the execution succeeds
    And output "mag_proefplaatsing_aangaan" is true

  # De termijnen zijn harde constanten uit lid 2 onderdeel d. Dit
  # scenario bewaakt dat de tweemaandstermijn niet stilzwijgend naar de
  # zes maanden van de werknemersverzekeringen opschuift.
  Scenario: De gemeentelijke proefplaatsing duurt twee maanden, verlengbaar tot zes
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                         | 999990101 |
      | behoort_tot_doelgroep_artikel_7_lid_1_a     | true      |
      | ontvangt_algemene_bijstand                  | true      |
      | college_verleent_toestemming_proefplaatsing | true      |
    When I evaluate "max_duur_proefplaatsing_maanden" of "participatiewet"
    Then the execution succeeds
    And output "max_duur_proefplaatsing_maanden" equals 2
    And output "max_duur_verlenging_proefplaatsing_maanden" equals 4
    And output "max_totale_duur_proefplaatsing_maanden" equals 6

  # Lid 2 onderdeel d stelt de proefplaatsing uitsluitend open voor wie
  # algemene bijstand ontvangt. Wie wel tot de doelgroep van art. 7 lid 1
  # onderdeel a behoort maar geen bijstand ontvangt — bijvoorbeeld een
  # niet-uitkeringsgerechtigde — valt erbuiten.
  Scenario: Zonder algemene bijstand geen proefplaatsing via de Participatiewet
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                         | 999990102 |
      | behoort_tot_doelgroep_artikel_7_lid_1_a     | true      |
      | ontvangt_algemene_bijstand                  | false     |
      | college_verleent_toestemming_proefplaatsing | true      |
    When I evaluate "mag_proefplaatsing_aangaan" of "participatiewet"
    Then the execution succeeds
    And output "mag_proefplaatsing_aangaan" is false

  # Zonder toestemming van het college geen proefplaatsing. De
  # voorwaarden waaronder het college die toestemming verleent staan in
  # de gemeentelijke verordening en zitten niet in dit corpus; de engine
  # ontvangt de uitkomst als parameter.
  Scenario: Zonder toestemming van het college geen proefplaatsing
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                         | 999990101 |
      | behoort_tot_doelgroep_artikel_7_lid_1_a     | true      |
      | ontvangt_algemene_bijstand                  | true      |
      | college_verleent_toestemming_proefplaatsing | false     |
    When I evaluate "mag_proefplaatsing_aangaan" of "participatiewet"
    Then the execution succeeds
    And output "mag_proefplaatsing_aangaan" is false

  # De verordeningsplicht van lid 1 is onvoorwaardelijk: "de
  # gemeenteraad stelt bij verordening regels". Dat de gemeente die
  # opdracht heeft is wél hard; wat zij vastlegt is dat niet.
  Scenario: De verordeningsplicht van lid 1 geldt altijd
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                         | 999990101 |
      | behoort_tot_doelgroep_artikel_7_lid_1_a     | true      |
      | ontvangt_algemene_bijstand                  | true      |
      | college_verleent_toestemming_proefplaatsing | false     |
    When I evaluate "gemeenteraad_moet_verordening_vaststellen" of "participatiewet"
    Then the execution succeeds
    And output "gemeenteraad_moet_verordening_vaststellen" is true
