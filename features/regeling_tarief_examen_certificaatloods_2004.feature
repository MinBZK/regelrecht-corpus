@regeling_tarief_examen_certificaatloods_2004
Feature: Regeling tarief examen certificaatloods 2004

  Scenario: Exam fee for certification under Loodsenwet Article 5, second paragraph
    Given the regulation "regeling_tarief_examen_certificaatloods_2004" is active on "2004-01-01"
    When calculating the exam fee
    Then the output "examen_vergoeding" should be 21700 eurocent
