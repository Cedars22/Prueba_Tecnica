import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/personaje.dart';
import 'package:prueba_tecnica/repository/repository.dart';
import 'package:prueba_tecnica/widgets/list_personajes.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  String nextPageUrl = 'https://rickandmortyapi.com/api/character/?page=1';
  List<Personaje> personajes = [];

  @override
  void initState() {
    super.initState();
    loadCharacters();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadCharacters();
    }
  }

  bool isLoading = false;
  Future<void> loadCharacters() async {
    if (isLoading) return; // Evitar cargar personajes duplicados
    setState(() {
      isLoading = true;
    });
    try {
      final List<Personaje> newPersonajes =
          await Repository().fetchCharacters(nextPageUrl, currentPage);
      setState(() {
        personajes.addAll(newPersonajes);
        currentPage++;
        nextPageUrl =
            'https://rickandmortyapi.com/api/character/?page=$currentPage';
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Rick and Morty',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Characters',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              height: screenSize.height * 0.75,
              child: PersonajesList(
                  scrollController: scrollController,
                  personajes: personajes,
                  context: context),
            ),
          ]),
        ),
      ),
    );
  }
}
