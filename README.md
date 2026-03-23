# DevRampart

**Hardened Docker Starter Kit — Secure by Design**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![DevPod](https://img.shields.io/badge/DevPod-Ready-00C4B4)

DevRampart adalah starter kit Docker yang sudah di-hardened sesuai standar internasional\. Default Setup Nuxt.js
Satu kali clone → customize → langsung pakai di semua project kamu.  
Zero permission hell, DevPod ready, production-grade image, dan security scan otomatis.

---

# Quick Start


## 1. GitHub Template Repository (Recommended - Paling Bersih & Resmi)

Repository ini sudah diatur sebagai template repository, memungkinkan Anda membuat project baru tanpa git history.

### Menggunakan Browser:
1. Buka: https://github.com/PT-Garda-Sistem-Digital/devrampart
2. Klik tombol hijau **"Use this template"** → **"Create a new repository"**
3. Beri nama repository baru (contoh: `my-app`)
4. Klik **Create repository**

### Menggunakan GitHub CLI (One-Command):
```bash
gh repo create my-new-project \
  --template PT-Garda-Sistem-Digital/devrampart \
  --public \
  --clone

cd my-new-project
```

---

## 2. npx degit (Super Cepat - Tanpa Git History)

Metode tercepat untuk clone template tanpa git history lengkap.

### Dari GitHub Repository (Recommended - Selalu Versi Terbaru):
```bash
npx degit PT-Garda-Sistem-Digital/devrampart my-new-project
cd my-new-project
```

### Dari npm Registry (Saat Publish):
```bash
# Setelah package dipublikasi ke npm
npx devrampart@latest my-new-project
cd my-new-project
```

---

## 3. Git Clone (Fallback - Dengan Git History)

Metode tradisional yang mengklone seluruh git history.

```bash
git clone https://github.com/PT-Garda-Sistem-Digital/devrampart.git my-new-project
cd my-new-project
```

---

## 4. Metode Alternatif Tambahan

### Via curl + Install Script:
```bash
curl -fsSL https://raw.githubusercontent.com/PT-Garda-Sistem-Digital/devrampart/main/install.sh | bash -s -- my-new-project
cd my-new-project
```

### Via Git Clone + rsync (Offline atau Custom):
```bash
git clone https://github.com/PT-Garda-Sistem-Digital/devrampart.git temp-devrampart
rsync -a --exclude='.git' temp-devrampart/ my-new-project/
rm -rf temp-devrampart
cd my-new-project
```

### Via GitHub ZIP Download (Tanpa Git):
1. Buka: https://github.com/PT-Garda-Sistem-Digital/devrampart
2. Klik tombol hijau **Code** → **Download ZIP**
3. Ekstrak ZIP ke folder baru (misal `my-new-project`)
4. Masuk ke folder:
   ```bash
   cd my-new-project
   ```

---

## Perbandingan Metode Instalasi

| Metode | Kecepatan | Kemudahan | Git History | Rekomendasi |
|--------|-----------|-----------|-------------|------------|
| Template Browser | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ✓ | Untuk UI-friendly |
| GitHub CLI | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ✓ | Untuk developer |
| degit | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ✗ | **Recommended** |
| Git Clone | ⭐⭐⭐ | ⭐⭐⭐⭐ | ✓ | Fallback |
| ZIP Download | ⭐⭐⭐⭐ | ⭐⭐ | ✗ | Offline mode |

---

## Troubleshooting

**Error: `make: command not found`**
- Install Make: `brew install make` (macOS) atau `sudo apt-get install make` (Linux)

**Error: `docker: command not found`**
- Install Docker Desktop: https://www.docker.com/products/docker-desktop

**Error saat clone GitHub**
- Pastikan Git terinstall: `git --version`
- Setup GitHub auth jika diperlukan: https://docs.github.com/en/authentication

