---
name: cloudfront-cache-tuning
description: CloudFront caching strategy is overly conservative for static content
metadata:
  type: project
---

**Finding:** CloudFront default_ttl = 3600 seconds (1 hour) for all static assets.

**Impact:** 
- Static HTML/CSS portfolio site has no reason to re-request from origin hourly
- Each TTL expiration = origin request to S3 = data transfer cost + compute
- Error responses (404, 403) not cached (0 min TTL) = origin hit on every browser 404

**Recommendation:**
- Increase default_ttl to 86400 (1 day) or 604800 (1 week) for static assets
- Set error response caching_min_ttl to 300-3600s (5 min to 1 hour)
- For long-lived static assets (CSS, images), set cache-control headers to max-age=31536000

**Cost impact:** MEDIUM. Assumes 100 daily visitors checking site 2-3x/day:
- Current: ~300 origin requests/day from CDN cache misses
- Optimized: ~10-30 origin requests/day
- Savings: ~$1-3/month (rough estimate at $0.085/10k requests)

**Trade-off:** Changes take 24h to propagate globally. For portfolio site (content rarely changes), acceptable.
