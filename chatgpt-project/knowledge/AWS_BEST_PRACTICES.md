# InfraTales AWS Best Practices

## AWS Well-Architected Framework

### 1. Operational Excellence
- **Infrastructure as Code** - Use Terraform or AWS CDK
- **Observability** - CloudWatch, X-Ray, OpenTelemetry
- **Runbooks** - Document operational procedures
- **CI/CD** - Automate deployments with GitHub Actions

### 2. Security
- **IAM** - Least privilege, no root access
- **Encryption** - At rest (KMS) and in transit (TLS 1.3)
- **Network** - VPC, Security Groups, NACLs
- **Compliance** - AWS Config, Security Hub, GuardDuty

### 3. Reliability
- **Multi-AZ** - Always deploy across AZs
- **Auto Scaling** - Handle load dynamically
- **Backups** - Automated with retention policies
- **DR** - Multi-region for critical workloads

### 4. Performance Efficiency
- **Right-sizing** - Use AWS Compute Optimizer
- **Caching** - ElastiCache, CloudFront
- **Database** - Choose appropriate engine
- **Serverless** - Lambda, Fargate when applicable

### 5. Cost Optimization
- **Reserved Instances** - 1 or 3 year commitments
- **Spot Instances** - For fault-tolerant workloads
- **S3 Lifecycle** - Move to cheaper tiers
- **Savings Plans** - Flexible commitment discounts

### 6. Sustainability
- **Efficient instances** - Graviton processors
- **Serverless** - Pay only for usage
- **Region selection** - Consider carbon footprint

---

## Architecture Patterns

### 3-Tier Web Application
```
┌─────────────────────────────────────────────────────────────┐
│                        CloudFront                           │
│                      (CDN + WAF)                            │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                   Application Load Balancer                 │
│                     (Multi-AZ, HTTPS)                       │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
┌───────▼───────┐     ┌───────▼───────┐     ┌───────▼───────┐
│   AZ-1a       │     │   AZ-1b       │     │   AZ-1c       │
│ ┌───────────┐ │     │ ┌───────────┐ │     │ ┌───────────┐ │
│ │    EC2    │ │     │ │    EC2    │ │     │ │    EC2    │ │
│ │  (ASG)    │ │     │ │  (ASG)    │ │     │ │  (ASG)    │ │
│ └───────────┘ │     │ └───────────┘ │     │ └───────────┘ │
└───────────────┘     └───────────────┘     └───────────────┘
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                    RDS Multi-AZ                             │
│               (Primary + Standby)                           │
└─────────────────────────────────────────────────────────────┘
```

### Microservices on EKS
```
┌─────────────────────────────────────────────────────────────┐
│                         Route 53                            │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                   API Gateway / ALB                         │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                      EKS Cluster                            │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐       │
│  │ Service │  │ Service │  │ Service │  │ Service │       │
│  │    A    │  │    B    │  │    C    │  │    D    │       │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘       │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              Service Mesh (Istio/App Mesh)          │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
┌───────▼───────┐     ┌───────▼───────┐     ┌───────▼───────┐
│   DynamoDB    │     │     RDS       │     │  ElastiCache  │
└───────────────┘     └───────────────┘     └───────────────┘
```

### Serverless Architecture
```
┌─────────────────────────────────────────────────────────────┐
│                      API Gateway                            │
└─────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
┌───────▼───────┐     ┌───────▼───────┐     ┌───────▼───────┐
│    Lambda     │     │    Lambda     │     │    Lambda     │
│   Function A  │     │   Function B  │     │   Function C  │
└───────────────┘     └───────────────┘     └───────────────┘
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
┌───────▼───────┐     ┌───────▼───────┐     ┌───────▼───────┐
│   DynamoDB    │     │      S3       │     │     SQS       │
└───────────────┘     └───────────────┘     └───────────────┘
```

---

## Security Checklist

### IAM
- [ ] No root account usage
- [ ] MFA enabled for all users
- [ ] Use IAM roles, not access keys
- [ ] Implement least privilege
- [ ] Regular access reviews
- [ ] Use AWS Organizations SCPs

### Network
- [ ] VPC with private subnets
- [ ] No public IPs on EC2 (use NAT)
- [ ] Security Groups - deny all by default
- [ ] VPC Flow Logs enabled
- [ ] WAF on public endpoints
- [ ] PrivateLink for AWS services

### Data
- [ ] S3 buckets private by default
- [ ] S3 Block Public Access enabled
- [ ] KMS encryption for sensitive data
- [ ] RDS encryption enabled
- [ ] Secrets in Secrets Manager
- [ ] No credentials in code

### Monitoring
- [ ] CloudTrail enabled (all regions)
- [ ] GuardDuty enabled
- [ ] Security Hub enabled
- [ ] Config Rules for compliance
- [ ] CloudWatch Alarms for anomalies

---

## Cost Optimization Strategies

### Compute
| Strategy | Savings | Use Case |
|----------|---------|----------|
| Reserved Instances | 30-60% | Steady-state workloads |
| Savings Plans | 20-40% | Flexible commitment |
| Spot Instances | 60-90% | Fault-tolerant workloads |
| Graviton | 20-40% | ARM-compatible apps |
| Right-sizing | 10-30% | Over-provisioned instances |

### Storage
| Strategy | Savings | Use Case |
|----------|---------|----------|
| S3 Intelligent-Tiering | Auto | Unknown access patterns |
| S3 Glacier | 80% | Archival data |
| EBS gp3 over gp2 | 20% | General purpose |
| Delete unused EBS | 100% | Orphaned volumes |

### Database
| Strategy | Savings | Use Case |
|----------|---------|----------|
| Aurora Serverless v2 | Variable | Unpredictable workloads |
| Reserved DB Instances | 30-60% | Production databases |
| DynamoDB On-Demand | Variable | Spiky traffic |

---

## Terraform Best Practices

```hcl
# Use modules
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"
  
  name = "infratales-vpc"
  cidr = "10.0.0.0/16"
  
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  
  enable_nat_gateway = true
  single_nat_gateway = false  # One per AZ for HA
  
  tags = local.common_tags
}

# Use locals for common tags
locals {
  common_tags = {
    Project     = "InfraTales"
    Environment = var.environment
    Owner       = "rahul.ladumor@infratales.com"
    ManagedBy   = "Terraform"
  }
}

# Use data sources
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# Remote state
terraform {
  backend "s3" {
    bucket         = "infratales-terraform-state"
    key            = "infrastructure/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
```

---

## Contact

**InfraTales** - Production-Ready AWS Infrastructure
- **Website:** https://infratales.com
- **GitHub:** https://github.com/InfraTales
- **Author:** Rahul Ladumor (rahul.ladumor@infratales.com)
