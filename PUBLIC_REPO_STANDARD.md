# InfraTales Public Repository Standard

This document defines the minimum bar a repository must meet before it can be made public under the InfraTales organization.

A public repository represents the engineering standards of InfraTales. If a repository creates doubt about correctness, seriousness, or maintainability, it damages the entire organization, not just that repository.

## Public release gate

A repository must not be public until all of the following are true.

### 1. Identity and scope are clear

The README must clearly state:

- what problem the repository solves
- who it is for
- repository type
- status
- what is included
- what is not included
- whether the repository is runnable, illustrative, or narrative-only

### 2. Claims are supportable

The repository must not make unsupported claims about:

- performance
- throughput
- latency
- reliability
- production usage
- security posture
- compliance readiness
- cost

If such claims appear, the repository must provide evidence, method, assumptions, and limits.

### 3. First-run path is verified

For runnable repositories, a maintainer must verify from a clean environment that the following work as documented:

- clone
- install
- build
- lint
- test
- synth or validate
- example run or deployment flow if advertised

### 4. Governance is present

Every public repository must include:

- README.md
- LICENSE
- CONTRIBUTING.md
- SECURITY.md
- CODE_OF_CONDUCT.md or org-level equivalent
- .gitignore
- issue and PR templates if outside contribution is invited

### 5. Documentation matches reality

Commands, URLs, package metadata, screenshots, diagrams, and examples must refer to the actual repository and current implementation. Copy-paste leftovers are release blockers.

### 6. Security hygiene is sane

A public repository must not contain:

- secrets
- keys
- private endpoints
- local junk
- unsafe defaults without warnings
- misleading security claims

Sensitive configuration must use example placeholders and documented environment variables.

### 7. Maintenance status is explicit

Every public repository must declare one of:

- Experimental
- Stable
- Maintained
- Archived

Draft repositories must remain private.

## Additional requirements for Production Reference Implementations

These repositories must also include:

- architecture documentation
- operational runbook
- troubleshooting guide
- security notes specific to the implementation
- cost notes or cost drivers
- limitations and non-goals
- CI that enforces lint, test, and validation

## Public release blockers

The following are automatic blockers:

- license mismatch between README and LICENSE
- broken clone/build/setup path
- placeholder content
- editorial markers or drafting notes left in public docs
- incorrect clone URLs, repository URLs, or package metadata
- unsupported claims stated as fact
- missing core governance files

## Reviewer standard

Before a repository is made public, ask a harsh question:

Would a senior engineer who does not know us trust this repository after 3 minutes of inspection?

If the answer is not clearly yes, the repo is not ready.
