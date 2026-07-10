---
name: project-static-site-infra
description: Baseline architecture and intentional design decisions in terraform/ for the portfolio static site (S3 + CloudFront + OAC)
metadata:
  type: project
---

The `terraform/` directory provisions a static HTML/CSS portfolio site: private S3
bucket (`aws_s3_bucket.website`) + CloudFront distribution with Origin Access
Control (not legacy OAI) + S3 public access block. No IAM roles, no OIDC trust
policies, and no GitHub Actions workflows exist in the repo yet (checked
2026-07-09) — so the IAM/OIDC items in the standard security checklist don't
currently apply. Re-check for a `.github/workflows/` directory and any new IAM
resources in future audits, since a CI/CD deploy role is a likely near-term
addition given this is deployed via Terraform + GitHub Actions per CLAUDE.md.

`terraform/backend.tf` intentionally starts with the S3 backend block commented
out — this is a deliberate two-step bootstrap (apply once locally to create the
state bucket, then uncomment and `terraform init -migrate-state`). Do not flag
"no remote backend" as a standalone finding without checking this file's
comments first; instead flag the related real gap: see
[[project-repo-gitignore-gap]] for the risk of local state getting committed
during that bootstrap window.

**Why:** Avoids re-flagging intentional/documented design decisions as bugs in
future security review passes, and keeps track of which checklist items are
genuinely not-yet-applicable vs. actually missing.

**How to apply:** When auditing this repo, confirm whether `.github/workflows/`
or new `aws_iam_*` / OIDC resources have been added since 2026-07-09 before
skipping those checklist sections.
