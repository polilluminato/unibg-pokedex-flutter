import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/ai_pokemon_fight.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/kprompts.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/loading_view.dart';
import 'package:unibg_pokemon/service/ai_service.dart';
import 'package:unibg_pokemon/styles/dimens.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class PokemonOpponentView extends StatefulWidget {
  const PokemonOpponentView(
      {super.key, required this.pokemonName, required this.isUp});

  final String pokemonName;
  final bool isUp;

  @override
  State<PokemonOpponentView> createState() => _PokemonOpponentViewState();
}

class _PokemonOpponentViewState extends State<PokemonOpponentView> {
  late final Future<String?> aiString;

  @override
  void initState() {
    super.initState();
    aiString = AiService().askToAi(widget.isUp
        ? kPromptPokemonOpponentAdvantage(widget.pokemonName)
        : kPromptPokemonOpponentDisadvantage(widget.pokemonName));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<String?>(
      future: aiString,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final aiPokemonFight = AiPokemonFight.fromJson(
            parseAiStringToMap(snapshot.data!),
          );
          return Padding(
            padding: const EdgeInsets.all(Dimens.mainPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ExtendedImage.network(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${aiPokemonFight.id}.png",
                  width: 200,
                  height: 200,
                ),
                Text(aiPokemonFight.name, style: textTheme.headlineMedium),
                const SizedBox(height: Dimens.mainSpace),
                Text(aiPokemonFight.motivation,
                    textAlign: TextAlign.start, style: textTheme.bodyLarge),
              ],
            ),
          );
        } else {
          return const LoadingView();
        }
      },
    );
  }
}
