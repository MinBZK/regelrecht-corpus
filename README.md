# regelrecht-corpus

Opslagplaats voor Nederlandse wetten en regelgeving in machine-leesbaar YAML-formaat, bestemd voor gebruik door het [regelrecht](https://github.com/MinBZK/regelrecht-mvp) platform.

## Doel

Deze repository bevat de geoogste en verrijkte wetteksten die door de regelrecht pipeline worden geproduceerd. Elke wet wordt opgeslagen als YAML-bestand conform het [regelrecht-schema](https://github.com/MinBZK/regelrecht-mvp/tree/main/schema/latest).

## Directorystructuur

```
regulation/nl/
├── grondwet/                        # Grondwet
├── wet/                             # Formele wetten
│   └── wet_op_de_zorgtoeslag/
│       ├── 2025-01-01.yaml
│       └── 2024-01-01.yaml
├── amvb/                            # Algemene maatregelen van bestuur
├── ministeriele_regeling/           # Ministeriële regelingen
│   └── regeling_huurtoeslag/
│       └── 2025-01-01.yaml
├── beleidsregel/                    # Beleidsregels
├── uitvoeringsbeleid/               # Uitvoeringsbeleid
├── gemeentelijke_verordening/       # Gemeentelijke verordeningen
├── provinciale_verordening/         # Provinciale verordeningen
├── eu_verordening/                  # EU-verordeningen
├── eu_richtlijn/                    # EU-richtlijnen
└── verdrag/                         # Verdragen
```

### Padconventie

```
regulation/nl/{layer}/{slug}/{ingangsdatum}.yaml
```

| Component | Beschrijving | Voorbeeld |
|-----------|-------------|-----------|
| `layer` | Regelgevingslaag (zie directories hierboven) | `wet` |
| `slug` | Genormaliseerde naam van de wet (lowercase, underscores) | `wet_op_de_zorgtoeslag` |
| `ingangsdatum` | Datum waarop deze versie ingaat (`YYYY-MM-DD`) | `2025-01-01` |

Elke wet kan meerdere versies hebben, elk met een eigen ingangsdatum als bestandsnaam.

## Branches

| Branch | Inhoud | Schrijver |
|--------|--------|-----------|
| `main` | Tekst-only wetten (harvester) + goedgekeurde machine-leesbare versies (via PR) | Harvester + menselijke review |
| `draft-conversions` | Tekst + LLM-gegenereerde `machine_readable` secties | Pipeline enrichment (automatisch) |

## Gerelateerde projecten

- [regelrecht-mvp](https://github.com/MinBZK/regelrecht-mvp) — Platform met engine, harvester, pipeline en editor
