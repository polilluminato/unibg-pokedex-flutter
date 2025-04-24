import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unibg_pokemon/models/pokemon_type.dart';

part 'pokemon_type_item.freezed.dart';
part 'pokemon_type_item.g.dart';

@freezed
abstract class PokemonTypeItem with _$PokemonTypeItem {
  const factory PokemonTypeItem({
    required int slot,
    required PokemonType type,
  }) = _PokemonTypeItem;

  factory PokemonTypeItem.fromJson(Map<String, Object?> json) =>
      _$PokemonTypeItemFromJson(json);
}
