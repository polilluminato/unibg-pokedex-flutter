import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unibg_pokemon/pages/settings/ui/pokemon_accent_button.dart';
import 'package:unibg_pokemon/pages/settings/ui/pokemon_theme_button.dart';
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
              ),
              PokemonThemeButton(
                isDark: true,
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
                color: Colors.orange,
                link:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
              ),
              const PokemonAccentButton(
                color: Colors.green,
                link:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
              ),
              const PokemonAccentButton(
                color: Colors.lightBlue,
                link:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png",
              ),
              const PokemonAccentButton(
                color: Colors.yellow,
                link:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
              ),
              const PokemonAccentButton(
                color: Colors.purple,
                link:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png",
              ),
              PokemonAccentButton(
                color: Colors.pink[100]!,
                link:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png",
              ),
            ],
          )
        ],
      ),
    );
  }
}
