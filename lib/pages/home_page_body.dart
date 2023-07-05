import 'package:flutter/material.dart';
import 'package:prueba_tecnica/database/isar_service.dart';
import 'package:prueba_tecnica/models/personaje.dart';
import 'package:prueba_tecnica/models/result.dart';
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
  bool reachedLastPage = false;
  int count = 0;
  int characterCount = 0;
  bool isFirstLoad = true;

  String filtroStatus = '';
  String filtroSpecies = '';
  String filtroName = '';

  late IsarService isarService;

  @override
  void initState() {
    super.initState();
    isarService = IsarService();
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
      if (!reachedLastPage) {
        loadCharacters();
      }
    }
  }

  Future<void> loadCharacters() async {
    try {
      final Result? result =
          await Repository().fetchCharacters(nextPageUrl, currentPage);
      final List<Personaje> newPersonajes = result!.personajes ?? [];
      count = result.info!.count!;
      isarService.createPersonaje(newPersonajes);
      if (isFirstLoad) {
        characterCount = await isarService.getCharacterCount();
        currentPage = (characterCount / 20).round();
        if (currentPage == 0) {
          currentPage = 1;
        }
        isFirstLoad = false;
      }
      setState(() {
        personajes.addAll(newPersonajes);
        currentPage++;
        nextPageUrl = '/api/character/?page=$currentPage';
        reachedLastPage = characterCount >= count;
      });
      // isFirstLoad = false;
    } catch (e) {
      // const Text('conection error or endpoint mal');
      print('Error: $e');
    }
  }

  void applyFilterStatus(String status, String name, String species) {
    setState(() {
      filtroName = name;
      filtroSpecies = species;
      filtroStatus = status;
      personajes.clear();
      // reachedLastPage = true;
    });
    cargarFiltro();
  }

  Future<void> cargarFiltro() async {
    List<Personaje> personajesFiltro = await isarService.getFilterCharactersDB(
        filtroStatus, filtroName, filtroSpecies);
    setState(() {
      personajes.addAll(personajesFiltro);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Center(
                  child: Text(
                'Names',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              )),
            ),
            onSelected: (value) {
              applyFilterStatus('', value, '');
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Rick',
                child: Text('Rick'),
              ),
              const PopupMenuItem<String>(
                value: 'Morty',
                child: Text('Morty'),
              ),
              const PopupMenuItem<String>(
                value: 'Summer',
                child: Text('Summer'),
              ),
              const PopupMenuItem<String>(
                value: 'Beth',
                child: Text('Beth'),
              ),
              const PopupMenuItem<String>(
                value: 'Jerry',
                child: Text('Jerry'),
              ),
              const PopupMenuItem<String>(
                value: '',
                child: Text('Quitar filttro'),
              ),
            ],
          ),
          PopupMenuButton<String>(
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Center(
                  child: Text(
                'Species',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              )),
            ),
            onSelected: (value) {
              applyFilterStatus('', '', value);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Human',
                child: Text('Humans'),
              ),
              const PopupMenuItem<String>(
                value: 'Alien',
                child: Text('Aliens'),
              ),
              const PopupMenuItem<String>(
                value: 'Cronenberg',
                child: Text('Cronenbergs'),
              ),
              const PopupMenuItem<String>(
                value: '',
                child: Text('Quitar filttro'),
              ),
            ],
          ),
          PopupMenuButton<String>(
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Center(
                  child: Text(
                'Status',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              )),
            ),
            onSelected: (value) {
              applyFilterStatus(value, '', '');
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Alive',
                child: Text('Alive'),
              ),
              const PopupMenuItem<String>(
                value: 'Dead',
                child: Text('Dead'),
              ),
              const PopupMenuItem<String>(
                value: 'unknown',
                child: Text('Unknown'),
              ),
              const PopupMenuItem<String>(
                value: '',
                child: Text('Quitar filttro'),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rick and Morty',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'All Characters',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                height: screenSize.height * 0.76,
                child: PersonajesList(
                  scrollController: scrollController,
                  personajes: personajes,
                  context: context,
                  reachedLastPage: reachedLastPage,
                  count: count,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
