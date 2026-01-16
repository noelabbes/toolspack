Configuraciones de PM2

### Opción Recomendada: Eliminar el proceso (Delete)

Como ya no usarás ese proyecto, esto detiene el proceso, libera el puerto y además quita la entrada de la lista de PM2 para siempre.

Usa el **ID** (que es `0` según tu tabla) o el **nombre**:

```bash
pm2 delete 0

```

*O usando el nombre:* `pm2 delete servidor-archivos`

---

### Opción Alternativa: Solo detener (Stop)

Si crees que podrías volver a necesitarlo en el futuro pero quieres liberar el puerto ahora:

```bash
pm2 stop 0

```


*Esto libera el puerto, pero el proceso seguirá apareciendo en tu lista con status `stopped`.*

---

### ⚠️ Paso Importante Final

Hagas un `stop` o un `delete`, recuerda guardar la configuración actual para que, si el servidor se reinicia, PM2 recuerde los cambios (y no vuelva a arrancar el proceso viejo):

```bash
pm2 save

```
### Para ver los logs del proceso del servidor:

```bash
pm2 logs [SERVER_NAME]

```

### Para listar los procesos:
```bash
pm2 list

```

### Para reiniciar el proceso:
```bash
pm2 restart [SERVER_NAME]
```

### Otros Escenarios:

Si la carpeta ya ha sido creada y necesitamos vincularlo con Git:

```bash

git remote set-url origin git@github.com:usuario/repositorio.git

```


