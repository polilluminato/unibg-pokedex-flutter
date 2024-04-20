import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_sprite_other_showdown.freezed.dart';
part 'pokemon_sprite_other_showdown.g.dart';

@freezed
class PokemonSpriteOtherShowdown with _$PokemonSpriteOtherShowdown {
  const factory PokemonSpriteOtherShowdown({
    @JsonKey(name: 'front_default') required String frontDefault,
    @JsonKey(name: 'front_shiny') required String frontShiny,
  }) = _PokemonSprOfficialShowdown;

  factory PokemonSpriteOtherShowdown.fromJson(Map<String, Object?> json) =>
      _$PokemonSpriteOtherShowdownFromJson(json);
}
