# Contributing to InfraTales

Thank you for your interest in contributing to InfraTales! We welcome contributions from the community.

## 📋 Mandatory Requirements

All contributions **MUST** follow these rules:

### 1. Code Quality Standards

- [ ] **Linting**: All code must pass linting checks
- [ ] **Tests**: Include tests for new features
- [ ] **Documentation**: Update relevant documentation
- [ ] **No secrets**: Never commit credentials, API keys, or secrets

### 2. Documentation Requirements

Every project **MUST** include:

| File | Required | Description |
|------|----------|-------------|
| `README.md` | ✅ Yes | InfraTales branded with hook title |
| `LICENSE` | ✅ Yes | MIT License |
| `CONTRIBUTING.md` | ✅ Yes | Contribution guidelines |
| `SECURITY.md` | ✅ Yes | Security policy |
| `docs/cost.md` | ✅ Yes | Cost analysis in ₹ |
| `docs/security.md` | ✅ Yes | Security overview |
| `docs/runbook.md` | ✅ Yes | Operations guide |
| `docs/troubleshooting.md` | ✅ Yes | Common issues |

### 3. Diagram Requirements

Every project **MUST** include Mermaid diagrams:

| File | Required | Description |
|------|----------|-------------|
| `diagrams/architecture.mmd` | ✅ Yes | System architecture |
| `diagrams/sequence.mmd` | ✅ Yes | Request/response flow |
| `diagrams/dataflow.mmd` | ✅ Yes | Data flow diagram |

### 4. README Format

All README files **MUST** follow this format:

```markdown
# InfraTales | [Hook] – [Architecture Description]

**Production-ready reference architecture for [description].**

> **[Detailed tagline]**

[![License: MIT](...)][...]
[![PRs Welcome](...)][...]
[![AWS](...)][...]
[![Terraform/CDK](...)][...]

[Content...]

<div align="center">
  <a href="https://infratales.com">Website</a> •
  <a href="https://infratales.com/projects">Projects</a> •
  <a href="https://infratales.com/premium">Premium</a> •
  <a href="https://infratales.com/newsletter">Newsletter</a>
</div>
```

### 5. Cost Documentation

All cost estimates **MUST** be in Indian Rupees (₹):

```markdown
| Service | Monthly Cost (₹) | Notes |
|---------|------------------|-------|
| EC2     | ₹10,000–20,000   | t3.large instances |
```

---

## 🔄 Contribution Workflow

### Step 1: Fork & Clone

```bash
# Fork the repository on GitHub
git clone git@github.com:YOUR_USERNAME/repo-name.git
cd repo-name
```

### Step 2: Create Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-fix-name
```

### Step 3: Make Changes

- Follow coding standards
- Add/update tests
- Update documentation
- Ensure all checks pass

### Step 4: Commit

Use conventional commits:

```bash
git commit -m "feat: add new feature"
git commit -m "fix: resolve issue with X"
git commit -m "docs: update README"
git commit -m "chore: update dependencies"
```

### Step 5: Push & PR

```bash
git push origin feature/your-feature-name
```

Create a Pull Request with:
- Clear description
- Link to related issues
- Screenshots (if UI changes)
- Test evidence

---

## ✅ PR Checklist

Before submitting a PR, ensure:

- [ ] Code follows project style guidelines
- [ ] Tests pass locally
- [ ] Documentation updated
- [ ] No sensitive data committed
- [ ] Commit messages follow conventional format
- [ ] PR description is clear and complete

---

## 🚫 What NOT to Do

- ❌ Commit secrets, credentials, or API keys
- ❌ Submit PRs without tests
- ❌ Make breaking changes without discussion
- ❌ Ignore code review feedback
- ❌ Use non-conventional commit messages

---

## 📞 Need Help?

- Open an issue for questions
- Tag maintainers for urgent matters
- Join our community discussions

---

<div align="center">
  <sub>Thank you for contributing to InfraTales! 🙏</sub>
</div>
