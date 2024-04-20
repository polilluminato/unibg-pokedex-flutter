import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:unibg_pokemon/pages/singlepokemon_page.dart';
import 'package:unibg_pokemon/repository/pokemon_repository.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonItem>?>(
      future: PokemonRepository().getPokemonList(),
      builder: (_, snapshot) {
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
    );
  }
}