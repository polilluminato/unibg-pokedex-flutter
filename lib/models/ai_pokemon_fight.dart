import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_pokemon_fight.freezed.dart';
part 'ai_pokemon_fight.g.dart';

@freezed
abstract class AiPokemonFight with _$AiPokemonFight {
  const factory AiPokemonFight({
    required int id,
    required String name,
    required List<String> types,
    required String motivation,
  }) = _AiPokemonFight;

  factory AiPokemonFight.fromJson(Map<String, Object?> json) =>
      _$AiPokemonFightFromJson(json);
}
