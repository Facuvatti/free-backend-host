# Instalar requerimientos manualmente
> Esta guia es en caso de que no haya funcionado el setup, no lo entiendas o no confies... 
## Node.js
### Con Linux o macOS
```bash
# Descargar e instala nvm (es para gestionar e instalar las versiones de Node):
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# en lugar de reiniciar la shell
\. "$HOME/.nvm/nvm.sh"
# Descargar e instalar Node.js:
nvm install 24 # O la version mas nueva cuando estes viendo esto
```
### Con Windows
```Powershell
# En la mayoría de los sistemas Unix, incluyendo macOS, puedes instalar con un solo comando:
winget install Volta.Volta # Es parecido a nvm
# Descarga e instala Node.js:
volta install node@24
# Verificar la version y si se instalo correctamente:
node -v
```
## Wrangler (de cloudflare)
```bash
$ npx wrangler # 'npx' es un ejecutor de paquetes de Node
Need to install the following packages:
wrangler@4.45.2
Ok to proceed? (y) 
$ y # Respondes que si
```
> Aparece una lista de comandos, sugiero revisarlos
## (Opcional) Librerias de la plantilla
```bash
$ npm install express cors morgan
```
> Si no los vas a usar no hacen falta.
## Reemplazar nombre de tu proyecto
En los archivos "wrangler.jsonc", "package-lock.json", "package.json"
Cambiar `YOUR-PROJECT-NAME` por el nombre de tu repo.
## Crear base de datos D1 en cloudflare
```bash
$ npx wrangler d1 create database --binding DB
```
## Agregar la base de datos al wrangler.jsonc
```json
"d1_databases": [
    {
        "binding": "DB",
        "database_name": "database",
    }
]
```
## Iniciar el proyecto 
### Desarrollo local
```bash
$ npm run dev
# Se despliega en el puerto 8787 http://localhost:8787/ 
```
### Hostear con Cloudflare
```bash
$ npm run deploy
# Podrás acceder en un dominio como: https://[proyecto].[usuario].workers.dev/ 
```