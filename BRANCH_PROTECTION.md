# Branch Protection Configuration

## Recommended Branch Protection Rules for InfraTales Repositories

### Main Branch (`main`)

Enable these settings in GitHub → Settings → Branches → Branch protection rules:

#### Required Settings

| Setting | Value | Description |
|---------|-------|-------------|
| **Require pull request reviews** | ✅ Enabled | PRs need approval before merge |
| **Required approving reviews** | 2 | Minimum reviewers for production code |
| **Dismiss stale reviews** | ✅ Enabled | New commits require re-review |
| **Require review from CODEOWNERS** | ✅ Enabled | Relevant owners must approve |
| **Require status checks** | ✅ Enabled | CI must pass |
| **Require branches to be up to date** | ✅ Enabled | Branch must be current |
| **Required status checks** | `validate`, `security`, `documentation` | CI jobs that must pass |
| **Require conversation resolution** | ✅ Enabled | All comments must be resolved |
| **Require signed commits** | ✅ Enabled | GPG signed commits only |
| **Require linear history** | ✅ Enabled | No merge commits |
| **Include administrators** | ✅ Enabled | Rules apply to admins too |
| **Restrict pushes** | ✅ Enabled | Only via PR |
| **Allow force pushes** | ❌ Disabled | Prevent history rewriting |
| **Allow deletions** | ❌ Disabled | Prevent branch deletion |

---

### Develop Branch (`develop`)

| Setting | Value |
|---------|-------|
| **Require pull request reviews** | ✅ Enabled |
| **Required approving reviews** | 1 |
| **Require status checks** | ✅ Enabled |
| **Required status checks** | `validate` |
| **Allow force pushes** | ❌ Disabled |

---

### Feature Branches (`feature/*`, `fix/*`, `docs/*`)

No protection rules required - these are developer working branches.

---

## GitHub CLI Commands

Apply branch protection via CLI:

```bash
# Main branch protection
gh api repos/{owner}/{repo}/branches/main/protection \
  --method PUT \
  --field required_status_checks='{"strict":true,"contexts":["validate","security"]}' \
  --field enforce_admins=true \
  --field required_pull_request_reviews='{"dismiss_stale_reviews":true,"require_code_owner_reviews":true,"required_approving_review_count":2}' \
  --field restrictions=null \
  --field required_linear_history=true \
  --field allow_force_pushes=false \
  --field allow_deletions=false
```

---

## Rulesets (GitHub Enterprise)

For organizations with GitHub Enterprise, use Rulesets for org-wide rules:

```yaml
name: InfraTales Main Protection
target: branch
enforcement: active
conditions:
  ref_name:
    include: ["refs/heads/main"]
rules:
  - type: pull_request
    parameters:
      required_approving_review_count: 2
      dismiss_stale_reviews_on_push: true
      require_code_owner_review: true
  - type: required_status_checks
    parameters:
      strict_required_status_checks_policy: true
      required_status_checks:
        - context: validate
        - context: security
  - type: non_fast_forward
  - type: required_signatures
```

---

## Verification

Check current protection:

```bash
gh api repos/InfraTales/{repo}/branches/main/protection
```

---

<div align="center">
  <sub>Apply these rules to all InfraTales repositories for enterprise-grade security</sub>
</div>
