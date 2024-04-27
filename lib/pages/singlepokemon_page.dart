import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon.dart';
import 'package:unibg_pokemon/pages/home/ui/divider_view.dart';
import 'package:unibg_pokemon/repository/pokemon_repository.dart';
import 'package:unibg_pokemon/styles/dimens.dart';
import 'package:unibg_pokemon/utils/string_extensions.dart';

class SinglePokemonPage extends StatelessWidget {
  const SinglePokemonPage({super.key, required this.pokemonId});

  final int pokemonId;

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

              //print(myPokemon.toJson());

              return SingleChildScrollView(
                padding: const EdgeInsets.all(Dimens.mainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      myPokemon.sprites.other.officialArtwork.frontDefault,
                    ),
                    Text(
                      myPokemon.name.capitalize(),
                      style: textTheme.displayMedium,
                    ),
                    const SizedBox(
                      height: Dimens.mainSpace,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tipo",
                          style: textTheme.titleLarge,
                        ),
                        Wrap(
                          runSpacing: Dimens.smallPadding,
                          spacing: Dimens.smallPadding,
                          children: myPokemon.types
                              .map((type) => Chip(
                                    label: Text(type.type.name.capitalize()),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                    const CustomDivider(),
                    Text(
                      "Statistiche",
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
                      "Grido",
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
                          onPressed: () {},
                          icon: const Icon(Icons.audiotrack),
                          label: const Text("Legacy"),
                        ),
                        const SizedBox(
                          width: Dimens.mainSpace,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.audiotrack),
                          label: const Text("Latest"),
                        )
                      ],
                    )
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
