import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/personaje.dart';

class PersonajeDetalle extends StatelessWidget {
  const PersonajeDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    final Personaje personaje =
        ModalRoute.of(context)!.settings.arguments as Personaje;
    return Scaffold(
      appBar: AppBar(
        title: Text('Character: ${personaje.name!}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              personaje.name!,
              style: Theme.of(context).textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.3,
            ),
            _imagenPersonaje(context, personaje),
            _descripcion(context, personaje),
          ],
        ),
      ),
    );
  }

  Widget _imagenPersonaje(BuildContext context, Personaje personaje) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          image: NetworkImage(personaje.image!),
          height: 200,
        ),
      ),
    );
  }

  Widget _descripcion(BuildContext context, Personaje personaje) {
    return Column(
      children: [
        Text(
          'Species: ${personaje.species!}',
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Status: ${personaje.status!}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        if (personaje.type == '')
          Text(
            'Type: unknown',
            style: Theme.of(context).textTheme.titleLarge,
          )
        else
          Text(
            'Type: ${personaje.type!}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        Text(
          'Gender: ${personaje.gender!}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Created: ${personaje.created!}',
          style: Theme.of(context).textTheme.titleLarge,
        )
      ],
    );
  }
}
