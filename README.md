# DevRampart

**Hardened Docker Starter Kit — Secure by Design**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![DevPod](https://img.shields.io/badge/DevPod-Ready-00C4B4)

DevRampart is a Docker starter kit that has been hardened according to international standards.
One-time clone → customize → use directly across all your projects.
Zero permission hell, DevPod ready, production-grade image, and automatic security scanning.

### 🎯 Key Features

- **Hardened Docker Setup** — Docker configuration that is secure according to security standards
- **Default Setup Nuxt.js** — Pre-configured for Nuxt.js projects
- **Zero Permission Hell** — No complicated permission issues
- **DevPod Ready** — Can be used directly with DevPod/VS Code DevContainers
- **Production-Grade Image** — Image ready for production
- **Automatic Security Scan** — Automatic CVE scanning

# Project Structure

```
devrampart/
├── docker/
│   ├── Dockerfile          # Image definition
│   ├── daemon-local.json   # Docker daemon config
│   └── entrypoint.sh       # Entry point script
├── scripts/
│   ├── init-local.sh       # Local initialization
│   └── verify-secrets.sh   # Secrets checker
├── docker-compose.yml      # Base compose
├── docker-compose.prod.yml # Production config
├── Makefile                # Command shortcuts
└── README.md               # Documentation
```

# Quick Start

## 1. GitHub Template Repository (Recommended - Cleanest & Official)

This repository is set up as a template repository, allowing you to create a new project without git history.

### Using Browser:

1. Open: https://github.com/PT-Garda-Sistem-Digital/devrampart
2. Click the green button **"Use this template"** → **"Create a new repository"**
3. Name your new repository (example: `my-app`)
4. Click **Create repository**

### Using GitHub CLI (One-Command):

```bash
gh repo create my-new-project \
  --template PT-Garda-Sistem-Digital/devrampart \
  --public \
  --clone

cd my-new-project
```

## 2. npx degit (Super Fast - Without Git History)

The fastest method to clone a template without full git history.

### From GitHub Repository (Recommended - Always Latest Version):

```bash
npx degit PT-Garda-Sistem-Digital/devrampart my-new-project
cd my-new-project
```

### From npm Registry (When Published):

```bash
# After package is published to npm
npx devrampart@latest my-new-project
cd my-new-project
```

## 3. Git Clone (Fallback - With Git History)

Traditional method that clones the entire git history.

```bash
git clone https://github.com/PT-Garda-Sistem-Digital/devrampart.git my-new-project
cd my-new-project
```

## 4. Additional Alternative Methods

### Via curl + Install Script:

```bash
curl -fsSL https://raw.githubusercontent.com/PT-Garda-Sistem-Digital/devrampart/main/install.sh | bash -s -- my-new-project
cd my-new-project
```

### Via Git Clone + rsync (Offline or Custom):

```bash
git clone https://github.com/PT-Garda-Sistem-Digital/devrampart.git temp-devrampart
rsync -a --exclude='.git' temp-devrampart/ my-new-project/
rm -rf temp-devrampart
cd my-new-project
```

### Via GitHub ZIP Download (Without Git):

1. Open: https://github.com/PT-Garda-Sistem-Digital/devrampart
2. Click the green button **Code** → **Download ZIP**
3. Extract ZIP to a new folder (e.g., `my-new-project`)
4. Enter the folder:
   ```bash
   cd my-new-project
   ```

## Installation Methods Comparison

| Method           | Speed      | Ease of Use | Git History | Recommendation  |
| ---------------- | ---------- | ----------- | ----------- | --------------- |
| Template Browser | ⭐⭐⭐     | ⭐⭐⭐⭐⭐  | ✓           | For UI-friendly |
| GitHub CLI       | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐    | ✓           | For developers  |
| degit            | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐    | ✗           | **Recommended** |
| Git Clone        | ⭐⭐⭐     | ⭐⭐⭐⭐    | ✓           | Fallback        |
| ZIP Download     | ⭐⭐⭐⭐   | ⭐⭐        | ✗           | Offline mode    |

## Troubleshooting

**Error: `make: command not found`**

- Install Make: `brew install make` (macOS) or `sudo apt-get install make` (Linux)

**Error: `docker: command not found`**

- Install Docker Desktop: https://www.docker.com/products/docker-desktop

**Error when cloning GitHub**

- Make sure Git is installed: `git --version`
- Setup GitHub auth if needed: https://docs.github.com/en/authentication

Here is the standard operational workflow for your DevRampart Starter Kit:

### Stage 1: First Initialization (Must Be Done Once)

After you move all files to your local repository, run this step to activate all your local "security guards".

1. **Open Terminal in the _root_ directory (`<your-project-name>/`).**
2. **Run the initialization command:**

   ```bash
   make init
   ```

   _What's happening behind the scenes?_ This command will copy `.env.example` to `.env`, give execute permissions to scripts, and install Husky (Git Hooks).

3. **Create Secrets Baseline (OWASP Standard):**
   So that `detect-secrets` recognizes the initial state of your repository and doesn't block legitimate code, create a baseline file with this command:

   ```bash
   npx detect-secrets scan > .secrets.baseline
   ```

### Stage 2: Daily Work Cycle (Local Dev)

For developers, they don't need to worry about security complexities while coding.

- **If using DevPod / VS Code DevContainers (Recommended):**
  Simply open this project using DevPod. The system will automatically build the container, read `devcontainer.json`, and you'll be in a secure Node.js environment with active linters (Hadolint/Trivy) in the editor.
- **If using Regular Terminal:**
  Run the following command to start Nuxt.js with _Live-Reload_ enabled:

  ```bash
  make dev
  ```

  The application will run at `http://localhost:3000`. If you change `.vue` or `.ts` files, changes will be visible immediately without needing to _restart_.

### Stage 3: Security Validation (Automatic & Manual)

This system is designed to "argue" and block developers if they make mistakes that violate standards.

- **Automatic during `git commit`:**
  When you run `git commit -m "new feature"`, Husky will trigger `verify-secrets.sh` and `.pre-commit-config.yaml`. If you accidentally paste AWS _API Key_ or _Private Key_ into code, **the commit will be rejected immediately**. You must remove the key before you can commit.
- **Dockerfile Compliance Check:**
  To ensure no one breaks the Dockerfile security standards:
  ```bash
  make lint
  ```
- **CVE Vulnerability Scanning:**
  Before pushing to GitHub/GitLab, you can simulate what the CI/CD Pipeline will do:
  ```bash
  make scan
  ```

### Stage 4: Production Resilience Testing

It's important to test whether your application (Nuxt Nitro) can survive in a "crippled" production environment (Read-only filesystem, no root access, no kernel capabilities).

To simulate the Production environment on your laptop, run:

```bash
make prod
```

_Note:_ In this mode, _Live-Reload_ is disabled. The container will be fully locked down according to standards. If your application secretly tries to write to `/app/logs` or `/etc`, the application will _crash_ and you'll realize there's a security violation before that code reaches the actual production server.

**Cleaning the System:**
If you're done working and want to shut down all containers and clean up _cache_ so your laptop doesn't get heavy:

```bash
make clean
```
