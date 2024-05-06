import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unibg_pokemon/pages/settings/theme_provider.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class PokemonThemeButton extends ConsumerWidget {
  const PokemonThemeButton({super.key, required this.isDark});

  final bool isDark;

  Color getBorderColor(Color acProvider, Brightness tProvider) {
    if (isDark) {
      return tProvider == Brightness.dark ? acProvider : Colors.transparent;
    } else {
      return tProvider == Brightness.light ? acProvider : Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final acProvider = ref.watch(accentColorProvider);
    final tProvider = ref.watch(brightnessProvider);
    double size = 32;

    return InkWell(
      onTap: () => ref
          .read(brightnessProvider.notifier)
          .update((state) => isDark ? Brightness.dark : Brightness.light),
      child: Container(
          width: getScreenWidth(context) * .45,
          decoration: BoxDecoration(
            border: Border.all(
              width: size * .1,
              color: getBorderColor(acProvider, tProvider),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network(
            width: getScreenWidth(context) * .35,
            isDark
                ? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/644.png"
                : "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/643.png",
          )),
    );
  }
}
