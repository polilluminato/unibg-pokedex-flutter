import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:unibg_pokemon/pages/singlepokemon_page.dart';

class CardListView extends StatelessWidget {
  const CardListView({super.key, required this.thisPokemon});

  final PokemonItem thisPokemon;

  @override
  Widget build(BuildContext context) {
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
  }
}
