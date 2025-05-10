import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/ai_pokemon_description.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/kprompts.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/loading_view.dart';
import 'package:unibg_pokemon/service/ai_service.dart';
import 'package:unibg_pokemon/styles/dimens.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class PokemonDescriptionView extends StatefulWidget {
  const PokemonDescriptionView({super.key, required this.pokemonName});

  final String pokemonName;

  @override
  State<PokemonDescriptionView> createState() => _PokemonDescriptionViewState();
}

class _PokemonDescriptionViewState extends State<PokemonDescriptionView> {
  late final Future<String?> aiString;

  @override
  void initState() {
    super.initState();
    aiString =
        AiService().askToAi(kPromptPokemonDescription(widget.pokemonName));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<String?>(
      future: aiString,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final aiPokemonDescription = AiPokemonDescription.fromJson(
            parseAiStringToMap(snapshot.data!),
          );
          return Padding(
            padding: const EdgeInsets.all(Dimens.mainPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: textTheme.titleLarge,
                ),
                Text(aiPokemonDescription.description,
                    style: textTheme.bodyLarge),
                const SizedBox(
                  height: Dimens.mainSpace,
                ),
                Text(
                  "Strength",
                  style: textTheme.titleLarge,
                ),
                Text(aiPokemonDescription.strength, style: textTheme.bodyLarge),
                const SizedBox(
                  height: Dimens.mainSpace,
                ),
                Text(
                  "Weakness",
                  style: textTheme.titleLarge,
                ),
                Text(aiPokemonDescription.weakness, style: textTheme.bodyLarge),
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
