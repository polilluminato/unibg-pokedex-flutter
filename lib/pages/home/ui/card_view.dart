import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.thisPokemon, required this.type});

  final PokemonItem thisPokemon;
  final String type;

  @override
  Widget build(BuildContext context) {
    ThemeData thisTheme = Theme.of(context);

    return Text(
      thisPokemon.name,
      style: thisTheme.textTheme.titleLarge,
    );
  }
}
