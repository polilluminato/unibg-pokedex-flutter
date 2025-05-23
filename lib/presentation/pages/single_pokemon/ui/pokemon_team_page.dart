import 'package:flutter/material.dart';
import 'package:unibg_pokemon/config/kprompts.dart';
import 'package:unibg_pokemon/services/ai_service.dart';

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
      body: SizedBox.shrink(),
    );
  }
}
