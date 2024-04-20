import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon.dart';
import 'package:unibg_pokemon/repository/pokemon_repository.dart';

class SinglePokemonPage extends StatelessWidget {
  const SinglePokemonPage({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Pokémon"),
      ),
      body: FutureBuilder<Pokemon>(
        future: PokemonRepository().getSinglePokemon(pokemonId),
        builder: (_, AsyncSnapshot<Pokemon> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Pokemon myPokemon = snapshot.data!;

              print(myPokemon.toJson());

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(myPokemon.sprites.frontDefault),
                    Text(
                      myPokemon.name,
                      style: textTheme.displayMedium,
                    ),
                  ],
                ),
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
