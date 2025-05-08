import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:unibg_pokemon/presentation/pages/settings/theme_provider.dart';
import 'package:unibg_pokemon/styles/dimens.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class PokemonAccentButton extends ConsumerStatefulWidget {
  const PokemonAccentButton({
    super.key,
    required this.pokemonId,
  });

  final int pokemonId;

  @override
  ConsumerState<PokemonAccentButton> createState() =>
      _PokemonAccentButtonState();
}

class _PokemonAccentButtonState extends ConsumerState<PokemonAccentButton> {
  late PaletteGenerator? paletteGenerator;
  late String imageNetworkPath;
  Color? color = Colors.transparent;

  @override
  void initState() {
    super.initState();
    imageNetworkPath =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.pokemonId}.png";
    _updatePaletteGenerator();
  }

  Future<void> _updatePaletteGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      ExtendedImage.network(imageNetworkPath).image,
    );
    color = paletteGenerator?.dominantColor?.color;
    setState(() {});
  }

  double getButtonWidth(BuildContext context) {
    return (getScreenWidth(context) -
            (Dimens.mainPadding * 2) -
            (Dimens.mainSpace * 3)) /
        3.8;
  }

  @override
  Widget build(BuildContext context) {
    final acProvider = ref.watch(accentColorProvider);

    return InkWell(
      onTap: () {
        ref.read(accentColorProvider.notifier).update((state) => color!);
      },
      child: Container(
        padding: const EdgeInsets.all(Dimens.smallPadding),
        decoration: BoxDecoration(
          border: Border.all(
            width: Dimens.mainBorderSideWidth,
            color: acProvider == color ? color! : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(Dimens.smallRoundedCorner),
        ),
        child: ExtendedImage.network(
          imageNetworkPath,
          width: getButtonWidth(context),
        ),
      ),
    );
  }
}
