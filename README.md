Nuevas tareas:

- Pasar la app a ingles y español (usa intl)
- Implementa Isar para offline (este es el complicado)
- Puedes usar Hive si quieres.
- O sembast (este no me gusta a mi)
- Crea un custom widget que se llame customImageNetwork y encapsula el paquete de cahed_network_image
- Sustituir tu imagen con este custom widget.
- Utiliza fvm

en esta rama, primero instala fvm

`dart pub global activate fvm`


y luego vas un
`fvm install`

Y después todos los comandos de flutter van con fvm flutter
Ejemplo:
`flutter pub get` -> `fvm flutter pub get`
`flutter pub run build_runner build` -> `fvm flutter pub run build_runner build`


