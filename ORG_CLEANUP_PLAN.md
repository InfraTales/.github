# InfraTales Organization Cleanup Plan

This plan exists to raise the public quality bar across all InfraTales repositories.

## Phase 1 — Stop trust leakage

Complete these before publishing new repositories:

- classify every repository by type
- freeze new public repo creation until the review process is active
- resolve license ambiguity across the organization
- remove unsupported claims from public-facing docs
- prevent draft or broken repositories from being public

## Phase 2 — Establish one gold-standard repo

Select one repository to become the reference specimen for the organization.

That repository must:

- declare type and status
- pass the public release checklist
- have a verified first-run path
- have consistent docs and metadata
- have CI for build, lint, test, and validation
- include limitations and non-goals
- avoid unsupported claims

All future repository templates should be derived from this specimen.

## Phase 3 — Audit all public repositories

For each repository:

- assign a score using the review scorecard
- classify as public-ready, almost ready, needs serious cleanup, or should not be public yet
- reclassify, archive, privatize, or fix based on that score

## Phase 4 — Enforce standards

Add org-wide reusable workflows and branch protection so public quality is not dependent on memory or discipline alone.

## Phase 5 — Resume publication carefully

Only publish repositories that are complete for their type.

A smaller, cleaner public set is better than a larger set with inconsistent trust signals.

## Repository triage buckets

Use these buckets during the audit:

### Bucket A — Upgrade now

Closest to public-ready with limited cleanup.

### Bucket B — Reclassify

Useful repos that should become architecture case studies or learning examples rather than production references.

### Bucket C — Private or archive

Repos that are incomplete, misleading, broken, or too noisy to represent InfraTales publicly.
