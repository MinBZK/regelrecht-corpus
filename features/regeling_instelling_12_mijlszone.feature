@regeling_instelling_12_mijlszone
@BWBR0003614
Functie: Regeling instelling 12-mijlszone
  As een autoriteit verantwoordelijk voor de handhaving van visserijregels
  Wil ik de 12-mijlszone en verboden visserijactiviteiten voor niet-Nederlandse EU-vaartuigen kunnen controleren
  Om de duurzame exploitatie van visserijhulpbronnen in Nederlandse kustwateren te donde

  Achtergrond:
    Gegeven de regeling "Regeling instelling 12-mijlszone" (BWBR0003614)
    En de referentie naar Verordening (EG) nr. 2371/2002

  Scenario: Bepalen of een locatie binnen de 12-mijlszone valt
    Gegeven een locatie op <distance> zeemijlen zeewaarts vanaf de basislijn van de territoriale zee van Nederland
    Als ik controleer of deze locatie binnen de exclusieve zone valtt
    Dan moet het resultaat <expected> zijn

    Voorbeelden:
      | distance | expected          |
      | 0        | binnen de zone   |
      | 6        | binnen de zone   |
      | 12       | binnen de zone   |
      | 12.1     | buiten de zone   |
      | 24       | buiten de zone   |

  Scenario: Controle of visserij is toegestaan voor een Nederlands vaartuig binnen de 12-mijlszone
    Gegeven een vissersvaartuig met de Nederlandse vlag
    En het vaartuig bevindt zich op 10 zeemijlen zeewaarts van de basislijn
    Als ik controleer of visserij is toegestaan
    Dan moet het resultaat zijn: "toegestaan"

  Scenario: Controle of visserij is verboden voor een niet-Nederlands EU-vaartuig binnen de 12-mijlszone
    Gegeven een vissersvaartuig met de vlag van een andere EU-lidstaat dan Nederland
    En het vaartuig bevindt zich op 10 zeemijlen zeewaarts van de basislijn
    Als ik controleer of visserij is toegestaan
    Dan moet het resultaat zijn: "verboden" tenzij voortvloeiend uit Verordening (EG) nr. 2371/2002, artikel 17, tweede lid

  Scenario: Controle of visserij is toegestaan voor een niet-Nederlands EU-vaartuig buiten de 12-mijlszone
    Gegeven een vissersvaartuig met de vlag van Frankrijk
    En het vaartuig bevindt zich op 15 zeemijlen zeewaarts van de basislijn
    Als ik controleer of visserij is toegestaan
    Dan moet het resultaat zijn: "toegestaan"

  Scenario: Uitzondering voor visserijactiviteiten voortvloeiend uit Verordening (EG) nr. 2371/2002
    Gegeven een vissersvaartuig met de vlag van Duitsland
    En het vaartuig bevindt zich op 8 zeemijlen zeewaarts van de basislijn
    En de visserijactiviteit valtt onder de uitzonderingen van Verordening (EG) nr. 2371/2002, artikel 17, tweede lid
    Als ik controleer of visserij is toegestaan
    Dan moet het resultaat zijn: "toegestaan"

  Scenario: Verbod op visserij voor niet-EU vaartuigen binnen de 12-mijlszone
    Gegeven een vissersvaartuig met de vlag van een niet-EU land (bijv. Noorwegen)
    En het vaartuig bevindt zich op 10 zeemijlen zeewaarts van de basislijn
    Als ik controleer of visserij is toegestaan
    Dan moet het resultaat zijn: "verboden"
