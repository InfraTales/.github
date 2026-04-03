# Contributing to InfraTales

Thank you for contributing to InfraTales.

## Mandatory Requirements

All contributions must preserve public trust:

- no unsupported production, security, performance, or cost claims
- no placeholder text or stale copy-paste residue
- no README, license, or metadata mismatches
- no secrets or unsafe defaults without warnings

## Documentation Requirements

Every public project repository must include:

| File | Required | Notes |
|------|----------|-------|
| `README.md` | Yes | Must declare repository type and status |
| `LICENSE` | Yes | Must match README language and metadata |
| `CONTRIBUTING.md` | Yes | Contribution path |
| `SECURITY.md` | Yes | Security reporting path |
| `docs/architecture.md` | Yes | Architecture or design explanation |
| `docs/limitations.md` | Yes | Limits and non-goals |

Production reference implementations also require:

- `docs/cost.md`
- `docs/security.md`
- `docs/runbook.md`
- `docs/troubleshooting.md`

## README Format

All public project READMEs should start with:

```markdown
# InfraTales | [Repository Title]

**Repository Type:** [Production Reference Implementation | Architecture Case Study | Learning Example]
**Status:** [Experimental | Stable | Maintained | Archived]

[Short summary of what the repo actually contains]
```

Do not add stronger language unless the repository contents support it.

## Contribution Workflow

1. Fork the repository.
2. Create a branch.
3. Make the change.
4. Run the documented checks locally.
5. Open a pull request with evidence that the change works.

## Pull Request Standard

Before opening a PR:

- ensure README claims still match the checked-in implementation
- update docs when setup, architecture, or behavior changed
- confirm license language still matches the checked-in `LICENSE`
- call out limitations honestly if the repo still has gaps
