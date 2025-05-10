import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_pokemon_description.freezed.dart';
part 'ai_pokemon_description.g.dart';

@freezed
abstract class AiPokemonDescription with _$AiPokemonDescription {
  const factory AiPokemonDescription({
    required String description,
    required String strength,
    required String weakness,
  }) = _AiPokemonDescription;

  factory AiPokemonDescription.fromJson(Map<String, Object?> json) =>
      _$AiPokemonDescriptionFromJson(json);
}
