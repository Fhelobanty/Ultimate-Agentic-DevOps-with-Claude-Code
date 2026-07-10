---
name: project-repo-gitignore-gap
description: Repo root has no .gitignore, so .terraform/ provider binaries and any local terraform.tfstate risk being committed
metadata:
  type: project
---

As of 2026-07-09 there is no `.gitignore` at the repo root. The `terraform/`
directory already has a `.terraform/` folder (downloaded provider binaries)
untracked only because the whole `terraform/` directory itself is untracked
(`git status` shows `?? terraform/`). Once `terraform/` is added to git without
a `.gitignore`, `.terraform/`, `*.tfstate`, and `*.tfstate.backup` would all get
committed — exposing account IDs/ARNs from state and bloating the repo with
provider binaries. This ties into the local-state bootstrap window described in
[[project-static-site-infra]] (backend.tf starts with S3 backend commented out,
so state is local-only until the second `terraform init -migrate-state` step).

**Why:** This is a real, currently-unresolved gap (not just a hypothetical) —
worth flagging every audit until a `.gitignore` is added, since it's an easy
miss that silently exposes state contents to version control.

**How to apply:** Check for a root `.gitignore` covering `.terraform/`,
`*.tfstate`, `*.tfstate.*`, `crash.log`, `override.tf*`, `*.auto.tfvars` (keep
`.terraform.lock.hcl` tracked — that one should be committed) on every future
terraform security audit of this repo. Remove/downgrade this memory once the
file is confirmed added.
