# InfraTales Governance

## Overview

InfraTales is an open-source organization providing production-ready AWS infrastructure reference architectures. This document outlines our governance structure, decision-making processes, and community guidelines.

---

## Roles & Responsibilities

### Maintainers

Maintainers are responsible for:
- Reviewing and merging pull requests
- Managing releases and versioning
- Ensuring code quality and security standards
- Responding to issues and community questions
- Making architectural decisions

**Current Maintainers:**
- @rahulladumor (Lead Maintainer)

### Contributors

Contributors are community members who:
- Submit pull requests
- Report bugs and suggest features
- Improve documentation
- Help answer community questions

### Reviewers

Specialized reviewers for specific areas:
- **Security Team**: Security-related changes
- **Infrastructure Team**: Terraform/CDK code
- **Documentation Team**: Docs and diagrams

---

## Decision Making

### Minor Changes
- Bug fixes, typos, small improvements
- Single maintainer approval required
- Merged within 24-48 hours

### Standard Changes
- New features, significant improvements
- Two maintainer approvals required
- 3-5 day review period

### Major Changes
- Architecture changes, breaking changes
- All maintainers must approve
- 7-14 day discussion period
- May require RFC (Request for Comments)

---

## Versioning Policy

We follow [Semantic Versioning](https://semver.org/):

| Version | Description |
|---------|-------------|
| `MAJOR.x.x` | Breaking changes |
| `x.MINOR.x` | New features (backward compatible) |
| `x.x.PATCH` | Bug fixes (backward compatible) |

### Release Schedule
- **Patch releases**: As needed
- **Minor releases**: Monthly
- **Major releases**: Quarterly (with migration guides)

---

## Branch Strategy

```
main (protected)
  │
  ├── develop (integration)
  │     │
  │     ├── feature/xxx
  │     ├── fix/xxx
  │     └── docs/xxx
  │
  └── release/v1.x.x (release branches)
```

### Branch Protection Rules

**main branch:**
- ✅ Require pull request reviews (2 approvers)
- ✅ Require status checks to pass
- ✅ Require conversation resolution
- ✅ Require signed commits
- ✅ Restrict who can push
- ✅ No force pushes
- ✅ No deletions

---

## Code of Conduct

All participants must adhere to our [Code of Conduct](CODE_OF_CONDUCT.md).

## Security Policy

Security vulnerabilities should be reported per our [Security Policy](SECURITY.md).

---

## Changes to Governance

Changes to this governance document require:
1. RFC with 14-day comment period
2. Approval from all maintainers
3. Community notification

---

<div align="center">
  <sub>InfraTales Governance v1.0 • Last updated: November 2024</sub>
</div>
