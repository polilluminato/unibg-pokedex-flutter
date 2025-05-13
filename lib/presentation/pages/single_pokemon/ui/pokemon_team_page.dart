import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:unibg_pokemon/data/models/ai_pokemon_fight.dart';
import 'package:unibg_pokemon/config/kprompts.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/loading_view.dart';
import 'package:unibg_pokemon/services/ai_service.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class PokemonTeamPage extends StatefulWidget {
  const PokemonTeamPage({super.key, required this.pokemonName});

  final String pokemonName;

  @override
  State<PokemonTeamPage> createState() => _PokemonTeamPageState();
}

class _PokemonTeamPageState extends State<PokemonTeamPage> {
  late final Future<String?> aiString;

  @override
  void initState() {
    super.initState();
    aiString = AiService().askToAi(kPromptPokemonTeam(widget.pokemonName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Team"),
      ),
      body: FutureBuilder<String?>(
        future: aiString,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final aiPokemonList = parseAiStringToListMap(snapshot.data!)
                .map((pokemon) => AiPokemonFight.fromJson(pokemon))
                .toList();

            return ListView.builder(
              itemCount: aiPokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = aiPokemonList[index];
                return ListTile(
                  leading: ExtendedImage.network(
                    getDefaultPokemonImage(pokemon.id),
                    height: 72,
                    width: 72,
                  ),
                  title: Text(pokemon.name),
                  subtitle: Text(pokemon.motivation),
                );
              },
            );
          } else {
            return const LoadingView();
          }
        },
      ),
    );
  }
}
