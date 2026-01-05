Para insertar en .vscode y evitar los errores de Gradle y directorios no encontrados.

```json
{
  "java.import.exclusions": [
    "**/node_modules/**",
    "**/.expo/**",
    "**/android/**",
    "**/ios/**",
    "**/dist/**",
    "**/web-build/**"
  ],
  "files.watcherExclude": {
    "**/node_modules/**": true,
    "**/.git/objects/**": true,
    "**/.expo/**": true
  },
  "search.exclude": {
    "**/node_modules": true,
    "**/android": true,
    "**/ios": true
  }

```
}
'''
