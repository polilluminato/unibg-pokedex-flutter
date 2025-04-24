import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unibg_pokemon/models/pokemon_cry.dart';
import 'package:unibg_pokemon/models/pokemon_sprite.dart';
import 'package:unibg_pokemon/models/pokemon_stat_item.dart';
import 'package:unibg_pokemon/models/pokemon_type_item.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
abstract class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required int height,
    required int weight,
    required PokemonSprite sprites,
    required List<PokemonTypeItem> types,
    required List<PokemonStatItem> stats,
    required PokemonCry cries,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, Object?> json) =>
      _$PokemonFromJson(json);
}
