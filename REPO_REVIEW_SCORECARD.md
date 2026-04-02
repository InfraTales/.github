# InfraTales Repository Review Scorecard

Use this scorecard before publishing or materially revising any public repository.

Maximum score: 100

A repository must score at least 85 to be public.
A repository scoring below 70 must be private, archived, or reclassified.

## 1. Honesty of claims — 20 points

Questions:

- Does the repo avoid overstating maturity?
- Are production, performance, reliability, cost, or security claims supported?
- Is the repo type declared accurately?

Scoring:

- 0–5: inflated or misleading
- 6–10: mixed; some unsupported claims
- 11–15: mostly honest, minor overreach
- 16–20: precise, credible, evidence-based

## 2. First-run reproducibility — 15 points

Questions:

- Can an outsider clone and get to a verified baseline?
- Do documented commands actually work?
- Are hidden assumptions avoided?

Scoring:

- 0–5: broken or unclear
- 6–10: partially works, gaps remain
- 11–15: clean and repeatable

## 3. Documentation accuracy — 15 points

Questions:

- Does README match reality?
- Are URLs, metadata, examples, and docs consistent?
- Are setup, usage, and limitations clear?

Scoring:

- 0–5: misleading or stale
- 6–10: usable but inconsistent
- 11–15: accurate and trustworthy

## 4. Engineering quality signals — 15 points

Questions:

- Is the structure coherent?
- Is the code organized and maintainable?
- Are tests, validation, and conventions visible?

Scoring:

- 0–5: rushed or noisy
- 6–10: uneven
- 11–15: disciplined and clean

## 5. Public hygiene — 10 points

Questions:

- Are governance files present?
- Is licensing clear and correct?
- Is placeholder content absent?
- Are issue/PR flows defined where relevant?

Scoring:

- 0–3: poor hygiene
- 4–7: basic hygiene
- 8–10: strong hygiene

## 6. Security hygiene — 10 points

Questions:

- Any secrets risk?
- Are sensitive configs handled properly?
- Are risky defaults or missing warnings present?

Scoring:

- 0–3: unsafe or misleading
- 4–7: acceptable but incomplete
- 8–10: mature and careful

## 7. Contributor readiness — 5 points

Questions:

- Can an outsider understand how to contribute?
- Is the contribution path clear?
- Is the repo too personal or internal to work publicly?

Scoring:

- 0–1: not contributor-ready
- 2–3: partially ready
- 4–5: clear and public-friendly

## 8. Maintenance signals — 5 points

Questions:

- Is status declared?
- Is support scope clear?
- Are changelog, releases, or verification dates present where appropriate?

Scoring:

- 0–1: weak or absent
- 2–3: some signals
- 4–5: strong signals

## 9. Architecture rigor — 5 points

Questions:

- Are trade-offs and non-goals documented?
- Does the repo show architectural judgment rather than surface polish?

Scoring:

- 0–1: shallow
- 2–3: moderate
- 4–5: strong

## Classification guidance

- 85–100: public-ready
- 70–84: almost ready; needs focused cleanup
- 50–69: needs serious cleanup
- below 50: should not be public

## Reviewer note

This scorecard is not for praise. It is for preventing trust damage.
