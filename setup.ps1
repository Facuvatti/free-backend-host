# =========================================================
# Script de Instalacion y Configuracion Inicial (Windows PowerShell)
# =========================================================

Write-Host "✨ Iniciando configuracion del entorno para Cloudflare Worker..."

# 1. Comprobar si winget esta disponible
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "⚠️ 'winget' no esta disponible. Asegurate de tener la ultima version de Windows 10/11 o instalalo."
    exit 1
}

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
if ((node -v) -match "v24") {
    Write-Host "✅ Node.js v24 ya estaba instalado y establecido como predeterminado."
} else {
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

# Ejecutar el comando de inicializacion de Wrangler. Este paso requerira que el usuario interactue para pegar la URL
Write-Host ""
Write-Host "========================================================================="
Write-Host "Configuracion Interactiva de Wrangler"
Write-Host "1. Selecciona 'Template from a GitHub repo' usando las flechas y pulsa Enter."
Write-Host "3. Pega la URL de la plantilla: https://github.com/Facuvatti/free-backend-host"
Write-Host "========================================================================="
Write-Host ""

npx wrangler init "$RepoName" -y 

Write-Host ""
Write-Host "🎉 ¡Configuracion exitosa!"
Write-Host "Para iniciar el proyecto:"
Write-Host "Desarrollo local: npm run dev"
Write-Host "Hostear en Cloudflare: npm run deploy"
Write-Host ""