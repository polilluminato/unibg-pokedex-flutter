import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:unibg_pokemon/pages/singlepokemon_page.dart';
import 'package:unibg_pokemon/styles/dimens.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.thisPokemon, required this.type});

  final PokemonItem thisPokemon;
  final String type;

  List<Widget> _insideContainerList(ThemeData thisTheme) {
    return [
      Image.network(
        thisPokemon.imageLink!,
        width: type == "list" ? 50 : 80,
      ),
      const SizedBox(
        width: Dimens.mainSpace,
        height: Dimens.mainSpace,
      ),
      Expanded(
        child: Text(
          thisPokemon.name,
          style: thisTheme.textTheme.titleLarge,
        ),
      ),
    ];
  }

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
        margin: EdgeInsets.symmetric(
          horizontal: type == "list" ? Dimens.smallMargin : Dimens.tinyMargin,
          vertical: Dimens.tinyMargin,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.mainPadding,
          vertical: Dimens.smallPadding,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: thisTheme.colorScheme.primary,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(Dimens.smallRoundedCorner),
          ),
        ),
        child: switch (type) {
          "list" => Row(
              children: _insideContainerList(thisTheme),
            ),
          "grid" => Column(
              children: _insideContainerList(thisTheme),
            ),
          _ => throw UnimplementedError(),
        },
      ),
    );
  }
}
