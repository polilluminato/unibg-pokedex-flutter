import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unibg_pokemon/models/pokemon_sprite_other.dart';

part 'pokemon_sprite.freezed.dart';
part 'pokemon_sprite.g.dart';

@freezed
abstract class PokemonSprite with _$PokemonSprite {
  const factory PokemonSprite({
    @JsonKey(name: 'front_default') required String frontDefault,
    @JsonKey(name: 'front_shiny') required String frontShiny,
    required PokemonSpriteOther other,
  }) = _PokemonSprite;

  factory PokemonSprite.fromJson(Map<String, Object?> json) =>
      _$PokemonSpriteFromJson(json);
}
