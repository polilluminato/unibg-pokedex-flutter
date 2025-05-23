import 'package:flutter/material.dart';
import 'package:unibg_pokemon/config/kprompts.dart';
import 'package:unibg_pokemon/services/ai_service.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Description"),
      ),
      body: SizedBox.shrink(),
    );
  }
}
