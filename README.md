# InfraTales Organization Configuration

This repository is the governance and quality-control root for the InfraTales GitHub organization.

It contains:

- public repository standards
- community health defaults
- reusable workflows
- review templates
- licensing policy
- cleanup and release guidance

## Source Of Truth Documents

These files define the current public-repo model:

- [REPO_TYPES.md](REPO_TYPES.md)
- [PUBLIC_REPO_STANDARD.md](PUBLIC_REPO_STANDARD.md)
- [REPO_REVIEW_SCORECARD.md](REPO_REVIEW_SCORECARD.md)
- [PUBLIC_RELEASE_CHECKLIST.md](PUBLIC_RELEASE_CHECKLIST.md)
- [LICENSE_POLICY.md](LICENSE_POLICY.md)
- [ORG_CLEANUP_PLAN.md](ORG_CLEANUP_PLAN.md)

## What This Repo Does

- provides the organization profile and default support/security/contribution docs
- holds reusable workflows for Terraform and documentation validation
- defines the quality bar a repo must meet before it stays public
- reduces trust-damaging drift between README claims, repo contents, and license metadata

## Important Principle

InfraTales does not treat every public repository as production-ready. Repositories must be complete for their declared type and status. If a repo cannot honestly meet that bar, it should be reclassified, archived, or made private.
