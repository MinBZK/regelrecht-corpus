Feature: Voorzieningen bij arbeidsinschakeling (Pwet art. 10 en 10da)
  Als gemeentelijk uitvoerder
  Wil ik weten wie aanspraak heeft op persoonlijke ondersteuning en
  voorzieningen, en welk deel daarvan hard in de wet staat
  Zodat het Financieel CV niet "geen recht" toont waar alleen de
  vindplaats anders is

  # Toegevoegd 2026-09-02 na juristfeedback op de Koen-en-Sadee-doorloop.
  # Bevinding: Wet WIA art. 35 lid 4.b sluit personen uit voor wie het
  # college op grond van Pwet art. 7 lid 1 onderdeel a zorg draagt. Het
  # recht op jobcoaching en werkplekaanpassing verdwijnt daarmee niet —
  # het verhuist naar de gemeente. Zonder deze modellering zou het
  # Financieel CV voor de hele Participatiewet-doelgroep ten onrechte
  # "geen recht" tonen. Zelfde patroon als de WIA/Wajong-splitsing die
  # de jurist op 23 juli 2026 signaleerde.
  #
  # De gemeentelijke keten kent twee sterktes:
  #   art. 10 lid 1  — aanspraak, maar "overeenkomstig de verordening";
  #                    voorwaarden, vorm en duur zijn gemeentelijk
  #   art. 10da      — aanspraak zonder voorbehoud voor wie tot de
  #                    doelgroep loonkostensubsidie behoort
  # Alleen 10da is hard genoeg om er een bedrag of toezegging aan te
  # hangen. Dat onderscheid moet in de presentatielaag zichtbaar blijven.

  # ────────────────────────────────────────────────────────────────────
  # Artikel 10 lid 1 — doelgroep en aanspraak
  Scenario: Bijstandsgerechtigde heeft aanspraak op ondersteuning en persoonlijke ondersteuning
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990101 |
      | ontvangt_algemene_bijstand                     | true      |
      | is_wia_uitstromer_artikel_34a_35_36            | false     |
      | heeft_nabestaandenuitkering_anw                | false     |
      | is_niet_uitkeringsgerechtigde                  | false     |
      | valt_onder_lid_2_wegens_voorziening            | false     |
      | college_acht_voorziening_noodzakelijk          | true      |
      | kan_taken_niet_verrichten_zonder_ondersteuning | true      |
      | aanvraag_ingediend                             | true      |
    When I evaluate "heeft_aanspraak_op_persoonlijke_ondersteuning" of "participatiewet"
    Then the execution succeeds
    And output "behoort_tot_doelgroep_artikel_10" is true
    And output "heeft_aanspraak_op_persoonlijke_ondersteuning" is true
    And output "heeft_aanspraak_op_voorziening_arbeidsinschakeling" is true

  # Dit is precies de groep die Wet WIA art. 35 lid 4.b uitsluit: de
  # WIA-uitstromer van art. 34a lid 5 b, 35 lid 4 b en 36 lid 3 b, voor
  # wie het college de ondersteuning verzorgt. De uitsluiting daar en de
  # aanspraak hier zijn twee kanten van dezelfde regel.
  Scenario: WIA-uitstromer valt in de doelgroep van artikel 10 lid 1
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990103 |
      | ontvangt_algemene_bijstand                     | false     |
      | is_wia_uitstromer_artikel_34a_35_36            | true      |
      | heeft_nabestaandenuitkering_anw                | false     |
      | is_niet_uitkeringsgerechtigde                  | false     |
      | valt_onder_lid_2_wegens_voorziening            | false     |
      | college_acht_voorziening_noodzakelijk          | true      |
      | kan_taken_niet_verrichten_zonder_ondersteuning | true      |
      | aanvraag_ingediend                             | true      |
    When I evaluate "behoort_tot_doelgroep_artikel_10" of "participatiewet"
    Then the execution succeeds
    And output "behoort_tot_doelgroep_artikel_10" is true
    And output "heeft_aanspraak_op_persoonlijke_ondersteuning" is true

  # Lid 2 vangt wie door een voorziening juist buiten de categorieen van
  # lid 1 is geraakt. Zonder dat lid zou de voorziening zichzelf
  # opheffen.
  Scenario: Wie door een voorziening buiten lid 1 valt, houdt de aanspraak via lid 2
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990104 |
      | ontvangt_algemene_bijstand                     | false     |
      | is_wia_uitstromer_artikel_34a_35_36            | false     |
      | heeft_nabestaandenuitkering_anw                | false     |
      | is_niet_uitkeringsgerechtigde                  | false     |
      | valt_onder_lid_2_wegens_voorziening            | true      |
      | college_acht_voorziening_noodzakelijk          | true      |
      | kan_taken_niet_verrichten_zonder_ondersteuning | true      |
      | aanvraag_ingediend                             | true      |
    When I evaluate "behoort_tot_doelgroep_artikel_10" of "participatiewet"
    Then the execution succeeds
    And output "behoort_tot_doelgroep_artikel_10" is true

  # De slotzin van lid 1 stelt de noodzakelijkheidseis: wie de taken ook
  # zonder ondersteuning kan verrichten, heeft geen aanspraak op
  # persoonlijke ondersteuning. De bredere voorziening blijft wel staan,
  # want die hangt aan het oordeel van het college, niet aan deze eis.
  Scenario: Zonder noodzaak geen persoonlijke ondersteuning, wel nog een voorziening
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990101 |
      | ontvangt_algemene_bijstand                     | true      |
      | is_wia_uitstromer_artikel_34a_35_36            | false     |
      | heeft_nabestaandenuitkering_anw                | false     |
      | is_niet_uitkeringsgerechtigde                  | false     |
      | valt_onder_lid_2_wegens_voorziening            | false     |
      | college_acht_voorziening_noodzakelijk          | true      |
      | kan_taken_niet_verrichten_zonder_ondersteuning | false     |
      | aanvraag_ingediend                             | true      |
    When I evaluate "heeft_aanspraak_op_persoonlijke_ondersteuning" of "participatiewet"
    Then the execution succeeds
    And output "heeft_aanspraak_op_persoonlijke_ondersteuning" is false
    And output "heeft_aanspraak_op_voorziening_arbeidsinschakeling" is true

  # Lid 5 maakt de aanvraag een voorwaarde voor het gevolg geven aan de
  # aanspraak. De aanspraak zelf (lid 1) blijft bestaan zonder aanvraag;
  # de toekenning niet.
  Scenario: Zonder aanvraag geen toekenning, wel een aanspraak
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                            | 999990101 |
      | ontvangt_algemene_bijstand                     | true      |
      | is_wia_uitstromer_artikel_34a_35_36            | false     |
      | heeft_nabestaandenuitkering_anw                | false     |
      | is_niet_uitkeringsgerechtigde                  | false     |
      | valt_onder_lid_2_wegens_voorziening            | false     |
      | college_acht_voorziening_noodzakelijk          | true      |
      | kan_taken_niet_verrichten_zonder_ondersteuning | true      |
      | aanvraag_ingediend                             | false     |
    When I evaluate "heeft_aanspraak_op_ondersteuning_arbeidsinschakeling" of "participatiewet"
    Then the execution succeeds
    And output "heeft_aanspraak_op_ondersteuning_arbeidsinschakeling" is true
    And output "heeft_aanspraak_op_persoonlijke_ondersteuning" is false
    And output "heeft_aanspraak_op_voorziening_arbeidsinschakeling" is false

  # ────────────────────────────────────────────────────────────────────
  # Artikel 10da — de enige harde aanspraak
  Scenario: Doelgroep loonkostensubsidie heeft aanspraak op begeleiding op de werkplek
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                       | 999990101 |
      | behoort_tot_doelgroep_lks | true      |
    When I evaluate "heeft_aanspraak_op_begeleiding_op_de_werkplek" of "participatiewet"
    Then the execution succeeds
    And output "heeft_aanspraak_op_begeleiding_op_de_werkplek" is true

  # Buiten de doelgroep loonkostensubsidie vervalt de harde aanspraak.
  # Wat overblijft is de route van art. 10 lid 1, met het
  # verordeningsvoorbehoud.
  Scenario: Buiten de LKS-doelgroep geen harde aanspraak op begeleiding
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                       | 999990105 |
      | behoort_tot_doelgroep_lks | false     |
    When I evaluate "heeft_aanspraak_op_begeleiding_op_de_werkplek" of "participatiewet"
    Then the execution succeeds
    And output "heeft_aanspraak_op_begeleiding_op_de_werkplek" is false
