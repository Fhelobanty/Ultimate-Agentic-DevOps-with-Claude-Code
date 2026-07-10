---
name: s3-versioning-impact
description: S3 versioning overhead on static content
metadata:
  type: project
---

**Finding:** S3 versioning is enabled on the portfolio website bucket.

**Impact:** For a static site with deployments, every deployment cycle creates new versions of all objects. Portfolio sites are typically 100-500 KB total (HTML + CSS). Even at 200 KB per deployment:
- 1 deployment per week = ~10 MB/month of extra storage = negligible cost
- But unnecessary overhead for zero benefit (versioning not needed for CI/CD-deployed static sites)

**Better approach:** Disable versioning permanently. Use S3 object tags or cloudformation deletion policies for deployment safety if needed.

**Cost impact:** LOW for this particular site size, but demonstrates waste. Estimated savings: $0.05-0.10/month (assumes small portfolio site).

**Why this matters:** The principle matters — other resources may have similar "enabled by default" settings that do cost more.
