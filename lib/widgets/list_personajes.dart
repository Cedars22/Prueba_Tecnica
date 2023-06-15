import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/personaje.dart';

// ignore: must_be_immutable
class PersonajesList extends StatelessWidget {
  List<Personaje>? personajes;

  PersonajesList({Key? key, required this.personajes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: personajes?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: FadeInImage(
                  image: NetworkImage(personajes![index].image!),
                  placeholder: const AssetImage('assets/no-image.png'),
                  fit: BoxFit.cover,
                  height: screenSize.height * 0.32,
                ),
              ),
              Text(
                personajes![index].name!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                personajes![index].type!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          );
        });
  }
}
