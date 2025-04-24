import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:unibg_pokemon/models/pokemon.dart';
import 'package:unibg_pokemon/pages/home/ui/carousel_view.dart';
import 'package:unibg_pokemon/pages/home/ui/divider_view.dart';
import 'package:unibg_pokemon/pages/home/ui/images_row.dart';
import 'package:unibg_pokemon/repository/pokemon_repository.dart';
import 'package:unibg_pokemon/styles/dimens.dart';
import 'package:unibg_pokemon/utils/string_extensions.dart';

class SinglePokemonPage extends StatelessWidget {
  SinglePokemonPage({super.key, required this.pokemonId});

  final int pokemonId;
  final AudioPlayer _player = AudioPlayer();

  void _playCry(String url) async {
    _player.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Pokémon"),
      ),
      body: FutureBuilder<Pokemon>(
        future: PokemonRepository().getSinglePokemon(pokemonId),
        builder: (_, AsyncSnapshot<Pokemon> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Pokemon myPokemon = snapshot.data!;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(Dimens.mainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: PinchZoom(
                        maxScale: 2.5,
                        child: Image.network(
                          myPokemon.sprites.other.officialArtwork.frontDefault,
                        ),
                      ),
                    ),
                    ImagesRow(myPokemon: myPokemon),
                    const CustomDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          myPokemon.name.capitalize(),
                          style: textTheme.displayMedium,
                        ).animate().scale(),
                        Text(
                          "#${myPokemon.id.toString()}",
                          style: textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimens.hugeSpace,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Type",
                          style: textTheme.titleLarge,
                        ),
                        Wrap(
                          runSpacing: Dimens.smallPadding,
                          spacing: Dimens.smallPadding,
                          children: myPokemon.types
                              .map(
                                (type) => Chip(
                                  label: Text(type.type.name.capitalize()),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: Dimens.mainSpace,
                    ),
                    Text(
                      "Statistics",
                      style: textTheme.titleLarge,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: myPokemon.stats.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            myPokemon.stats[index].stat.name
                                .capitalize()
                                .replaceAll("-", " "),
                            style: textTheme.bodyLarge,
                          ),
                          trailing: Text(
                            myPokemon.stats[index].baseStat.toString(),
                            style: textTheme.bodyLarge,
                          ),
                        );
                      },
                    ),
                    const CustomDivider(),
                    Text(
                      "Cry",
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: Dimens.mainSpace,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _playCry(myPokemon.cries.legacy),
                          icon: const Icon(Icons.audiotrack),
                          label: const Text("Legacy"),
                        ),
                        const SizedBox(
                          width: Dimens.mainSpace,
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _playCry(myPokemon.cries.latest),
                          icon: const Icon(Icons.audiotrack),
                          label: const Text("Latest"),
                        )
                      ],
                    ),
                    const CustomDivider(),
                    Text(
                      "Slideshow",
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: Dimens.mainSpace,
                    ),
                    CarouselView(
                      myPokemon: myPokemon,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("Errore"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
