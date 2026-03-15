# DevRampart

**Hardened Docker Starter Kit — Secure by Design**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![DevPod](https://img.shields.io/badge/DevPod-Ready-00C4B4)

DevRampart adalah starter kit Docker yang sudah di-hardened sesuai standar internasional:

- CIS Docker Benchmark (v1.8)
- NIST SP 800-190 (Application Container Security Guide)
- DISA STIG for Container Platform
- NSA & CISA Kubernetes and Container Hardening Guidance
- OWASP Container Security Verification Standard (CSVS)
- PCI DSS Container Guidelines

Satu kali clone → customize → langsung pakai di semua project kamu.  
Zero permission hell, DevPod ready, production-grade image, dan security scan otomatis.

---

## Fitur Utama

- Multi-stage Dockerfile (builder → dev → prod)
- Non-root user + read-only filesystem + capability drop
- HEALTHCHECK built-in
- docker-compose dengan override otomatis (dev & prod)
- Makefile sebagai single interface (make dev, make security, dll)
- Trivy CIS scan otomatis
- DevPod / VS Code / JetBrains support
- .dockerignore & security best practices
- SECURITY.md dengan compliance checklist

---

## Quick Start

```bash
# 1. Clone starter kit
git clone https://github.com/username/devrampart.git my-new-project
cd my-new-project

# 2. Jalankan development (paling sering)
make dev

# 3. Lihat semua command yang tersedia
make help
