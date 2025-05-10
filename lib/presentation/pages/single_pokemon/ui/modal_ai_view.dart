import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/pokemon_description_page.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/pokemon_opponent_page.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/pokemon_team_page.dart';
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
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDescriptionPage(
                          pokemonName: pokemon.name,
                        ),
                      ),
                    );
                  },
                  child: const Text('Description'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonOpponentPage(
                          pokemonName: pokemon.name,
                          isUp: true,
                        ),
                      ),
                    );
                  },
                  child: const Text('Pokémon Advantage'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonOpponentPage(
                          pokemonName: pokemon.name,
                          isUp: false,
                        ),
                      ),
                    );
                  },
                  child: const Text('Pokémon Disadvantage'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonTeamPage(
                          pokemonName: pokemon.name,
                        ),
                      ),
                    );
                  },
                  child: const Text('Team'),
                ),
              ],
            ),
          ),
        ),
      ];
    },
    modalTypeBuilder: (_) => WoltModalType.bottomSheet(),
    barrierDismissible: true,
  );
}
