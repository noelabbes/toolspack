
---

# Guía de Comandos Expo & EAS

## 1. Desarrollo Local (`npx expo`)

Comandos para correr, probar y gestionar dependencias en tu máquina.

| Comando | Descripción | Flags Útiles |
| --- | --- | --- |
| `npx expo start` | Inicia el servidor de desarrollo (Metro Bundler). | `-c` (limpia caché), `--tunnel` (útil si estás en redes restringidas). |
| `npx expo run:android` | Compila y corre la app nativa localmente (requiere carpeta `/android` o Prebuild). | `--device` (elige dispositivo físico/emulador). |
| `npx expo run:ios` | Compila y corre la app nativa en iOS (requiere Mac + Xcode). | `--device`. |
| `npx expo prebuild` | Genera las carpetas nativas `/android` y `/ios` basadas en tu configuración. | `--clean` (borra directorios nativos previos y regenera). |
| `npx expo install [paquete]` | Instala librerías asegurando compatibilidad con tu versión de SDK. | `--fix` (arregla inconsistencias de versiones). |
| `npx expo doctor` | Diagnostica problemas en tu entorno o dependencias. | N/A |

---

## 2. Construcción (EAS Build)

Comandos para compilar tu binario (`.apk`, `.aab`, `.ipa`). Todo esto se configura en `eas.json`.

> **Tu comando actual:** `eas build -p android --profile preview`

### Variaciones Esenciales

* **`eas build --platform ios`**: Específico para Apple.
* **`eas build --platform all`**: Genera Android e iOS simultáneamente.
* **`eas build --local`**: Compila en tu propia máquina en lugar de la nube (ahorra cuota de EAS, pero requiere entorno nativo configurado).
* **`eas build:configure`**: Configura un proyecto nuevo para usar EAS Build.

### Flags de Poder

* `--profile [nombre]`: Usa un perfil de `eas.json` (ej. `production`, `development`, `preview`).
* `--auto-submit`: Envía la app a la tienda automáticamente al terminar la build (requiere configuración previa).
* `--clear-cache`: Limpia la caché del builder en la nube (útil si una build falla por dependencias corruptas).

---

## 3. Despliegue a Tiendas (EAS Submit)

Para cuando ya tienes el binario y quieres mandarlo a Google Play o App Store Connect.

| Comando | Descripción |
| --- | --- |
| `eas submit -p android` | Sube el último binario exitoso a Google Play Console. |
| `eas submit -p ios` | Sube el último binario exitoso a App Store Connect. |
| `eas submit --url [link]` | Sube un binario específico desde una URL o ruta local. |

---

## 4. Actualizaciones Over-The-Air (EAS Update)

Actualiza el código JS/assets de tu app en producción sin pasar por la revisión de las tiendas.

| Comando | Descripción |
| --- | --- |
| `eas update` | Publica una actualización OTA. Requiere mensaje (`--message "..."`). |
| `eas update --branch [nombre]` | Apunta a una rama específica (ej. `preview`, `production`). |
| `eas channel:create [nombre]` | Crea canales de distribución (ej. para testers internos). |
| `eas update:list` | Muestra el historial de actualizaciones enviadas. |

---

## 5. Gestión de Credenciales y Dispositivos

Crucial para firmar apps y provisionar dispositivos iOS (Ad Hoc).

* **`eas credentials`**: Inicia el gestor interactivo para Keystores (Android) y Certificados/Provisioning Profiles (iOS).
* **`eas device:create`**: Registra un iPhone/iPad en tu cuenta de Apple Developer para pruebas ad-hoc.
* **`eas device:list`**: Muestra dispositivos registrados.
* **`eas whoami`**: Verifica con qué usuario estás logueado.
* **`eas login` / `eas logout**`: Gestión de sesión.

---

## 6. Configuración de Entorno (Secrets)

Para manejar variables de entorno (.env) en la nube de EAS.

* `eas secret:create`: Sube una variable de entorno (ej. API Keys) a los servidores de EAS para que esté disponible durante la build.
* `eas secret:list`: Lista las variables configuradas.
* `eas secret:delete`: Elimina una variable.

---

### Tip Pro para tu Toolspack

Si quieres evitar escribir el comando largo siempre, puedes agregar "scripts" en tu `package.json`:

```json
"scripts": {
  "build:preview": "eas build -p android --profile preview",
  "build:prod": "eas build -p android --profile production --auto-submit",
  "build:local": "eas build -p android --profile preview --local"
}

```

Así solo ejecutas `npm run build:preview`.

¿Te gustaría que te ayude a configurar alguna sección específica de tu `eas.json` para aprovechar estos comandos?
