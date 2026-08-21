Feature: Doelgroepregister banenafspraak, Wfsv artikel 38b
  Als UWV
  Wil ik per persoon kunnen vaststellen of hij tot de doelgroep
  banenafspraak behoort en op welke grond
  Zodat de regelingen die daarop steunen — het loonkostenvoordeel
  banenafspraak (Wtl 2.10) en de no-riskpolis (Ziektewet 29b lid 2
  onderdeel e) — dezelfde vaststelling gebruiken

  # Artikel 38b is de kapstok onder het Financieel CV: zowel de Wtl als de
  # Ziektewet halen het doelgroepregister hier op via een source-verwijzing.
  # Tot deze ronde had het artikel geen enkel scenario, waardoor de kapstok
  # zelf nooit werd doorgerekend en een fout erin pas verderop zichtbaar
  # zou worden — of helemaal niet.
  #
  # Structuur van het artikel:
  #   - lid 1 kent zes gronden (a t/m f), lid 2 een zevende, lid 6 een
  #     blijfgrond voor wie ooit aan lid 1 of 2 voldeed;
  #   - de chapeau van lid 1 sluit uit wie volgens Pwet 10b uitsluitend in
  #     een beschutte omgeving kan werken;
  #   - de uitkomst is: NIET uitgesloten EN ten minste één grond.
  #
  # Elk scenario assert elke grond afzonderlijk, niet alleen de eindwaarde.
  # Een verkeerde OF/EN in de eindregel flipt dan een checkpoint in plaats
  # van stilletjes hetzelfde antwoord te geven.
  #
  # Peildatum 2026-07-01, gelijk aan de persona-scenario's die deze
  # vaststelling consumeren.

  Background:
    Given the calculation date is "2026-07-01"

  # ────────────────────────────────────────────────────────────────────
  # De twee persona's uit het Financieel CV
  # ────────────────────────────────────────────────────────────────────

  # Koen komt binnen via onderdeel a: vanuit de Participatiewet toegeleid
  # naar een dienstbetrekking, met een UWV-vaststelling dat hij het
  # minimumloon niet zelfstandig kan verdienen. Dit is dezelfde grond die
  # zijn loonkostensubsidie draagt.
  Scenario: Koen staat in het register op grond van onderdeel a
    Given the following parameters:
      | bsn                                                      | 999990101  |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | true       |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2025-11-03 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd                           | true       |
    When I evaluate "behoort_tot_doelgroepregister_banenafspraak" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_1_a" is true
    And output "voldoet_aan_grond_38b_1_b" is false
    And output "voldoet_aan_grond_38b_1_c" is false
    And output "voldoet_aan_grond_38b_1_d" is false
    And output "voldoet_aan_grond_38b_1_e" is false
    And output "voldoet_aan_grond_38b_1_f" is false
    And output "voldoet_aan_grond_38b_2" is false
    And output "voldoet_aan_grond_38b_6" is false
    And output "behoort_tot_doelgroepregister_banenafspraak" is true
    And output "grond_opname_doelgroepregister" equals "pwet_lks_uwv_loonwaarde"
    And output "datum_opname_doelgroepregister" equals "2025-11-03"
    And output "vaststelling_door" equals "UWV"

  # Sadee komt binnen via onderdeel c: recht op arbeidsondersteuning
  # Wajong. Onderdeel c kent een eigen uitsluiting — wie duurzaam geen
  # mogelijkheden tot arbeidsparticipatie heeft (Wajong 1a:1) valt er
  # buiten. Die staat hier uit; het twin-scenario hieronder zet hem aan.
  Scenario: Sadee staat in het register op grond van onderdeel c
    Given the following parameters:
      | bsn                                                      | 999990100  |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | true       |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2023-09-12 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd                           | true       |
    When I evaluate "behoort_tot_doelgroepregister_banenafspraak" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_1_a" is false
    And output "voldoet_aan_grond_38b_1_c" is true
    And output "voldoet_aan_grond_38b_2" is false
    And output "voldoet_aan_grond_38b_6" is false
    And output "behoort_tot_doelgroepregister_banenafspraak" is true
    And output "grond_opname_doelgroepregister" equals "wajong"
    And output "datum_opname_doelgroepregister" equals "2023-09-12"

  # Twin van het vorige scenario: precies één as verschilt. Wie duurzaam
  # geen mogelijkheden tot arbeidsparticipatie heeft, valt buiten
  # onderdeel c — en zonder andere grond dus buiten het register.
  Scenario: Wajong met duurzaam geen mogelijkheden valt buiten onderdeel c
    Given the following parameters:
      | bsn                                                      | 999990100  |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | true       |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | true       |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2023-09-12 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd                           | true       |
    When I evaluate "behoort_tot_doelgroepregister_banenafspraak" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_1_c" is false
    And output "behoort_tot_doelgroepregister_banenafspraak" is false
    And output "grond_opname_doelgroepregister" equals "geen"

  # ────────────────────────────────────────────────────────────────────
  # De overige gronden — elk apart, zodat geen tak ongetest blijft
  # ────────────────────────────────────────────────────────────────────

  Scenario Outline: Elke afzonderlijke grond opent het register: <grond>
    Given the following parameters:
      | bsn                                                      | 999990102  |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | <a>        |
      | is_wsw_geindiceerd_of_oude_indicatie                     | <b>        |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | <c>        |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | <d>        |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | <e>        |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | <f>        |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | <lid2>     |
      | datum_eerste_opname_doelgroepregister                    | 2024-05-01 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd                           | true       |
    When I evaluate "behoort_tot_doelgroepregister_banenafspraak" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "behoort_tot_doelgroepregister_banenafspraak" is true
    And output "grond_opname_doelgroepregister" equals "<opnamegrond>"

    Examples:
      | grond            | a     | b     | c     | d     | e     | f     | lid2  | opnamegrond                |
      | onderdeel b, Wsw | false | true  | false | false | false | false | false | wsw                        |
      | onderdeel d      | false | false | false | true  | false | false | false | amvb_38b_1_d               |
      | onderdeel e      | false | false | false | false | true  | false | false | pwet_uwv_wml_eigen_verzoek |
      | onderdeel f      | false | false | false | false | false | true  | false | overgangsrecht_38b_1_f     |
      | lid 2            | false | false | false | false | false | false | true  | jonggehandicapt_uwv_oordeel |

  # Onderdeel f kent, net als c, een eigen tegen-uitsluiting: wie destijds
  # onder lid 1.c viel maar inmiddels duurzaam geen mogelijkheden heeft,
  # houdt het overgangsrecht niet.
  Scenario: Tegen-uitsluiting van onderdeel f neutraliseert het overgangsrecht
    Given the following parameters:
      | bsn                                                      | 999990102  |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | true       |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | true       |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2014-02-01 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd                           | true       |
    When I evaluate "behoort_tot_doelgroepregister_banenafspraak" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_1_f" is false
    And output "behoort_tot_doelgroepregister_banenafspraak" is false

  # ────────────────────────────────────────────────────────────────────
  # Lid 6 — de blijfgrond
  # ────────────────────────────────────────────────────────────────────

  # Wie ooit aan lid 1 of 2 voldeed en van wie de registratie nog niet is
  # geëindigd, blijft in de doelgroep, ook als de oorspronkelijke grond
  # inmiddels is vervallen. Zonder deze regel verliest iemand in één klap
  # het LKV, de no-riskpolis en de loonkostensubsidie.
  Scenario: Lid 6 houdt iemand in het register nadat zijn oorspronkelijke grond verviel
    Given the following parameters:
      | bsn                                                      | 999990103  |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2019-06-17 |
      | was_arbeidsbeperkte_lid_1_of_2                           | true       |
      | registratie_nog_niet_geeindigd                           | true       |
    When I evaluate "behoort_tot_doelgroepregister_banenafspraak" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_1_a" is false
    And output "voldoet_aan_grond_38b_2" is false
    And output "voldoet_aan_grond_38b_6" is true
    And output "behoort_tot_doelgroepregister_banenafspraak" is true
    # NB: grond_opname_doelgroepregister kent geen tak voor lid 6, dus valt
    # hier terug op de default. Iemand staat dan wél in het register terwijl
    # het veld dat de grond benoemt "geen" zegt. Dat is een gat in de
    # modellering van dit ene veld, niet in de registratie zelf — vastgelegd
    # zodat het zichtbaar blijft in plaats van te verdwijnen.
    And output "grond_opname_doelgroepregister" equals "geen"

  # Twin: dezelfde persoon, maar zijn registratie is beëindigd. Lid 6
  # vraagt om beide voorwaarden tegelijk.
  Scenario: Beëindigde registratie sluit de blijfgrond van lid 6 af
    Given the following parameters:
      | bsn                                                      | 999990103  |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2019-06-17 |
      | was_arbeidsbeperkte_lid_1_of_2                           | true       |
      | registratie_nog_niet_geeindigd                           | false      |
    When I evaluate "behoort_tot_doelgroepregister_banenafspraak" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_6" is false
    And output "behoort_tot_doelgroepregister_banenafspraak" is false

  # ────────────────────────────────────────────────────────────────────
  # De chapeau-uitsluiting
  # ────────────────────────────────────────────────────────────────────

  # Wie volgens Pwet 10b lid 1 uitsluitend in een beschutte omgeving onder
  # aangepaste omstandigheden kan werken, is per definitie geen
  # arbeidsbeperkte in de zin van 38b — ook niet als een grond op zich
  # geldt. Dit is de enige plek waar een grond wordt overruled.
  Scenario: Beschut werk sluit uit, ook met een geldende grond
    Given the following parameters:
      | bsn                                                      | 999990104  |
      | is_uitgesloten_beschut_werk_pwet_10b                     | true       |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | true       |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2025-01-06 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd                           | true       |
    When I evaluate "behoort_tot_doelgroepregister_banenafspraak" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "voldoet_aan_grond_38b_1_a" is true
    And output "behoort_tot_doelgroepregister_banenafspraak" is false
    # De grond geldt, de chapeau wint. Het veld dat de grond benoemt kijkt
    # niet naar de chapeau en noemt hem alsnog — zelfde gat als bij lid 6.
    And output "grond_opname_doelgroepregister" equals "pwet_lks_uwv_loonwaarde"

  # Sluitstuk: geen enkele grond, niets uitgesloten.
  Scenario: Zonder enige grond staat niemand in het register
    Given the following parameters:
      | bsn                                                      | 999990105  |
      | is_uitgesloten_beschut_werk_pwet_10b                     | false      |
      | is_pwet_lks_toegeleid_met_uwv_loonwaarde_vaststelling    | false      |
      | is_wsw_geindiceerd_of_oude_indicatie                     | false      |
      | heeft_wajong_arbeidsondersteuning_of_uitkering           | false      |
      | heeft_wajong_duurzaam_geen_mogelijkheden                 | false      |
      | voldoet_aan_amvb_indicatie_38b_1_d                       | false      |
      | is_pwet_toegeleid_met_uwv_wml_vaststelling_eigen_verzoek | false      |
      | was_arbeidsbeperkte_lid_1_b_of_c_op_of_na_2013_01_01     | false      |
      | was_lid_1_c_en_nu_wajong_duurzaam_geen_mogelijkheden     | false      |
      | is_jonggehandicapt_uwv_oordeel_lid_2                     | false      |
      | datum_eerste_opname_doelgroepregister                    | 2026-01-01 |
      | was_arbeidsbeperkte_lid_1_of_2                           | false      |
      | registratie_nog_niet_geeindigd                           | true       |
    When I evaluate "behoort_tot_doelgroepregister_banenafspraak" of "wet_financiering_sociale_verzekeringen"
    Then the execution succeeds
    And output "behoort_tot_doelgroepregister_banenafspraak" is false
    And output "grond_opname_doelgroepregister" equals "geen"
    And output "verloonde_uren_definitie_actief" is true
