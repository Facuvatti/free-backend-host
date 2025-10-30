# =========================================================
# Script de Instalacion y Configuracion Inicial (Windows PowerShell)
# =========================================================

Write-Host "✨ Iniciando configuracion del entorno para Cloudflare Worker..."

# 1. Comprobar si winget esta disponible
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "⚠️ 'winget' no esta disponible. Asegurate de tener la ultima version de Windows 10/11 o instalalo."
    exit 1
}

if ((node -v) -match "v24") {
    Write-Host "✅ Node.js v24 ya estaba instalado y establecido como predeterminado."
} else {
    # 2. Instalar Volta (Alternativa a nvm en Windows)
    Write-Host "⚙️ Verificando e instalando Volta (gestor de versiones de Node.js)..."

    if (Get-Command volta -ErrorAction SilentlyContinue) {
        Write-Host "✅ Volta ya esta instalado."
    } else {
        Write-Host "Volta no encontrado. Instalando via winget..."
        try {
            winget install Volta.Volta -h
            Write-Host "✅ Volta instalado exitosamente. Reinicia la terminal si tienes problemas."
        } catch {
            Write-Host "❌ Error al instalar Volta con winget."
            exit 1
        }
    }
    # 3. Instalar la version 24 de Node.js
    Write-Host "Instalando Node.js v24..."
    volta install node@24
    volta default node@24
    # 4. Verificar
    if ((node -v) -match "v24") {
        Write-Host "✅ Node.js v24 instalado y establecido como predeterminado."
    } else {
        Write-Host "❌ Error al instalar Node.js con Volta. Verifica la instalacion manual de Volta."
        exit 1
    }
}
# --- Requerimiento 2: Instalar Wrangler y Dependencias ---
Write-Host "⚙️ Instalando dependencias del proyecto y Wrangler (Cloudflare)..."
npx install wrangler

# --- Requerimiento 3: Inicializacion del Proyecto (Wrangler Init) ---
Write-Host "🚀 Inicializando la configuracion de Wrangler con la plantilla..."

# Definir el nombre del repositorio actual (directorio)
$RepoName = (Split-Path (Get-Location) -Leaf)

# Sustituir en wrangler.jsonc (Nombre del Proyecto/Repo)
(Get-Content -Path .\wrangler.jsonc) -replace $PLACEHOLDER, $RepoName | Set-Content -Path .\wrangler.jsonc

# Sustituir en package.json
(Get-Content -Path .\package.json) -replace $PLACEHOLDER, $RepoName | Set-Content -Path .\package.json

# Sustituir en package-lock.json
(Get-Content -Path .\package-lock.json) -replace $PLACEHOLDER, $RepoName | Set-Content -Path .\package-lock.json

# Creando la base de datos en D1

npx wrangler d1 create database --binding DB
Write-Host ""
Write-Host "🎉 ¡Configuracion exitosa!"
Write-Host "Para iniciar el proyecto:"
Write-Host "Desarrollo local: npm run dev"
Write-Host "Hostear en Cloudflare: npm run deploy"
Write-Host ""
Remove-Item -Path requirements.md
Remove-Item -Path setup.sh
Remove-Item -Path readme.md
Remove-Item -Path setup.ps1