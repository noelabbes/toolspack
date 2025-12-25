# Docker Operations Playbook 🐳

Colección de comandos de alto uso para la gestión de contenedores en entornos Linux.

## 🚀 Ciclo de Vida (Lifecycle)

Comandos para iniciar, detener y reconstruir servicios.

```bash
# Iniciar servicios en segundo plano (Detached)
# Uso: Despliegue estándar.
docker compose up -d

# Reconstruir forzosamente e iniciar
# Uso: Cuando has cambiado el código fuente o el Dockerfile y necesitas reflejar los cambios.
docker compose up -d --build

# Reconstrucción limpia (Sin caché)
# Uso: Cuando las dependencias han cambiado y Docker se niega a actualizarlas por la caché de capas.
docker compose build --no-cache

# Apagar y limpiar
# Uso: Detiene los contenedores y borra las redes creadas.
docker compose down

# Apagar, limpiar y eliminar volúmenes
# ⚠️ PELIGRO: Esto borrará los datos persistentes (bases de datos, etc).
docker compose down -v

```

## 🔍 Depuración e Inspección (Debugging)

Herramientas para entender qué está pasando dentro de la "caja negra".

```bash
# Ver logs en tiempo real (limitado a últimas 100 líneas)
# Uso: Evita que la terminal se inunde con logs históricos irrelevantes.
docker compose logs -f --tail=100 [nombre_servicio]

# Entrar a la terminal del contenedor (Interactive Shell)
# Uso: Para revisar archivos internos, ejecutar scripts manuales o verificar conexiones de red.
# Nota: Usa 'sh' si 'bash' no está instalado en la imagen (común en Alpine Linux).
docker compose exec [nombre_servicio] sh

# Ver procesos activos dentro de los contenedores
# Uso: Verificar si el proceso principal o workers están corriendo.
docker compose top

```

## 🧹 Mantenimiento e Higiene (Housekeeping)

Docker devora disco duro. Estos comandos son vitales para mantener el servidor saludable.

```bash
# Limpieza de sistema (Prune Soft)
# Uso: Elimina contenedores detenidos, redes no usadas e imágenes colgantes (dangling/none).
docker system prune -f

# Limpieza profunda (Nuclear Option)
# ⚠️ PELIGRO: Elimina TODAS las imágenes no usadas por contenedores activos y caché de build.
# Uso: Recuperar espacio crítico en disco en servidores de desarrollo.
docker system prune -a -f

# Ver uso de recursos en tiempo real
# Uso: Identificar fugas de memoria o alto consumo de CPU (similar a htop).
docker stats

```

## 🛠️ Utilidades de "Solo una vez" (One-offs)

```bash
# Ejecutar un comando en un contenedor efímero
# Uso: Correr migraciones de DB o tests sin levantar toda la infraestructura.
docker compose run --rm [nombre_servicio] [comando]
# Ejemplo: docker compose run --rm backend python manage.py migrate

```

---


