import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/pokemon_description_view.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/pokemon_opponent_view.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:unibg_pokemon/styles/dimens.dart';

Future<void> modalAIView({
  required BuildContext context,
  required Pokemon pokemon,
}) async {
  return WoltModalSheet.show<void>(
    context: context,
    showDragHandle: false,
    pageListBuilder: (context) {
      return [
        WoltModalSheetPage(
          navBarHeight: 48,
          topBarTitle: Text(
            "Pokémon AI Assistant",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          isTopBarLayerAlwaysVisible: true,
          trailingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(Dimens.smallPadding),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(context).pop,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.mainPadding),
            child: Column(
              spacing: Dimens.smallSpace,
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    WoltModalSheet.of(context).showPageWithId("description");
                  },
                  child: const Text('Description'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    WoltModalSheet.of(context)
                        .showPageWithId("pokemon_advantage");
                  },
                  child: const Text('Pokémon Advantage'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    WoltModalSheet.of(context)
                        .showPageWithId("pokemon_disadvantage");
                  },
                  child: const Text('Pokémon Disadvantage'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    WoltModalSheet.of(context).showPageWithId("team");
                  },
                  child: const Text('Team'),
                ),
              ],
            ),
          ),
        ),
        WoltModalSheetPage(
          id: "description",
          navBarHeight: 48,
          topBarTitle: Text(
            "Description",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          isTopBarLayerAlwaysVisible: true,
          leadingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(Dimens.smallPadding),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => WoltModalSheet.of(context).showAtIndex(0),
          ),
          child: PokemonDescriptionView(pokemonName: pokemon.name),
        ),
        WoltModalSheetPage(
          id: "pokemon_advantage",
          navBarHeight: 48,
          topBarTitle: Text(
            "Pokémon Advantage",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          isTopBarLayerAlwaysVisible: true,
          leadingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(Dimens.smallPadding),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => WoltModalSheet.of(context).showAtIndex(0),
          ),
          child: PokemonOpponentView(pokemonName: pokemon.name, isUp: true),
        ),
        WoltModalSheetPage(
          id: "pokemon_disadvantage",
          navBarHeight: 48,
          topBarTitle: Text(
            "Pokémon Disadvantage",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          isTopBarLayerAlwaysVisible: true,
          leadingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(Dimens.smallPadding),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => WoltModalSheet.of(context).showAtIndex(0),
          ),
          child: PokemonOpponentView(pokemonName: pokemon.name, isUp: false),
        ),
        WoltModalSheetPage(
          id: "team",
          navBarHeight: 48,
          topBarTitle: Text(
            "Team",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          isTopBarLayerAlwaysVisible: true,
          leadingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(Dimens.smallPadding),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => WoltModalSheet.of(context).showAtIndex(0),
          ),
          child: const SizedBox.shrink(),
        ),
      ];
    },
    modalTypeBuilder: (_) => WoltModalType.bottomSheet(),
    barrierDismissible: true,
  );
}
