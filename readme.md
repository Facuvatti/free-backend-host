# 🚀 Free JavaScript Backend Hosting (Hostea gratis tu backend en Cloudflare)
Deploy your Node.js or JavaScript backend for free using Cloudflare Workers. 

¿Querés mostrar tus proyectos en línea sin pagar hosting?
Con este repositorio vas a poder subir tu backend o API a internet en minutos, usando Cloudflare Workers (infraestructura rápida, global y gratuita).
## Requisitos
Antes de empezar, asegurate de tener instalado:
- Nodejs
- Wrangler (paquete de node)
✅ Si estás en Linux o Windows, el instalador automático setup.sh o setup.ps1 hace todo por vos.
💡 También podés hacerlo manualmente siguiendo el archivo requirements.md
.

## 1️⃣ Crear cuenta 
Registrate en Cloudflare https://dash.cloudflare.com/sign-up
## 2️⃣ Clonar repositorio y ejecutar setup
```bash
git clone https://github.com/Facuvatti/free-backend-host example
```
Cloning into 'example'...<br>
remote: Enumerating objects: 47, done.<br>
remote: Counting objects: 100% (47/47), done.<br>
remote: Compressing objects: 100% (30/30), done.<br>
remote: Total 47 (delta 14), reused 38 (delta 9), pack-reused 0 (from 0)<br>
Receiving objects: 100% (47/47), 38.68 KiB | 943.00 KiB/s, done.<br>
Resolving deltas: 100% (14/14), done.
```bash
cd example
```
> En vez de 'example' pone el nombre de tu proyecto
### Linux
```bash
chmod +x setup.sh
./setup.sh
```
### Windows
```powershell
.\setup.ps1
```
> Podes simplemente clickear el archivo y tambien va a funcionar
## 3️⃣ Desplegar 
```bash
$ npm run dev # Para desarrollo local
# Se despliega en el puerto 8787 http://localhost:8787/ 
```
```bash
$ npm run deploy # Para hostear en cloudflare
# Podrás acceder en un dominio como: https://[proyecto].[usuario].workers.dev/ 
```
## 🧑‍💻 Desarrollar tu API
Podes ver todas las herramientas que ofrece cloudflare en el https://dash.cloudflare.com/
# Recursos adicionales

- Entender mejor como funcionan los workers
https://developers.cloudflare.com/workers/
- Conectar bases de datos, otros workflows, variables de entorno, secretos, imagenes, etc
https://developers.cloudflare.com/workers/runtime-apis/bindings/
- Detalles de como configurar wrangler
https://developers.cloudflare.com/workers/wrangler/configuration/
# 🌟 Tip final

💡 Ideal para mostrar tus proyectos personales o practicar despliegues de APIs sin pagar servidores.
Es rápido, seguro y profesional — perfecto para tu portafolio.