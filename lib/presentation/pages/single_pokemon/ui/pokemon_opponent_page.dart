import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:unibg_pokemon/enums/colorType_enum.dart';
import 'package:unibg_pokemon/models/ai_pokemon_fight.dart';
import 'package:unibg_pokemon/service/kprompts.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/loading_view.dart';
import 'package:unibg_pokemon/service/ai_service.dart';
import 'package:unibg_pokemon/styles/dimens.dart';
import 'package:unibg_pokemon/utils/string_extensions.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class PokemonOpponentPage extends StatefulWidget {
  const PokemonOpponentPage(
      {super.key, required this.pokemonName, required this.isUp});

  final String pokemonName;
  final bool isUp;

  @override
  State<PokemonOpponentPage> createState() => _PokemonOpponentPageState();
}

class _PokemonOpponentPageState extends State<PokemonOpponentPage> {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Opponent"),
      ),
      body: FutureBuilder<String?>(
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
                    getDefaultPokemonImage(aiPokemonFight.id),
                    width: 200,
                    height: 200,
                  ),
                  Text(aiPokemonFight.name, style: textTheme.headlineMedium),
                  const SizedBox(height: Dimens.mainSpace),
                  Wrap(
                    runSpacing: Dimens.smallPadding,
                    spacing: Dimens.smallPadding,
                    children: aiPokemonFight.types
                        .map(
                          (type) => Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Dimens.hugeRoundedCorner,
                              ),
                            ),
                            label: Text(type.capitalize()),
                            backgroundColor:
                                hexToColor(ColorType.fromName(type).color),
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                        .toList(),
                  ),
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
      ),
    );
  }
}
