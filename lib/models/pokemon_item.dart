class PokemonItem {
  String name;
  String url;
  int? id;
  String? imageLink;

  PokemonItem({required this.name, required this.url, this.id, this.imageLink,});

  factory PokemonItem.fromJson(Map<String, dynamic> data) {

    String url = data['url'] as String;
    String mameFromApi = data['name'] as String;
    //I nomi mi arrivano tutti in lowercase, in questo modo metto la prima
    //  lettera maiuscola: bulbasaur -> Bulbasaur
    String name =
        mameFromApi[0].toUpperCase() + mameFromApi.substring(1).toLowerCase();
    //Link fatto come https://pokeapi.co/api/v2/pokemon/5/
    //  vado a prenderne id alla fine
    int id = int.parse(url.substring(url.length - 2, url.length - 1));
    //Basandosi sull'API per il singolo pokemon l'immagine può essere ottenuta
    //  componendo il link in questo modo:
    //  - https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{id}.png
    String imageLink =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";

    return PokemonItem(name: name, url: url, id: id, imageLink: imageLink);
  }
}
