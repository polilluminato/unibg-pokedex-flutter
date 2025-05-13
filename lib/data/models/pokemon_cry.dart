import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_cry.freezed.dart';
part 'pokemon_cry.g.dart';

@freezed
abstract class PokemonCry with _$PokemonCry {
  const factory PokemonCry({
    required String latest,
    required String legacy,
  }) = _PokemonCry;

  factory PokemonCry.fromJson(Map<String, Object?> json) =>
      _$PokemonCryFromJson(json);
}
