# InfraTales Security Policy

## 🔒 Security Standards

All InfraTales projects **MUST** adhere to these security standards:

### Mandatory Security Requirements

| Requirement | Description | Status |
|-------------|-------------|--------|
| **No Hardcoded Secrets** | Never commit credentials, API keys, tokens | ✅ Required |
| **Encrypted State** | Use encrypted remote state (S3 + KMS) | ✅ Required |
| **IAM Least Privilege** | Minimal permissions for all roles | ✅ Required |
| **Encryption at Rest** | Enable encryption for all data stores | ✅ Required |
| **Encryption in Transit** | TLS 1.2+ for all communications | ✅ Required |
| **Audit Logging** | CloudTrail enabled for all accounts | ✅ Required |
| **Security Groups** | Restrictive inbound/outbound rules | ✅ Required |

### Security Checklist for PRs

Before merging, verify:

- [ ] No secrets in code or configuration
- [ ] IAM policies follow least privilege
- [ ] Security groups are properly restricted
- [ ] Encryption is enabled where applicable
- [ ] Logging and monitoring are configured
- [ ] Dependencies are up to date

---

## 🚨 Reporting a Vulnerability

### Do NOT

- ❌ Create a public GitHub issue for security vulnerabilities
- ❌ Share vulnerability details publicly before resolution
- ❌ Exploit the vulnerability beyond proof-of-concept

### Do

1. **Email**: Send details to security@infratales.com
2. **Include**:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)
3. **Wait**: Allow 90 days for resolution before public disclosure

### Response Timeline

| Stage | Timeline |
|-------|----------|
| Acknowledgment | Within 48 hours |
| Initial Assessment | Within 7 days |
| Resolution Plan | Within 14 days |
| Fix Deployed | Within 90 days |

---

## 🛡️ Security Best Practices

### For Infrastructure Code

```hcl
# ✅ Good: Use variables for sensitive data
variable "db_password" {
  type      = string
  sensitive = true
}

# ❌ Bad: Hardcoded secrets
password = "my-secret-password"
```

### For AWS Resources

```hcl
# ✅ Good: Encrypted storage
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.example.arn
    }
  }
}

# ✅ Good: Restrictive security group
resource "aws_security_group_rule" "allow_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/8"]  # Internal only
  security_group_id = aws_security_group.example.id
}
```

### For Secrets Management

```bash
# ✅ Good: Use AWS Secrets Manager
aws secretsmanager create-secret --name /prod/db/password

# ✅ Good: Use environment variables
export DB_PASSWORD=$(aws secretsmanager get-secret-value ...)

# ❌ Bad: Secrets in code
DB_PASSWORD="hardcoded-password"
```

---

## 📋 Supported Versions

| Version | Supported |
|---------|-----------|
| Latest (main branch) | ✅ Yes |
| Previous releases | ⚠️ Best effort |
| Deprecated versions | ❌ No |

---

## 🏆 Security Hall of Fame

We thank the following researchers for responsibly disclosing vulnerabilities:

*No submissions yet. Be the first!*

---

<div align="center">
  <sub>Security is everyone's responsibility. Thank you for helping keep InfraTales secure! 🔐</sub>
</div>
