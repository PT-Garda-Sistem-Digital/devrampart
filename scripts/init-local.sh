#!/bin/bash
set -e
echo "[INFO] Inisialisasi Environment..."
if [ ! -f .env ]; then
  cp .env.example .env
  echo "[OK] .env file created dari template."
fi
npx husky install
echo "[OK] Local initialization complete."