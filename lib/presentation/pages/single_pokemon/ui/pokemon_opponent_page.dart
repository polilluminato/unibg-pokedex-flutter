import 'package:flutter/material.dart';
import 'package:unibg_pokemon/config/kprompts.dart';
import 'package:unibg_pokemon/services/ai_service.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opponent"),
      ),
      body: SizedBox.shrink(),
    );
  }
}
