import 'package:flutter/material.dart';
import 'package:unibg_pokemon/data/models/ai_pokemon_description.dart';
import 'package:unibg_pokemon/config/kprompts.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/loading_view.dart';
import 'package:unibg_pokemon/services/ai_service.dart';
import 'package:unibg_pokemon/presentation/styles/dimens.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class PokemonDescriptionPage extends StatefulWidget {
  const PokemonDescriptionPage({super.key, required this.pokemonName});

  final String pokemonName;

  @override
  State<PokemonDescriptionPage> createState() => _PokemonDescriptionPageState();
}

class _PokemonDescriptionPageState extends State<PokemonDescriptionPage> {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Description"),
      ),
      body: FutureBuilder<String?>(
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
                  Text(aiPokemonDescription.description,
                      style: textTheme.bodyLarge),
                  const SizedBox(
                    height: Dimens.mainSpace,
                  ),
                  Text(
                    "Strength",
                    style: textTheme.titleLarge,
                  ),
                  Text(aiPokemonDescription.strength,
                      style: textTheme.bodyLarge),
                  const SizedBox(
                    height: Dimens.mainSpace,
                  ),
                  Text(
                    "Weakness",
                    style: textTheme.titleLarge,
                  ),
                  Text(aiPokemonDescription.weakness,
                      style: textTheme.bodyLarge),
                ],
              ),
            );
          } else {
            return const LoadingView();
          }
        },
      ),
    );
  }
}
