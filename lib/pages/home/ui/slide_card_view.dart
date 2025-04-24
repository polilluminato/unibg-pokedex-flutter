import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:unibg_pokemon/pages/singlepokemon_page.dart';

class SlideCardView extends StatelessWidget {
  const SlideCardView({super.key, required this.thisPokemon});

  final PokemonItem thisPokemon;

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
      child: Text(
        thisPokemon.name,
        style: thisTheme.textTheme.titleLarge,
      ),
    );
  }
}
