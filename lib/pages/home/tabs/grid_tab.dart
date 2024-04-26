import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:unibg_pokemon/pages/home/ui/card_view.dart';
import 'package:unibg_pokemon/repository/pokemon_repository.dart';

class GridTab extends StatelessWidget {
  const GridTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonItem>?>(
      future: PokemonRepository().getPokemonList(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CardView(
                  thisPokemon: snapshot.data![index],
                  type: "grid",
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
