class Pokemon {
  final String name;
  final int height;
  final int weight;
  final String imageLink;

  Pokemon(
      {required this.name,
      required this.height,
      required this.weight,
      required this.imageLink});

  factory Pokemon.fromJson(Map<String, dynamic> data) {
    //I nomi mi arrivano tutti in lowercase, in questo modo metto la prima
    //  lettera maiuscola: bulbasaur -> Bulbasaur
    String nameFromApi = data['name'] as String;
    final name =
        nameFromApi[0].toUpperCase() + nameFromApi.substring(1).toLowerCase();

    final height = data['height'] as int;
    final weight = data['weight'] as int;
    final imageLink =
        data['sprites']['other']['official-artwork']['front_default'] as String;
    return Pokemon(
        name: name, height: height, weight: weight, imageLink: imageLink);
  }
}
