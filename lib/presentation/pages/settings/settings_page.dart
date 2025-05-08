import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unibg_pokemon/presentation/pages/settings/ui/pokemon_accent_button.dart';
import 'package:unibg_pokemon/presentation/pages/settings/ui/pokemon_theme_button.dart';
import 'package:unibg_pokemon/styles/dimens.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Dimens.mainPadding),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Dimens.mainPadding),
            child: Text(
              "Theme",
              style: textTheme.titleLarge,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PokemonThemeButton(
                isDark: false,
                pokemonId: 643,
              ),
              PokemonThemeButton(
                isDark: true,
                pokemonId: 644,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: Dimens.hugePadding,
              bottom: Dimens.mainPadding,
            ),
            child: Text(
              "Accent Color",
              style: textTheme.titleLarge,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: Dimens.mainSpace,
            runSpacing: Dimens.mainSpace,
            children: [
              const PokemonAccentButton(
                pokemonId: 4,
              ),
              const PokemonAccentButton(
                pokemonId: 1,
              ),
              const PokemonAccentButton(
                pokemonId: 7,
              ),
              const PokemonAccentButton(
                pokemonId: 25,
              ),
              const PokemonAccentButton(
                pokemonId: 94,
              ),
              const PokemonAccentButton(
                pokemonId: 39,
              ),
              const PokemonAccentButton(
                pokemonId: 133,
              ),
              const PokemonAccentButton(
                pokemonId: 129,
              ),
              const PokemonAccentButton(
                pokemonId: 111,
              ),
            ],
          )
        ],
      ),
    );
  }
}
