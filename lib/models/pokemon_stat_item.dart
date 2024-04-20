import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unibg_pokemon/models/pokemon_stat.dart';

part 'pokemon_stat_item.freezed.dart';
part 'pokemon_stat_item.g.dart';

@freezed
class PokemonStatItem with _$PokemonStatItem {
  const factory PokemonStatItem({
    @JsonKey(name: 'base_stat') required int baseStat,
    required int effort,
    required PokemonStat stat,
  }) = _PokemonStatItem;

  factory PokemonStatItem.fromJson(Map<String, Object?> json) =>
      _$PokemonStatItemFromJson(json);
}
