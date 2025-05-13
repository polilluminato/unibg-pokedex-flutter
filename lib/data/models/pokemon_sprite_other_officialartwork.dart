import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_sprite_other_officialartwork.freezed.dart';
part 'pokemon_sprite_other_officialartwork.g.dart';

@freezed
abstract class PokemonSpriteOtherOfficialArtwork
    with _$PokemonSpriteOtherOfficialArtwork {
  const factory PokemonSpriteOtherOfficialArtwork({
    @JsonKey(name: 'front_default') required String frontDefault,
  }) = _PokemonSpriteOtherOfficialArtwork;

  factory PokemonSpriteOtherOfficialArtwork.fromJson(
          Map<String, Object?> json) =>
      _$PokemonSpriteOtherOfficialArtworkFromJson(json);
}
