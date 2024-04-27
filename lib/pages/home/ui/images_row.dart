import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class ImagesRow extends StatelessWidget {
  const ImagesRow({super.key, required this.myPokemon});

  final Pokemon myPokemon;

  Image _createImage(String url, double width) {
    return Image.network(
      width: width,
      url,
    );
  }

  @override
  Widget build(BuildContext context) {
    double imageSize = getScreenWidth(context) * 0.2;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _createImage(myPokemon.sprites.frontDefault, imageSize),
        _createImage(myPokemon.sprites.frontShiny, imageSize),
        _createImage(myPokemon.sprites.other.showdown.frontDefault, imageSize),
        _createImage(myPokemon.sprites.other.showdown.frontShiny, imageSize),
      ],
    );
  }
}
