import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_sprite_other_dreamworld.freezed.dart';
part 'pokemon_sprite_other_dreamworld.g.dart';

@freezed
class PokemonSpriteOtherDreamWorld with _$PokemonSpriteOtherDreamWorld {
  const factory PokemonSpriteOtherDreamWorld({
    @JsonKey(name: 'front_default') required String frontDefault,
  }) = _PokemonSpriteOtherDreamWorld;

  factory PokemonSpriteOtherDreamWorld.fromJson(Map<String, Object?> json) =>
      _$PokemonSpriteOtherDreamWorldFromJson(json);
}
