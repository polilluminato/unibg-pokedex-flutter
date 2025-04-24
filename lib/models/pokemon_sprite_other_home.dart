import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_sprite_other_home.freezed.dart';
part 'pokemon_sprite_other_home.g.dart';

@freezed
abstract class PokemonSpriteOtherHome with _$PokemonSpriteOtherHome {
  const factory PokemonSpriteOtherHome({
    @JsonKey(name: 'front_default') required String frontDefault,
    @JsonKey(name: 'front_shiny') required String frontShiny,
  }) = _PokemonSpriteOtherHome;

  factory PokemonSpriteOtherHome.fromJson(Map<String, Object?> json) =>
      _$PokemonSpriteOtherHomeFromJson(json);
}
