Feature: Financieel CV — werkgever-perspectief, casus Sadee

  Scenario: Sadee krijgt LKV-arbeidsgehandicapt — hoogste tegemoetkoming wint (art. 4.1.3)
    Given the calculation date is "2026-07-01"
    Given parameter "bsn" is 999990100
    Given parameter "verloonde_uren" is 1664
    Given parameter "is_oudere_werknemer" is "false"
    Given parameter "is_arbeidsgehandicapte_werknemer" is "false"
    Given parameter "is_herplaatsen_arbeidsgehandicapte" is "false"
    Given parameter "is_doelgroep_banenafspraak" is "true"
    Given parameter "heeft_pensioengerechtigde_leeftijd_bereikt" is "false"
    Given parameter "heeft_loonaangifte_verzoek_ingediend" is "true"
    When I evaluate "heeft_recht_op_lkv" of "wet_tegemoetkomingen_loondomein"
    Then the execution succeeds
    Then output "heeft_recht_op_lkv" is true
    Then output "categorie_lkv" equals "arbeidsgehandicapte_werknemer"
    Then output "tegemoetkoming_arbeidsgehandicapte_eurocent" equals 507520
    Then output "tegemoetkoming_banenafspraak_eurocent" equals 168064
    Then output "hoogte_lkv_per_jaar_eurocent" equals 507520
