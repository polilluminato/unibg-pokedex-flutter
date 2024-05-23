import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:unibg_pokemon/pages/singlepokemon_page.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.thisPokemon, required this.type});

  final PokemonItem thisPokemon;
  final String type;

  @override
  Widget build(BuildContext context) {
    ThemeData thisTheme = Theme.of(context);

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SinglePokemonPage(
            pokemonId: thisPokemon.id!,
          ),
        ),
      ),
      child: Container(
        child: Row(
          children: [
            Text(
              thisPokemon.name,
              style: thisTheme.textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
