enum ColorType {
  normal("#A8A878", "normal"),
  fighting("#C03028", "fighting"),
  flying("#A890F0", "flying"),
  poison("#A040A0", "poison"),
  ground("#E0C068", "ground"),
  rock("#B8A038", "rock"),
  bug("#A8B820", "bug"),
  ghost("#705898", "ghost"),
  steel("#B8B8D0", "steel"),
  fire("#F08030", "fire"),
  water("#6890F0", "water"),
  grass("#78C850", "grass"),
  electric("#F8D030", "electric"),
  psychic("#F85888", "psychic"),
  ice("#98D8D8", "ice"),
  dragon("#7038F8", "dragon"),
  dark("#705848", "dark"),
  fairy("#EE99AC", "fairy"),
  stellar("#9DB7F5", "stellar"),
  unknown("#68A090", "unknown");

  const ColorType(this.color, this.name);
  final String color;
  final String name;

  // Metodo per ottenere un ColorType dal nome
  static ColorType fromName(String name) {
    return ColorType.values.firstWhere(
      (type) => type.name == name,
      orElse: () => ColorType.unknown,
    );
  }

  // Metodo per ottenere un ColorType dal colore
  static ColorType fromColor(String color) {
    return ColorType.values.firstWhere(
      (type) => type.color == color,
      orElse: () => ColorType.unknown,
    );
  }
}
