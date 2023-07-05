import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/router/app_router.dart';
import 'package:prueba_tecnica/models/personaje.dart';
import 'package:prueba_tecnica/pages/loading_page.dart';
import 'package:prueba_tecnica/widgets/cached_net_image.dart';

class PersonajesList extends StatelessWidget {
  const PersonajesList({
    super.key,
    required this.scrollController,
    required this.personajes,
    required this.context,
    required this.reachedLastPage,
    required this.count,
  });

  final ScrollController scrollController;
  final List<Personaje> personajes;
  final BuildContext context;
  final bool reachedLastPage;
  final int count;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView.builder(
      controller: scrollController,
      itemCount: personajes.length + 1,
      itemBuilder: (context, index) {
        if (index < personajes.length) {
          return GestureDetector(
            onTap: () {
              final selectedPersonaje = personajes[index];
              Navigator.pushNamed(context, AppRouter.detailPage,
                  arguments: selectedPersonaje);
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: SizedBox(
                    height: screenSize.height * 0.32,
                    child: CachedNetworkImageWidget(
                        imageUrl: personajes[index].image!),
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
                  personajes[index].species!,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  personajes[index].status!,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          );
        } else if (index == personajes.length && !reachedLastPage) {
          return const LoadingPage();
        } else {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'No more characters available',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    ));
  }
}
