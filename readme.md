# Hostea tu backend/API de javascript gratis para tu portafolio
Registrate en Cloudflare https://dash.cloudflare.com/sign-up
## Requerimientos
- Nodejs
- Wrangler (paquete de node)

Se instalan automaticamente con el `setup.sh` (linux) o `setup.ps1` (windows)
> Si no lo queres ejecutar automaticamente, anda al `requirements.md` de este repo y lo podes hacer manualmente
## Clonar el repositorio y ejecutar el setup
```bash
git clone https://github.com/Facuvatti/free-backend-host example
```
Cloning into 'example'...
remote: Enumerating objects: 47, done.
remote: Counting objects: 100% (47/47), done.
remote: Compressing objects: 100% (30/30), done.
remote: Total 47 (delta 14), reused 38 (delta 9), pack-reused 0 (from 0)
Receiving objects: 100% (47/47), 38.68 KiB | 943.00 KiB/s, done.
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
## Iniciar el proyecto en el navegador
```bash
$ npm run dev # Para desarrollo local
# Se despliega en el puerto 8787 http://localhost:8787/ 
```
```bash
$ npm run deploy # Para hostear en cloudflare
# Podrás acceder en un dominio como: https://[proyecto].[usuario].workers.dev/ 
```
## Desarrollar la API
Podes ver todas las herramientas que ofrece cloudflare en el https://dash.cloudflare.com/
# Recursos adicionales

- Entender mejor como funcionan los workers
https://developers.cloudflare.com/workers/
- Conectar bases de datos, otros workflows, variables de entorno, secretos, imagenes, etc
https://developers.cloudflare.com/workers/runtime-apis/bindings/
- Detalles de como configurar wrangler
https://developers.cloudflare.com/workers/wrangler/configuration/