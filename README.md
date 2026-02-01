# MoviesApp (Futurama)

Aplicación Flutter desarrollada como prueba técnica, que muestra una lista de personajes de Futurama y detalles de la serie, consumiendo múltiples APIs y utilizando MobX como manejador de estado.

---

Funcionalidades

- Listado de personajes (Futurama API)
- Filtro por género
- Marcar / desmarcar personajes como favoritos
- Sección dedicada de favoritos
- Vista de detalle por personaje
- Información de la serie obtenida desde OMDb API
- Animación Hero entre lista y detalle
- Manejo de imágenes inválidas con fallback local
- Persistencia de datos para favoritos

---

Arquitectura y Tecnologías

- Flutter
- Dart
- MobX (Observers, Actions, Computed)
- Dio para consumo de APIs
- Clean Architecture (separación por capas)
- Componentes reutilizables

---

APIs utilizadas

- Futurama API  
  https://futuramaapi.com/api/characters

- OMDb API  
  https://www.omdbapi.com/

---

¿Cómo ejecutar el proyecto?

1. Clonar el repositorio:
 git clone https://github.com/Acehorn/moviesapp

2. Instalar dependencias
 flutter pub get

3. Generar codigo de MobX:
 flutter pub run build_runner build --delete-conflicting-outputs

4. Ejecutar app
 flutter run

---

Version de Flutter


[✓] Flutter (Channel stable, 3.29.2, on macOS 14.5 23F79 darwin-arm64, locale es-419)
[✓] Android toolchain - develop for Android devices (Android SDK version 36.1.0)

