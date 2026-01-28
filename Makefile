# Makefile para Expo/React Native - Blue Project
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

# --- MANTENIMIENTO (Versión Windows) ---
# Usamos 'rm' porque Git Bash (que usas para Git) suele incluirlo.
# Si falla, cambia 'rm -rf' por 'rd /s /q' (CMD) o 'Remove-Item' (PS).
clean:
	@echo "🧹 Limpiando node_modules y chachés..."
	-rm -rf node_modules
	-rm -rf package-lock.json yarn.lock
	npm install
	@echo "✨ Entorno fresco y dependencias reinstaladas."

# --- GIT AUTOMATION (Corregido) ---
# La validación ahora ocurre EN LA LÍNEA DE COMANDO para no romper el 'make clean'
save:
	@if [ -z "$(m)" ]; then \
		echo "❌ Error: Debes poner un mensaje. Uso: gs 'mensaje'"; \
		exit 1; \
	fi
	@echo "📦 Empaquetando cambios en la rama: $(BRANCH)..."
	git add .
	git commit -m "$(m)"
	git push origin $(BRANCH)
	@echo "✅ ¡Listo! Código subido a $(BRANCH)."


