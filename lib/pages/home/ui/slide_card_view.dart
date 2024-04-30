import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:unibg_pokemon/pages/singlepokemon_page.dart';
import 'package:unibg_pokemon/styles/dimens.dart';
import 'package:unibg_pokemon/utils/string_extensions.dart';

class SlideCardView extends StatelessWidget {
  const SlideCardView({super.key, required this.thisPokemon});

  final PokemonItem thisPokemon;

  void doNothing(String actionType) {
    debugPrint("$actionType) ${thisPokemon.name.capitalize()}");
  }

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
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => doNothing("share"),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => doNothing("delete"),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: _InsideCard(thisPokemon: thisPokemon),
      ),
    );
  }
}

class _InsideCard extends StatelessWidget {
  const _InsideCard({required this.thisPokemon});

  final PokemonItem thisPokemon;

  @override
  Widget build(BuildContext context) {
    ThemeData thisTheme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Dimens.smallMargin,
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
      child: Row(
        children: [
          Image.network(
            thisPokemon.imageLink!,
            width: 50,
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
        ],
      ),
    );
  }
}
