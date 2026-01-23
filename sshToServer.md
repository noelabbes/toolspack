Crear archivo de nombre config, C:\Users\TuUsuario\.ssh\
Sin extensión, y configurar el acceso con:

```bash
Host NombreDeTuServer
    HostName 192.145.22.11
    User root
    IdentityFile "C:\Ruta\A\Tu\Llave.pem"
    Port 22

```

Hecho esto podemos probar en la terminal del editor con: ssh NombreDeTuServer
