---
name: devops-ci-cd
description: >-
  DevOps and CI/CD engineer. Covers Docker, GitHub Actions,
  Fastlane (mobile CI), Codemagic, Terraform, and secure
  deployment pipelines.
---
# DevOps & CI/CD — Infrastructure Protocol

This skill governs all infrastructure, containerization,
and deployment pipeline work.

---

## 1. CONTAINERIZATION (Docker)

- **Multi-stage builds:** Minimize final image size and
  reduce attack surface.
- **Rootless execution:** Never run as root in containers.
  Use a dedicated non-root user.
- **Base images:** Lock to specific versions or digests
  (e.g., `alpine:3.20`, never `latest`).
- **Layer caching:** Order Dockerfile instructions from
  least to most frequently changing.

## 2. CI/CD PIPELINES

### GitHub Actions
- **Secrets:** NEVER hardcode. Use GitHub Secrets or
  encrypted environment variables.
- **Pin actions:** Use commit SHA for third-party actions,
  not tags (supply chain security).
- **Caching:** Configure dependency caching (npm, pub, pip)
  to keep runs under 5 minutes.
- **Matrix builds:** Test across multiple OS/SDK versions.

### Flutter-Specific CI
- **Fastlane:** Use for iOS/Android build automation,
  signing, and store deployment.
- **Codemagic:** Alternative managed CI for Flutter with
  built-in code signing.
- **Key workflow steps:**
  ```
  1. flutter pub get
  2. dart format --set-exit-if-changed .
  3. flutter analyze
  4. flutter test
  5. flutter build apk/ipa (release only)
  ```

## 3. DEPLOYMENT STRATEGIES

- **Zero-downtime:** Use Rolling Updates, Canary, or
  Blue-Green deployments.
- **Database first:** Run migrations BEFORE deploying new code.
- **Environment isolation:** Absolute separation between
  Dev, Staging, and Production.
- **Rollback plan:** Every deployment has a documented
  rollback procedure.

## 4. INFRASTRUCTURE AS CODE (IaC)

- **Terraform:** Lock provider versions. Use modules for
  reusable infrastructure components.
- **State management:** Use remote state backend (S3, GCS)
  with state locking.
- **Plan before apply:** Always `terraform plan` and review
  before `terraform apply`.

## 5. SECURITY

- **Image scanning:** Scan with `trivy` or equivalent before
  deploying containers.
- **Lint:** `hadolint` for Dockerfiles, `actionlint` for
  GitHub Action YAML files.
- **TLS everywhere:** No unencrypted traffic in production.
- **Least privilege:** IAM roles with minimal permissions.

## 6. QUALITY GATE

1. All CI pipelines green before merge.
2. Docker images scanned for vulnerabilities.
3. Deployment tested in staging before production.
4. Rollback procedure documented and tested.
