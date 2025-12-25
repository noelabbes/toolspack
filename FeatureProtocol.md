
Aquí se encuentra el procedimiento estándar para añadir una nueva **Feature** (Funcionalidad) en tu arquitectura, paso a paso, tal como lo haría un Lead Developer.

---

### 📂 1. El Concepto: "Feature Slicing"

La funcionalidad se llamará **`routing`** (o `navigation`, pero `routing` es más específico de backend para "calcular rutas").

El procedimiento siempre sigue este orden: **Dominio (Qué) -> Infraestructura (Cómo) -> Presentación (Interacción).**

---

### 🏗️ 2. Estructura para el Backend (Java)

Vas a crear un nuevo paquete hermano de `safety` y `events`.

**Ruta:** `src/main/java/com/biorlabs/blue/features/routing`

Crea estas carpetas y archivos vacíos (placeholders) para visualizar el flujo:

```text
features/
├── routing/
│   ├── domain/                  # <--- PASO 1: EL NÚCLEO
│   │   ├── model/
│   │   │   ├── RouteRequest.java   (Origen, Destino, Preferencias)
│   │   │   └── SafeRoute.java      (La ruta final con score de seguridad)
│   │   └── RoutingService.java     (Interfaz: "Contrato")
│   │
│   ├── infrastructure/          # <--- PASO 2: EL EXTERNO (Mapbox)
│   │   ├── mapbox/
│   │   │   ├── MapboxClient.java       (Cliente HTTP para llamar a la API)
│   │   │   └── MapboxRouteAdapter.java (Implementa RoutingService usando Mapbox)
│   │   └── dto/
│   │       └── MapboxResponse.java     (Para mapear el JSON que te da Mapbox)
│   │
│   └── web/                     # <--- PASO 3: LA API
│       ├── RoutingController.java      (Endpoint: POST /api/v1/routing/safe)
│       └── dto/
│           └── RouteResponse.java      (Lo que le mandas al celular)

```

**🤔 ¿Por qué así?**

* Tu **Dominio** (`SafeRoute`) no debe saber que existe Mapbox. Si mañana Mapbox cobra muy caro y cambias a Google Routes, solo tocas la carpeta `infrastructure`. Tu lógica de negocio queda intacta.

---

### 📱 3. Estructura para el Frontend (@safe_app_v5 - Expo)

Igual que con el mapa, agrupamos todo lo relacionado a pedir rutas en un solo lugar.

**Ruta:** `src/features/routing`

```text
src/
├── features/
│   ├── routing/
│   │   ├── interfaces/        # Tipos TypeScript (Request/Response)
│   │   │   └── index.ts
│   │   │
│   │   ├── services/          # Llamada a TU backend (no directo a Mapbox)
│   │   │   └── routingApi.ts  (fetch a /api/v1/routing/safe)
│   │   │
│   │   ├── components/        # UI Específica
│   │   │   ├── RouteInput.tsx (Inputs de "Desde" y "Hasta")
│   │   │   └── RouteInfoCard.tsx (Muestra: "Ruta 80% Segura - 15 min")
│   │   │
│   │   └── screens/
│   │       └── NavigationScreen.tsx

```

---
