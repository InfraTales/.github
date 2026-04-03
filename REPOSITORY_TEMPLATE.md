# InfraTales Repository Template

Use this template when creating new InfraTales repositories.

## Required Structure

```text
project-name/
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── SECURITY.md
├── .gitignore
├── .github/
│   └── workflows/
│       └── ci.yml
├── docs/
│   ├── architecture.md
│   ├── limitations.md
│   ├── cost.md
│   ├── security.md
│   ├── runbook.md
│   └── troubleshooting.md
├── diagrams/
│   ├── architecture.mmd
│   ├── sequence.mmd
│   └── dataflow.mmd
└── [implementation]
```

Not every repository needs every doc. The required set depends on the repo type. Production reference implementations need the full doc set. Case studies and learning examples should include the docs needed to explain what the repo actually is.

## README Template

```markdown
# InfraTales | [Repository Title]

**Repository Type:** [Production Reference Implementation | Architecture Case Study | Learning Example]
**Status:** [Experimental | Stable | Maintained | Archived]
**License:** [Open source or source-available; must match LICENSE]

[One paragraph describing what is actually checked in.]

## Who This Is For

[Audience]

## What Is Included

[Implementation, docs, or examples present in the repo]

## What Is Not Included

[Scope boundaries and non-goals]

## First-Run Verification

```bash
git clone https://github.com/InfraTales/project-name.git
cd project-name
[verified commands]
```

## Documentation

- [Architecture](docs/architecture.md)
- [Limitations](docs/limitations.md)
- [Additional docs required by the repo type]

## License

[State the actual license model and link to LICENSE]
```

## Checklist

- [ ] README declares repository type and status
- [ ] README claims were verified against the checked-in implementation
- [ ] LICENSE matches README language and package metadata
- [ ] `docs/limitations.md` exists
- [ ] Repo-type-specific docs exist where required
- [ ] CI enforces meaningful checks instead of presence-only checks
