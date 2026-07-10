---
name: portfolio-cost-patterns
description: Cost optimization findings for static portfolio website using S3 + CloudFront
metadata:
  type: project
---

Portfolio website is a pure static HTML/CSS site with no build process, deployed via S3 + CloudFront + Terraform.

**Current infrastructure:**
- S3 bucket with versioning enabled (stores all object versions)
- CloudFront PriceClass_200 (moderate coverage, higher cost than PriceClass_100)
- Default CloudFront TTL: 3600s (1 hour) - very conservative for static content
- Error response caching: 0 min TTL (causes origin requests on every 404/403)
- Standard S3 storage class (no tiering, no lifecycle policies)
- No CloudFront logging (good)
- No custom domain/ACM certificate yet
- Terraform state backend commented out (will be separate cost)

**Key cost drivers:**
1. S3 versioning on static content (most impactful)
2. CloudFront conservative caching settings
3. No error response caching optimization
4. PriceClass_200 instead of PriceClass_100
