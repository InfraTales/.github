# InfraTales Repository Types

InfraTales repositories must be classified into exactly one of the following types. This classification is not cosmetic. It determines what the repository is allowed to claim publicly, what documentation is required, and what validation must pass before the repository is made public.

## 1. Production Reference Implementation

Use this type only when the repository contains runnable code that is intended to serve as a serious public reference for engineers evaluating real architecture patterns.

A repository in this class must:

- build from a clean machine
- pass linting, type checks, and tests
- include validated setup and deployment steps
- include architecture, operations, security, cost, and troubleshooting documentation
- state assumptions, limits, and non-goals explicitly
- avoid unsupported claims about throughput, latency, reliability, or compliance
- include evidence for any strong production claim

A repository in this class may use language such as "reference implementation" or "production-oriented" only if those claims are supported by the repo contents.

## 2. Architecture Case Study

Use this type when the value of the repository is the system design, trade-offs, diagrams, runbooks, and decision records rather than runnable code.

A repository in this class must:

- state clearly in the first section of the README that it is a case study, not a turnkey deployable system
- include architecture diagrams and design rationale
- include explicit assumptions, constraints, trade-offs, and non-goals
- avoid clone, build, deploy, or test instructions unless those flows are actually present and verified
- avoid presenting itself as a full implementation

This type is appropriate for sanitized client patterns, architectural write-ups, and narrative technical breakdowns.

## 3. Learning Example

Use this type for educational repos intended to teach one pattern, service, or implementation concept without claiming production completeness.

A repository in this class must:

- define the learning objective clearly
- keep scope narrow
- explain what has been simplified
- include a quick start that actually works
- avoid production-readiness language unless the repo is validated to that bar

This type is appropriate for tutorial-quality repos, focused patterns, and minimal examples.

## 4. Internal / Draft

Use this type for work that is incomplete, unverified, inconsistent, or not yet safe for public consumption.

A repository in this class must not be public.

This includes repositories with:

- broken setup
- missing governance files
- inconsistent licensing
- placeholder content
- unsupported claims
- draft diagrams or incomplete documentation
- incorrect clone URLs, package metadata, or broken imports

## Required README declaration

Every public repository must declare its type near the top of the README using this format:

```md
**Repository Type:** Production Reference Implementation
**Status:** Stable
```

Allowed status values:

- Draft
- Experimental
- Stable
- Maintained
- Archived

## Rule of honesty

A repository must be complete for its type. A smaller but honest repo is better than a larger repo that over-promises.
