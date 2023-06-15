import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/personaje.dart';
import 'package:prueba_tecnica/pages/loading_page.dart';
import 'package:prueba_tecnica/repository/repository.dart';
import 'package:prueba_tecnica/widgets/list_personajes.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    super.initState();
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
              child: FutureBuilder<List<Personaje?>>(
                  future: Repository().getCharacters(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? PersonajesList(personajes: snapshot.data)
                        : const LoadingPage();
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
