Aquí tienes la documentación definitiva para tu **Toolspack**. Está estructurada para que, si formateas tu PC o cambias de máquina, puedas replicar tu entorno de **Alta Productividad** en menos de 5 minutos.

Copia y pega esto tal cual en tu base de conocimientos (Notion, Obsidian, etc.).

---

# 🚀 Automation Suite: Makefile & PowerShell (Windows)

Guía para orquestar comandos de Expo y automatizar Git (`add` + `commit` + `push`) con un solo alias en Windows/PowerShell.

## 1. Prerrequisitos (Solo una vez por PC)

Windows no trae `make` por defecto. Instálalo via Winget (PowerShell como Admin recomendado).

```powershell
# Instalar Make
winget install ezwinports.make

# Permitir ejecución de scripts (si es un PC nuevo)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

```

> **Nota:** Reinicia la terminal (o el editor) después de instalar para que reconozca el comando.

---

## 2. El Orquestador (`Makefile`)

Crea un archivo llamado `Makefile` (sin extensión) en la raíz de tu proyecto.
**Importante:** Las indentaciones deben ser **TABULACIONES**, no espacios.

```makefile
# Makefile para Expo/React Native
# "Systems & High Performance" Edition

.PHONY: help dev android ios clean preview production save

# Detectamos automáticamente la rama de Git
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

# --- MENÚ DE AYUDA ---
help:
	@echo "🛠️  COMANDOS DISPONIBLES:"
	@echo "   make dev         -> Inicia servidor con caché limpia"
	@echo "   make android     -> Corre la app en Android"
	@echo "   make ios         -> Corre la app en iOS"
	@echo "   make doctor      -> Diagnóstico de Expo"
	@echo "   make preview     -> Build en la nube (Preview)"
	@echo "   make prod        -> Build en la nube + Submit (Production)"
	@echo "   make clean       -> Limpieza profunda (Windows Friendly)"
	@echo "   make save m=...  -> Git add + commit + push"

# --- DESARROLLO ---
dev:
	npx expo start -c

android:
	npx expo run:android

ios:
	npx expo run:ios

doctor:
	npx expo doctor

# --- EAS / NUBE ---
preview:
	eas build -p android --profile preview

prod:
	eas build -p android --profile production --auto-submit

# --- MANTENIMIENTO ---
clean:
	@echo "🧹 Limpiando dependencias..."
	-rm -rf node_modules
	-rm -rf package-lock.json yarn.lock
	npm install
	@echo "✨ Entorno fresco."

# --- GIT AUTOMATION (Versión Windows CMD) ---
save:
	@if "$(m)"=="" ( \
		echo ❌ Error: Debes poner un mensaje. Uso: gs "mensaje" & \
		exit 1 \
	)
	@echo 📦 Empaquetando cambios en la rama: $(BRANCH)...
	git add .
	git commit -m "$(m)"
	git push origin $(BRANCH)
	@echo ✅ Listo. Codigo subido a $(BRANCH).

```

---

## 3. El Alias Global (`$PROFILE`)

Configuración para invocar la automatización desde cualquier lugar usando `gs`.

**Pasos:**

1. Abrir/Crear perfil: `if (!(Test-Path $PROFILE)) {New-Item -Type File -Path $PROFILE -Force}; notepad $PROFILE`
2. Pegar el siguiente código dentro:

```powershell
# --- ALIAS SUPER SENIOR ---
# gs = Git Save (Llama al Makefile del directorio actual)
function gs($m) {
    make save m="$m"
}

```

3. Guardar y recargar terminal: `. $PROFILE`

---

## 4. Cheat Sheet de Uso

| Acción | Comando Tradicional (Lento) | **Comando Senior (Rápido)** |
| --- | --- | --- |
| **Subir Cambios** | `git add .` + `git commit...` + `git push...` | **`gs "mensaje del cambio"`** |
| **Limpiar Proyecto** | Borrar `node_modules` manualmente + `npm i` | **`make clean`** |
| **Iniciar Dev** | `npx expo start -c` | **`make dev`** |
| **Generar APK** | `eas build -p android --profile preview` | **`make preview`** |
| **Publicar App** | `eas build ... --auto-submit` | **`make prod`** |

---

### ¿Qué sigue?

Si alguna vez formateas tu PC, con solo ejecutar el paso 1 y 3 (el alias), cualquier proyecto que tenga el archivo `Makefile` dentro funcionará automáticamente. Es un sistema portable.

¿Te gustaría que generemos un archivo `README_DEV.md` para el repositorio de **Blue**, para que si otro dev entra al equipo sepa cómo usar estos comandos?
