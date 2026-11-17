Feature: Financieel CV, werknemer-perspectief, casus Koen
  Als werknemer (Pwet-doelgroep, banenafspraak)
  Wil ik weten welke voorzieningen en voordelen mijn nieuwe dienstverband
  meebrengt
  Zodat ik weet wat ik zelf kan aanvragen en welk financieel kader er
  voor mijn werkgever achter mijn dienstverband zit

  # Afgeleid op 2026-10-09: datum_aanvraag_lks vervangt de boolean
  # "aanvraag binnen zes maanden". Waar die waar was, staat de aanvraag op een
  # maand na de aanvang van de dienstbetrekking; waar hij onwaar was, is er
  # geen aanvraag. Die datum is een aanname, geen gegeven uit de persona.

  # Afgeleid op 2026-10-25 (review B1): datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b
  # vervangt de boolean "was in de zes maanden voorafgaand een persoon als
  # bedoeld in artikel 7 lid 1 onderdeel a of 7a lid 1 onderdeel a". Koen had
  # een Pwet-uitkering tot hij op 1 januari 2026 in dienst trad; gekozen is
  # daarom de dag ervoor, 2025-12-31. Dat valt binnen de zes maanden (vanaf
  # 2025-07-01), dus de uitkomst blijft gelijk.
  #
  # Rechtgezet op 2026-10-25 (review C1): Koen is in dienst en het college heeft
  # zijn loonwaarde op 60% vastgesteld. Daarom staan
  # werkgever_is_voornemens_dienstbetrekking_aan_te_gaan,
  # dienstbetrekking_is_tot_stand_gekomen en college_heeft_loonwaarde_vastgesteld
  # nu op waar; voorheen stonden ze op onwaar en liep het recht alleen via lid 2.
  # Het recht loopt nu via lid 1 onderdeel a én via lid 2; de rekenregel van
  # lid 4 en het bedrag (89740,8 ec) veranderen niet.

  # Verticale slice door de Financieel CV vanuit werknemer-perspectief.
  # Sommige outputs zijn werkgever-voordelen (LKS, LKV) — die zijn voor
  # transparantie meegenomen: een werknemer mag weten wat de
  # gemeente/Belastingdienst aan zijn werkgever uitkeert om hem een
  # fatsoenlijk loon te kunnen geven.
  #
  # De engine-assertions zijn dezelfde als bij werkgever-perspectief.
  # Het persona-verschil zit in de presentatie-laag (brief-template),
  # die buiten scope is voor deze slice.
  #
  # Werknemerprofiel — Koen
  #   - 42 jaar (geboren 1984-03-15)
  #   - Pwet-uitkering, doelgroep banenafspraak
  #   - Geschatte loonwaarde 60% van WML
  #   - In dienst per 1 januari 2026 bij logistiek MKB via gemeente
  #   - €15 per uur × 32 uur per week × 52 weken
  #     = 1664 verloonde uren, jaarloon €24.960 (2.496.000 eurocent)
  #     (gecorrigeerd 25 oktober 2026: stond op €12, onder het
  #     minimumuurloon van €14,99 per 1 juli 2026.)
  #
  # Peildatum 2026-07-01: de machine_readable hangt op de
  # 2026-07-01-wetsversies, dus die peildatum laadt precies wat wij
  # hebben gemodelleerd. Kanttekening + drift-uitleg: zie
  # financieel_cv_sadee.feature.

  # ────────────────────────────────────────────────────────────────────
  # LKS — Participatiewet artikel 10c + 10d
  # WML+VB komt sinds 2026-09-26 uit de Wet minimumloon zelf: artikel 8
  # lid 1 onderdeel b met de herziening van artikel 14 geeft 233700 ec per
  # maand, artikel 15 telt daar 8% vakantiebijslag bij: 252396 ec.
  # Koen heeft loonwaarde 60% daarvan = 151437,6 ec (sinds 2026-10-09
  # rekent het model zelf met het percentage; daarvoor werd het afgeronde
  # bedrag 151438 aangeleverd).
  # Bruto subsidie = 252396 - 151437,6 = 100958,4 ec.
  # Maximum (lid 4): 70% van WML+VB = 176677,2 ec (jurist, 10 november 2026:
  # "maximaal 70% van het totale bedrag aan wml en vakantiebijslag").
  # Voltijdbedrag (36 uur) = MIN(100958,4, 176677,2) = 100958,4 ec
  # (€1.009,58). Koen werkt 32 uur; lid 4 tweede zin vermindert de subsidie
  # naar evenredigheid: 100958,4 x 32 / 36 = 89740,8 ec (€897,41 per maand).
  # Vergoeding werkgeverslasten (Regeling loonkostensubsidie Participatiewet
  # 2021, artikel 1: 25 procent) komt daar bovenop en valt buiten het
  # maximum (jurist, 10 november 2026): 25 procent van 89740,8 = 22435,2 ec;
  # samen 112176 ec (€1.121,76 per maand). Over welke loonkosten de 25
  # procent precies gaat, is een open lezing (markering bij artikel 10d).
  # Tot 10 november 2026 zat de vergoeding in de grondslag van het maximum
  # (315495 ec, maximum 220846,5 ec) en kwam ze niet bovenop de subsidie.
  #
  # Vóór de juristvalidatie van 2026-07-23 toonde het model hier het
  # 36-uursbedrag; dat was te hoog voor iedereen met een deeltijd-
  # dienstverband.
  #
  # De deling is niet rond: de engine rekent exact en kent geen
  # afrondingsoperatie, dus de assertion draagt decimalen (zie de
  # untranslatable over afronding). De presentatielaag rondt af.
  #
  # Werknemer-relevantie: Koen weet dat de gemeente per maand €897,41 aan
  # zijn werkgever betaalt om hem het WML-loon te kunnen geven.
  #
  # Tot 26 september 2026 stond hier 215500 ec als aangeleverde WML+VB, een
  # cijfer uit 2025, en kwam de subsidie uit op €766,22. Die aanname is
  # vervangen door een aanroep naar de Wet minimumloon; het bedrag is
  # daarmee herleidbaar tot artikel 8 en artikel 15 in plaats van tot een
  # invoerveld.
  Scenario: Gemeente betaalt €897,41 per maand LKS plus €224,35 vergoeding werkgeverslasten aan werkgever van Koen (32 uur)
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                 | 999990101 |
      | behoort_tot_doelgroep_lks                           | true      |
      | kan_minimumloon_niet_verdienen                      | true      |
      | datum_aanvraag_lks | 2026-02-01 |
      | datum_einde_deelname_onderwijs_lid_2_a | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b | 2025-12-31 |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false |
      | is_wsw_dienstbetrekking                             | false     |
      | loonwaarde_percentage | 60 |
      | overeengekomen_arbeidsduur_uren_per_week            | 32        |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan | true |
      | dienstbetrekking_is_tot_stand_gekomen | true |
      | college_heeft_loonwaarde_vastgesteld | true |
      | vaststelling_loonwaarde_blijft_achterwege | false |
      | datum_aanvang_dienstbetrekking | 2026-01-01 |
    When I evaluate outputs "heeft_recht_op_lks, bruto_subsidie_eurocent_per_maand, maximum_subsidie_eurocent_per_maand, hoogte_lks_voltijd_eurocent_per_maand, hoogte_lks_eurocent_per_maand, vergoeding_werkgeverslasten_eurocent_per_maand, hoogte_lks_met_vergoeding_werkgeverslasten_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "heeft_recht_op_lks" is true
    And output "bruto_subsidie_eurocent_per_maand" equals 100958.4
    And output "maximum_subsidie_eurocent_per_maand" equals 176677.2
    And output "hoogte_lks_voltijd_eurocent_per_maand" equals 100958.4
    And output "hoogte_lks_eurocent_per_maand" equals 89740.8
    And output "vergoeding_werkgeverslasten_eurocent_per_maand" equals 22435.2
    And output "hoogte_lks_met_vergoeding_werkgeverslasten_eurocent_per_maand" equals 112176

  # Voltijd: 36 uur laat het bedrag ongemoeid — de evenredigheidsfactor
  # is dan 1. Dit scenario bewaakt dat de correctie geen bedrag afsnoept
  # bij een volledige dienstbetrekking.
  Scenario: Bij 36 uur blijft de LKS gelijk aan het voltijdbedrag
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                 | 999990101 |
      | behoort_tot_doelgroep_lks                           | true      |
      | kan_minimumloon_niet_verdienen                      | true      |
      | datum_aanvraag_lks | 2026-02-01 |
      | datum_einde_deelname_onderwijs_lid_2_a | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b | 2025-12-31 |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false |
      | is_wsw_dienstbetrekking                             | false     |
      | loonwaarde_percentage | 60 |
      | overeengekomen_arbeidsduur_uren_per_week            | 36        |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan | true |
      | dienstbetrekking_is_tot_stand_gekomen | true |
      | college_heeft_loonwaarde_vastgesteld | true |
      | vaststelling_loonwaarde_blijft_achterwege | false |
      | datum_aanvang_dienstbetrekking | 2026-01-01 |
    When I evaluate outputs "heeft_recht_op_lks, hoogte_lks_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "hoogte_lks_eurocent_per_maand" equals 100958.4

  # Lid 4 spreekt van verminderen "of vermeerderen": onder 36 uur gaat
  # het bedrag omlaag, erboven omhoog. 27 uur is drie kwart van 36:
  # 100958,4 x 27 / 36 = 75718,8. Drie kwart dienstverband, drie kwart
  # subsidie.
  Scenario: Bij 27 uur is de LKS drie kwart van het voltijdbedrag
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                                 | 999990101 |
      | behoort_tot_doelgroep_lks                           | true      |
      | kan_minimumloon_niet_verdienen                      | true      |
      | datum_aanvraag_lks | 2026-02-01 |
      | datum_einde_deelname_onderwijs_lid_2_a | null |
      | datum_laatst_persoon_7_lid_1_a_of_7a_lid_2_b | 2025-12-31 |
      | volgde_onderwijs_zonder_startkwalificatie_leerwerktraject | false |
      | is_wsw_dienstbetrekking                             | false     |
      | loonwaarde_percentage | 60 |
      | overeengekomen_arbeidsduur_uren_per_week            | 27        |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan | true |
      | dienstbetrekking_is_tot_stand_gekomen | true |
      | college_heeft_loonwaarde_vastgesteld | true |
      | vaststelling_loonwaarde_blijft_achterwege | false |
      | datum_aanvang_dienstbetrekking | 2026-01-01 |
    When I evaluate outputs "heeft_recht_op_lks, hoogte_lks_voltijd_eurocent_per_maand, hoogte_lks_eurocent_per_maand" of "participatiewet"
    Then the execution succeeds
    And output "hoogte_lks_voltijd_eurocent_per_maand" equals 100958.4
    And output "hoogte_lks_eurocent_per_maand" equals 75718.8

  # ────────────────────────────────────────────────────────────────────
  # OPEN: Samenloop LKS ↔ LKV (Pwet 10d lid 9)
  #
  # Engine geeft onafhankelijk "recht = true" voor zowel LKS (gemeente,
  # €897,41/mnd) als LKV-banenafspraak (Belastingdienst, €1.680/jaar).
  # Pwet 10d lid 9 bevat een samenloopverbod tussen LKS en bepaalde
  # andere subsidies — moet door aggregator-laag worden uitgerekend.
  #
  # Wanneer de aggregator er is, komt hier een Scenario dat asserteert
  # of LKS en LKV-banenafspraak tegelijk uitgekeerd mogen worden.

  # ────────────────────────────────────────────────────────────────────
  # JC + WPA — Participatiewet artikel 10 lid 1
  # Toegevoegd 2026-09-02 naar aanleiding van de juristfeedback op de
  # doorloop: Wet WIA art. 35 lid 4.b sluit Koen uit, maar het recht op
  # jobcoaching en werkplekaanpassing bestaat wél — via de gemeente.
  # Art. 10 lid 1 geeft de aanspraak op ondersteuning bij arbeids-
  # inschakeling en op de noodzakelijk geachte voorziening, waaronder
  # persoonlijke ondersteuning bij het verrichten van de opgedragen
  # taken. Dat laatste is de gemeentelijke tegenhanger van WIA
  # art. 35 lid 2 onderdeel d.
  #
  # LET OP bij het lezen van de uitkomst: de aanspraak staat in de wet,
  # maar art. 10 lid 1 verleent haar "overeenkomstig de verordening,
  # bedoeld in artikel 8a". Vorm, duur en intensiteit zijn dus
  # gemeentelijk. Wat de engine hier zegt is: de route bestaat en Koen
  # zit in de doelgroep — niet welk bedrag of welke jobcoach.
  Scenario: Koen heeft via Pwet art. 10 aanspraak op persoonlijke ondersteuning en voorziening
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
      | behoort_tot_doelgroep_lks | true |
    When I evaluate outputs "heeft_aanspraak_op_ondersteuning_arbeidsinschakeling, behoort_tot_doelgroep_artikel_10, heeft_aanspraak_op_persoonlijke_ondersteuning, heeft_aanspraak_op_voorziening_arbeidsinschakeling" of "participatiewet"
    Then the execution succeeds
    And output "behoort_tot_doelgroep_artikel_10" is true
    And output "heeft_aanspraak_op_ondersteuning_arbeidsinschakeling" is true
    And output "heeft_aanspraak_op_persoonlijke_ondersteuning" is true
    And output "heeft_aanspraak_op_voorziening_arbeidsinschakeling" is true

  # ────────────────────────────────────────────────────────────────────
  # Begeleiding op de werkplek — Participatiewet artikel 10da
  # Dit is de enige harde aanspraak in de gemeentelijke keten: één zin,
  # geen verordeningsvoorbehoud, geen delegatie. Koen behoort tot de
  # doelgroep loonkostensubsidie (zie het LKS-scenario hierboven), dus
  # de aanspraak staat vast — anders dan bij art. 10 lid 1, waar de
  # gemeente de voorwaarden bepaalt.
  Scenario: Koen heeft als LKS-doelgroep een harde aanspraak op begeleiding op de werkplek
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                       | 999990101 |
      | behoort_tot_doelgroep_lks | true      |
      | werkgever_is_voornemens_dienstbetrekking_aan_te_gaan | true |
      | dienstbetrekking_is_tot_stand_gekomen | true |
      | college_heeft_loonwaarde_vastgesteld | true |
      | vaststelling_loonwaarde_blijft_achterwege | false |
      | datum_aanvang_dienstbetrekking | 2026-01-01 |
    When I evaluate "heeft_aanspraak_op_begeleiding_op_de_werkplek" of "participatiewet"
    Then the execution succeeds
    And output "heeft_aanspraak_op_begeleiding_op_de_werkplek" is true

  # ────────────────────────────────────────────────────────────────────
  # PP — Participatiewet artikel 8a lid 2 onderdeel d
  # Corrigeert de aanname in het WW-scenario dat proefplaatsing een
  # WW-instrument is. Koen kan wel degelijk op een proefplaats, maar via
  # de gemeente en met een kortere termijn: twee maanden, met verlenging
  # tot maximaal zes. Waar WW art. 76a, Wet WIA art. 37 en Wajong
  # art. 2:24 meteen zes maanden geven, begint de Participatiewet op een
  # derde daarvan.
  Scenario: Koen kan via Pwet art. 8a op proefplaats met behoud van bijstand
    Given the calculation date is "2026-07-01"
    And the following parameters:
      | bsn                                        | 999990101 |
      | behoort_tot_doelgroep_artikel_7_lid_1_a    | true      |
      | ontvangt_algemene_bijstand                 | true      |
      | college_verleent_toestemming_proefplaatsing | true     |
      | behoort_tot_doelgroep_lks | true |
    When I evaluate outputs "mag_proefplaatsing_aangaan, max_duur_proefplaatsing_maanden, max_duur_verlenging_proefplaatsing_maanden, max_totale_duur_proefplaatsing_maanden" of "participatiewet"
    Then the execution succeeds
    And output "mag_proefplaatsing_aangaan" is true
    And output "max_duur_proefplaatsing_maanden" equals 2
    And output "max_duur_verlenging_proefplaatsing_maanden" equals 4
    And output "max_totale_duur_proefplaatsing_maanden" equals 6
