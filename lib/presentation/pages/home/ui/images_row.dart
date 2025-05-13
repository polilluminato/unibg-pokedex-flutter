import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:unibg_pokemon/data/models/pokemon.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class ImagesRow extends StatelessWidget {
  const ImagesRow({super.key, required this.myPokemon});

  final Pokemon myPokemon;

  ExtendedImage _createImage(String url, double width) {
    return ExtendedImage.network(
      width: width,
      url,
    );
  }

  @override
  Widget build(BuildContext context) {
    double imageSize = getScreenWidth(context) * 0.2;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _createImage(myPokemon.sprites.other.showdown.frontDefault, imageSize),
        _createImage(myPokemon.sprites.other.showdown.frontShiny, imageSize),
      ],
    );
  }
}
