import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_stat.freezed.dart';
part 'pokemon_stat.g.dart';

@freezed
class PokemonStat with _$PokemonStat {
  const factory PokemonStat({
    required String name,
    required String url,
  }) = _PokemonStat;

  factory PokemonStat.fromJson(Map<String, Object?> json) =>
      _$PokemonStatFromJson(json);
}
