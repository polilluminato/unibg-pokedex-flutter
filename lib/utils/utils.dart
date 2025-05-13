import 'dart:convert';

import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

SizedBox gapW(double width) => SizedBox(width: width);

SizedBox gapH(double height) => SizedBox(height: height);

Color hexToColor(String hexString) {
  final buffer = StringBuffer();

  // Rimuoviamo il simbolo # se presente
  final cleanHex = hexString.replaceFirst('#', '');

  if (cleanHex.length == 3 || cleanHex.length == 4) {
    // Formato breve #RGB o #RGBA
    // Raddoppiamo ogni carattere
    for (var i = 0; i < cleanHex.length; i++) {
      buffer.write('${cleanHex[i]}${cleanHex[i]}');
    }

    // Se era RGB (formato breve senza alpha), aggiungiamo FF per opacità massima
    if (cleanHex.length == 3) {
      final temp = buffer.toString();
      buffer.clear();
      buffer.write('FF$temp');
    }
  } else if (cleanHex.length == 6) {
    // Formato #RRGGBB
    buffer.write('FF$cleanHex');
  } else if (cleanHex.length == 8) {
    // Formato #AARRGGBB
    buffer.write(cleanHex);
  } else {
    // Formato non valido, ritorna nero
    return Colors.black;
  }

  try {
    return Color(int.parse(buffer.toString(), radix: 16));
  } catch (e) {
    return Colors.black;
  }
}

Map<String, Object?> parseAiStringToMap(String aiString) {
  final aiStringJson =
      aiString.replaceAll('```json', '').replaceAll('```', '').trim();

  final aiStringJsonDecoded = jsonDecode(aiStringJson);
  return aiStringJsonDecoded;
}

List<Map<String, Object?>> parseAiStringToListMap(String aiString) {
  // Pulizia della stringa eliminando le parti di markdown e gli spazi
  final cleanedString =
      aiString.replaceAll('```json', '').replaceAll('```', '').trim();

  // Decodifica della stringa JSON
  final List<dynamic> decodedList = jsonDecode(cleanedString);

  // Conversione della lista di dynamic in List<Map<String, Object?>>
  return decodedList
      .map((item) => Map<String, Object?>.from(item as Map))
      .toList();
}

String getDefaultPokemonImage(int id) {
  return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
}
