import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/personaje.dart';
import 'package:prueba_tecnica/pages/loading_page.dart';

class PersonajesList extends StatelessWidget {
  const PersonajesList({
    super.key,
    required this.scrollController,
    required this.personajes,
    required this.context,
  });

  final ScrollController scrollController;
  final List<Personaje> personajes;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView.builder(
            controller: scrollController,
            itemCount: personajes.length + 1,
            itemBuilder: (context, index) {
              if (index < personajes.length) {
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: FadeInImage(
                        image: NetworkImage(personajes[index].image!),
                        placeholder: const AssetImage('assets/no-image.png'),
                        fit: BoxFit.cover,
                        height: screenSize.height * 0.32,
                      ),
                    ),
                    Text(
                      personajes[index].name!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      personajes[index].type!,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                );
              } else {
                return const LoadingPage();
              }
            }));
  }
}
