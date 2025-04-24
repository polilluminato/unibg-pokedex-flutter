import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon.dart';

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({super.key, required this.myPokemon});

  final Pokemon myPokemon;

  List<String> _createSpritesList() {
    return [
      myPokemon.sprites.other.officialArtwork.frontDefault,
      myPokemon.sprites.other.home.frontDefault,
      myPokemon.sprites.other.home.frontShiny,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: false,
        enableInfiniteScroll: false,
        viewportFraction: 0.6,
      ),
      items: _createSpritesList()
          .map(
            (item) => SizedBox(
              child: Image.network(
                item,
                fit: BoxFit.fill,
              ),
            ),
          )
          .toList(),
    );
  }
}
