@regeling_rekening_courant_en_leningenbeheer_derden
Feature: Regeling rekening-courant- en leningenbeheer derden

  Background:
    Given de berekeningsdatum is "2005-05-02"

  Scenario: Vervroegde aflossing lening
    # Bron: Bijlage 1, Regeling rekening-courant- en leningenbeheer derden (BWBR0021734)
    Given de lening heeft de volgende modaliteiten:
      | modaliteit       | waarde          |
      | hoofdsom         | 1000000000      |
      | rentepercentage  | 2.94            |
      | startdatum       | 2004-11-19      |
      | einddatum        | 2008-11-19      |
    And de following cashflows zijn gedefinieerd:
      | datum       | type       | bedrag  |
      | 2005-11-21  | rente      | 29561096 |
      | 2005-11-21  | aflossing  | 2500000000 |
      | 2006-11-20  | rente      | 21989589 |
      | 2006-11-20  | aflossing  | 1500000000 |
      | 2007-11-19  | rente      | 17591671 |
      | 2007-11-19  | aflossing  | 1000000000 |
      | 2008-11-19  | rente      | 14700000 |
      | 2008-11-19  | aflossing  | 5000000000 |
    And de zero-rates en disconteringsfactoren zijn:
      | datum       | zero-rate | df       |
      | 2005-11-21  | 2.180%    | 0.9880   |
      | 2006-11-20  | 2.253%    | 0.9660   |
      | 2007-11-19  | 2.377%    | 0.9419   |
      | 2008-11-19  | 2.562%    | 0.9141   |
    When de marktwaarde wordt berekend als Σ (cashflow * df)
    Then is de marktwaarde gelijkt aan 1023593052
