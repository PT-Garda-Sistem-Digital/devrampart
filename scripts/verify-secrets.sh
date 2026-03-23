#!/bin/bash
if git diff --cached --name-only | xargs grep -iE "(PRIVATE KEY|AKIA[0-9A-Z]{16}|bearer\s+[a-zA-Z0-9_\-\.]{20,})"; then
  echo "[ERROR] Terdeteksi Hardcoded Secrets/Keys! Commit dibatalkan."
  exit 1
fi
exit 0