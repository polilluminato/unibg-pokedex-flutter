import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:unibg_pokemon/data/enums/colortype_enum.dart';
import 'package:unibg_pokemon/data/models/pokemon.dart';
import 'package:unibg_pokemon/presentation/pages/home/ui/images_row.dart';
import 'package:unibg_pokemon/presentation/pages/single_pokemon/ui/modal_ai_view.dart';
import 'package:unibg_pokemon/data/repository/pokemon_repository.dart';
import 'package:unibg_pokemon/presentation/styles/dimens.dart';
import 'package:unibg_pokemon/utils/string_extensions.dart';
import 'package:unibg_pokemon/utils/utils.dart';

class SinglePokemonPage extends StatelessWidget {
  const SinglePokemonPage({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<Pokemon>(
        future: PokemonRepository().getSinglePokemon(pokemonId),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Pokemon myPokemon = snapshot.data!;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(Dimens.mainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        myPokemon.name.capitalize(),
                        style: textTheme.displaySmall,
                      ).animate().scale(),
                    ),
                    Center(
                      child: PinchZoom(
                        maxScale: 2.5,
                        child: ExtendedImage.network(
                          myPokemon.sprites.other.officialArtwork.frontDefault,
                          width: getScreenWidth(context) * .7,
                        ),
                      ),
                    ),
                    ImagesRow(myPokemon: myPokemon),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: Dimens.mainSpace,
                      ),
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          minimumSize: const Size.fromHeight(56),
                        ),
                        onPressed: () => modalAIView(
                          context: context,
                          pokemon: myPokemon,
                        ),
                        icon: const Icon(Icons.smart_toy),
                        label: const Text("Ask AI"),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: Dimens.smallSpace,
                      children: [
                        ...myPokemon.types.map(
                          (type) => Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Dimens.hugeRoundedCorner,
                              ),
                              side: BorderSide(
                                color: hexToColor(
                                    ColorType.fromName(type.type.name).color),
                              ),
                            ),
                            label: Text(type.type.name.capitalize()),
                            backgroundColor: hexToColor(
                                ColorType.fromName(type.type.name).color),
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "#${myPokemon.id.toString()}",
                          style: textTheme.headlineMedium,
                        ),
                      ],
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
