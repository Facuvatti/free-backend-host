# Hostea tu backend/API de javascript gratis para tu portafolio
## Requerimientos
### Node.js
#### Con Linux o macOS
```bash
# Descargar e instala nvm (es para gestionar e instalar las versiones de Node):
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# en lugar de reiniciar la shell
\. "$HOME/.nvm/nvm.sh"
# Descargar e instalar Node.js:
nvm install 24 # O la version mas nueva cuando estes viendo esto
```
#### Con Windows
```Powershell
# En la mayoría de los sistemas Unix, incluyendo macOS, puedes instalar con un solo comando:
winget install Volta.Volta # Es parecido a nvm
# Descarga e instala Node.js:
volta install node@24
# Verificar la version y si se instalo correctamente:
node -v
```
### Wrangler (de cloudflare)
```bash
$ npx wrangler # 'npx' es un ejecutor de paquetes de Node
Need to install the following packages:
wrangler@4.45.2
Ok to proceed? (y) 
$ y # Respondes que si
```
> Aparece una lista de comandos, sugiero revisarlos

## Configuración del entorno

### Inicializar el proyecto
```bash
$ npx wrangler init [nombre]
Ok to proceed? (y)
$ y 
```
### Elegir plantilla
```bash
╰ What would you like to start with?
  ○ Hello World example
  ○ Framework Starter
  ○ Application Starter
  ● Template from a GitHub repo
  ◁ Go back
```
> Navegá con <kbd>←</kbd><kbd>↑</kbd><kbd>↓</kbd><kbd>→</kbd> la opción marcada con "●", y pulsá <kbd>Enter</kbd>
### Pegar URL del repositorio (plantilla)
`What's the url of git repo containing the template you'd like to use?`
```
https://github.com/Facuvatti/free-backend-host
```
> Pegalo con <kbd>Ctrl</kbd>+*<kbd>Shift</kbd>*+<kbd>v</kbd>
> <kbd>Enter</kbd>

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
# Recursos adicionales

- Entender mejor como funcionan los workers \rightarrow https://developers.cloudflare.com/workers/
- Conectar bases de datos, otros workflows, variables de entorno, secretos, imagenes, etc \rightarrow https://developers.cloudflare.com/workers/runtime-apis/bindings/
- Detalles de como configurar wrangler \rightarrow https://developers.cloudflare.com/workers/wrangler/configuration/