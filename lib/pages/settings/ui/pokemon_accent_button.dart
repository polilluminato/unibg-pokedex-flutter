import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unibg_pokemon/pages/settings/theme_provider.dart';
import 'package:unibg_pokemon/styles/dimens.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class PokemonAccentButton extends ConsumerWidget {
  const PokemonAccentButton({
    super.key,
    required this.color,
    required this.link,
  });

  final Color color;
  final String link;

  double getButtonWidth(BuildContext context) {
    return (getScreenWidth(context) -
            (Dimens.mainPadding * 2) -
            (Dimens.mainSpace * 3)) /
        3.1;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final acProvider = ref.watch(accentColorProvider);
    double size = 32;

    return InkWell(
      onTap: () =>
          ref.read(accentColorProvider.notifier).update((state) => color),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: size * .1,
            color: acProvider == color ? color : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(size),
        ),
        child: Image.network(
          width: getButtonWidth(context),
          link,
        ),
      ),
    );
  }
}
