import 'package:flutter/material.dart';
import 'package:unibg_pokemon/data/models/pokemon_item.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/singlepokemon_page.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.thisPokemon, required this.type});

  final PokemonItem thisPokemon;
  final String type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SinglePokemonPage(
            pokemonId: thisPokemon.id!,
          ),
        ),
      ),
      child: Text(thisPokemon.name),
    );
  }
}
