import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:unibg_pokemon/pages/singlepokemon_page.dart';
import 'package:unibg_pokemon/repository/pokemon_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UniBG Pokédex"),
      ),
      body: FutureBuilder<List<PokemonItem>?>(
        future: PokemonRepository().getPokemonList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {

                  PokemonItem thisPokemon = snapshot.data![index];

                  return ListTile(
                    title: Text(thisPokemon.name),
                    leading: Image.network(
                      thisPokemon.imageLink!,
                      width: 50,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SinglePokemonPage(
                          pokemonId: thisPokemon.id!,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("Errore"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
