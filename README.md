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

---

Berikut adalah alur kerja operasional standar untuk *Starter Kit Devrampart* Anda:

### Tahap 1: Inisialisasi Pertama Kali (Wajib Dilakukan Sekali)

Setelah Anda memindahkan seluruh file ke repositori lokal Anda, jalankan langkah ini untuk mengaktifkan semua "satpam" lokal Anda.

1. **Buka Terminal di direktori *root* (`<nama-project-anda>/`).**
2. **Jalankan perintah inisialisasi:**
   ```bash
   make init
   ```
   *Apa yang terjadi di balik layar?* Perintah ini akan menyalin `.env.example` menjadi `.env`, memberikan hak eksekusi pada skrip, dan memasang Husky (Git Hooks).
3. **Buat *Baseline* Rahasia (Standar OWASP):**
   Agar `detect-secrets` mengenali status awal repositori Anda dan tidak memblokir kode yang sah, buat file *baseline* dengan perintah ini:
   ```bash
   npx detect-secrets scan > .secrets.baseline
   ```

### Tahap 2: Siklus Kerja Harian (Lokal Dev / Tier 1)

Bagi developer, mereka tidak perlu memikirkan kerumitan keamanan saat sedang *ngoding*.

* **Jika menggunakan DevPod / VS Code DevContainers (Direkomendasikan):**
  Cukup buka proyek ini menggunakan DevPod. Sistem akan otomatis membangun container, membaca `devcontainer.json`, dan Anda langsung berada di dalam lingkungan Node.js yang aman dengan linter (Hadolint/Trivy) aktif di editor.
* **Jika menggunakan Terminal Biasa:**
  Jalankan perintah berikut untuk menyalakan Nuxt.js dengan fitur *Live-Reload*:
  ```bash
  make dev
  ```
  Aplikasi akan berjalan di `http://localhost:3000`. Jika Anda mengubah file `.vue` atau `.ts`, perubahannya akan langsung terlihat tanpa perlu *restart*.

### Tahap 3: Validasi Keamanan (Otomatis & Manual)

Sistem ini dirancang untuk "membantah" dan memblokir developer jika mereka melakukan kesalahan yang melanggar standar.

* **Otomatis saat `git commit`:**
  Ketika Anda menjalankan `git commit -m "fitur baru"`, Husky akan memicu `verify-secrets.sh` dan `.pre-commit-config.yaml`. Jika Anda tidak sengaja menempelkan *API Key* AWS atau *Private Key* ke dalam kode, **commit akan digagalkan seketika**. Anda harus menghapus kunci tersebut sebelum bisa melakukan *commit*.
* **Pengecekan Kepatuhan Dockerfile:**
  Untuk memastikan tidak ada yang merusak standar keamanan `Dockerfile`:
  ```bash
  make lint
  ```
* **Pemindaian Kerentanan CVE:**
  Sebelum melakukan *Push* ke GitHub/GitLab, Anda bisa menyimulasikan apa yang akan dilakukan oleh CI/CD Pipeline:
  ```bash
  make scan
  ```

### Tahap 4: Pengujian Ketahanan Produksi (Tier 3)

Penting untuk menguji apakah aplikasi Anda (Nuxt Nitro) bisa bertahan hidup di lingkungan produksi yang "lumpuh" (Read-only filesystem, tanpa akses root, tanpa kapabilitas kernel).

Untuk menyimulasikan lingkungan *Production* di laptop Anda, jalankan:
```bash
make prod
```
*Catatan:* Di mode ini, *Live-Reload* mati. Container akan dikunci total sesuai standar. Jika aplikasi Anda diam-diam mencoba menulis file ke `/app/logs` atau `/etc`, aplikasi akan *crash* dan Anda akan menyadari adanya pelanggaran keamanan sebelum kode tersebut mencapai *server* produksi asli.

---

**Membersihkan Sistem:**
Jika Anda sudah selesai bekerja dan ingin mematikan semua container serta membersihkan *cache* agar laptop tidak berat:
```bash
make clean
```
