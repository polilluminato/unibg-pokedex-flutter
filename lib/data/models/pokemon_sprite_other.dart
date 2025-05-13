import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unibg_pokemon/data/models/pokemon_sprite_other_dreamworld.dart';
import 'package:unibg_pokemon/data/models/pokemon_sprite_other_home.dart';
import 'package:unibg_pokemon/data/models/pokemon_sprite_other_officialartwork.dart';
import 'package:unibg_pokemon/data/models/pokemon_sprite_other_showdown.dart';

part 'pokemon_sprite_other.freezed.dart';
part 'pokemon_sprite_other.g.dart';

@freezed
abstract class PokemonSpriteOther with _$PokemonSpriteOther {
  const factory PokemonSpriteOther({
    @JsonKey(name: 'dream_world')
    required PokemonSpriteOtherDreamWorld dreamWorld,
    required PokemonSpriteOtherHome home,
    @JsonKey(name: 'official-artwork')
    required PokemonSpriteOtherOfficialArtwork officialArtwork,
    required PokemonSpriteOtherShowdown showdown,
  }) = _PokemonSpriteOther;

  factory PokemonSpriteOther.fromJson(Map<String, Object?> json) =>
      _$PokemonSpriteOtherFromJson(json);
}
