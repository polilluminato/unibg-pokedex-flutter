import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unibg_pokemon/models/pokemon_sprite.dart';
import 'package:unibg_pokemon/models/pokemon_stat_item.dart';
import 'package:unibg_pokemon/models/pokemon_type_item.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required String name,
    required int height,
    required int weight,
    required PokemonSprite sprites,
    required List<PokemonTypeItem> types,
    required List<PokemonStatItem> stats,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, Object?> json) =>
      _$PokemonFromJson(json);
}
