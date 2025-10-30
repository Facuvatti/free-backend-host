#!/bin/bash

# =========================================================
# Script de Instalacion y Configuracion Inicial (Linux/macOS)
# =========================================================

echo "✨ Iniciando configuracion del entorno para Cloudflare Worker..."

# --- Requerimiento 1: NVM (gestor de versiones de Node.js) ---
echo "⚙️ Verificando la instalacion de nvm..."

# Funcion para cargar nvm
load_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Carga nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Carga nvm bash_completion
}

# 1. Comprobar si nvm ya esta instalado
if command -v nvm &> /dev/null; then
    echo "✅ nvm ya esta instalado."
    load_nvm
else
    # 2. Si no esta, lo instala
    echo "nvm no encontrado. Instalando..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    # Cargar nvm despues de la instalacion
    load_nvm
fi

# --- Requerimiento 2: Node.js (Via NVM) ---
echo "⚙️ Verificando e instalando Node.js v24..."

# 3. Comprobar si Node.js v24 ya esta instalado
if nvm list | grep -q "v24"; then
    echo "✅ Node.js v24 ya esta instalado."
else
    echo "Node.js v24 no encontrado. Instalando..."
    nvm install 24
fi

if command -v node &> /dev/null && [[ $(node -v) == v24* ]]; then
    echo "✅ Node.js v24 esta listo para usar."
else
    echo "❌ Error: Node.js v24 no esta activo. Verifica la configuracion de nvm."
    exit 1
fi

# --- Requerimiento 3: Instalar Wrangler--
echo "⚙️ Instalando Wrabgler"
npx install wrangler

# Inicializacion del Proyecto (Wrangler Init) ---
echo "🚀 Inicializando la configuracion de Wrangler con la plantilla..."

REPO_NAME=$(basename "$(pwd)")
PLACEHOLDER="YOUR-PROJECT-NAME"

# Sustituir en wrangler.jsonc
sed -i "s/$PLACEHOLDER/${{ REPO_NAME }}/g" wrangler.jsonc

# Sustituir en package.json
sed -i "s/$PLACEHOLDER/${{ REPO_NAME }}/g" package.json
# Sustituir en package-lock.json
sed -i "s/$PLACEHOLDER/${{ REPO_NAME }}/g" package-lock.json          

echo "Creando base de datos en D1"
npx wrangler d1 create database --binding DB
# --- Pasos Finales ---
echo ""
echo "🎉 ¡Configuracion exitosa!"
echo "Para iniciar el proyecto:"
echo "Desarrollo local: npm run dev"
echo "Hostear en Cloudflare: npm run deploy"
echo ""
rm requirements.md
rm setup.ps1
rm readme.md