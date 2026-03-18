#!/bin/bash
cd "$(dirname "$0")"

echo "=== Subir Favorcitos a GitHub ==="
echo ""
echo "1. Crea un repo vacío en github.com/new (sin README)"
echo "2. Copia la URL del repo"
echo ""
echo "Pega la URL (ej: https://github.com/tu-usuario/favorcitos):"
read REPO_URL

if [ -z "$REPO_URL" ]; then
  echo "Error: Necesitas la URL del repo."
  read -p "Presiona Enter para cerrar..."
  exit 1
fi

git init 2>/dev/null
git add .
git commit -m "Initial commit - Favorcitos" 2>/dev/null
git remote remove origin 2>/dev/null
git remote add origin "$REPO_URL"
git branch -M main

echo ""
echo "Subiendo..."
git push -u origin main

if [ $? -eq 0 ]; then
  echo ""
  echo "✓ Listo. Conecta el repo en vercel.com y añade:"
  echo "  - DATABASE_URL"
  echo "  - NEXTAUTH_SECRET"
  echo "  - NEXTAUTH_URL"
else
  echo ""
  echo "Si falla: crea el repo en github.com primero (vacío)."
fi

echo ""
read -p "Presiona Enter para cerrar..."
