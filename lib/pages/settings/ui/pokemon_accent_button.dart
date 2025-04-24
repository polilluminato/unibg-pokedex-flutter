import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unibg_pokemon/pages/settings/theme_provider.dart';
import 'package:unibg_pokemon/styles/dimens.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class PokemonAccentButton extends ConsumerWidget {
  const PokemonAccentButton({
    super.key,
    required this.color,
    required this.pokemonId,
  });

  final Color color;
  final int pokemonId;

  double getButtonWidth(BuildContext context) {
    return (getScreenWidth(context) -
            (Dimens.mainPadding * 2) -
            (Dimens.mainSpace * 3)) /
        3.6;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final acProvider = ref.watch(accentColorProvider);

    return InkWell(
      onTap: () =>
          ref.read(accentColorProvider.notifier).update((state) => color),
      child: Container(
        padding: const EdgeInsets.all(Dimens.smallPadding),
        decoration: BoxDecoration(
          border: Border.all(
            width: Dimens.mainBorderSideWidth,
            color: acProvider == color ? color : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(Dimens.smallRoundedCorner),
        ),
        child: SvgPicture.network(
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$pokemonId.svg",
          width: getButtonWidth(context),
          height: getButtonWidth(context),
        ),
      ),
    );
  }
}
