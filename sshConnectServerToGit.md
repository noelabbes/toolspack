### Método: Usar SSH

Lo más profesional y cómodo a largo plazo es configurar una llave SSH. Así el servidor y GitHub se "dan la mano" sin pedirte contraseña nunca más.

**1. Generar llave en el servidor:**
Ejecuta esto en tu consola `ubuntu@[SERVER_NAME]`:

```bash
ssh-keygen -t ed25519 -C "tu_email@ejemplo.com"

```

*(Presiona Enter a todo para dejarlo por defecto).*

**2. Ver la llave pública:**

```bash
cat ~/.ssh/id_ed25519.pub

```

Copia todo el texto que te salga (empieza por `ssh-ed25519...`).

**3. Ponerla en GitHub:**

1. Ve a **Settings** en GitHub > **SSH and GPG keys**.
2. Clic en **New SSH key**.
3. Pega tu llave y guárdala.

**4. Clonar usando SSH:**
Ahora debes usar la dirección SSH, no la HTTPS:

```bash
git clone git@github.com:noelabbes/[REPOSITORY_NAME].git

```

### Otros Escenarios:

Si la carpeta ya ha sido creada y necesitamos vincularlo con Git:

```bash
git remote set-url origin git@github.com:usuario/repositorio.git

```
