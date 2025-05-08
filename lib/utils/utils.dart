import 'package:flutter/material.dart';

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double getScreenWidth(BuildContext context) {
  return getScreenSize(context).width;
}

double getScreenHeight(BuildContext context) {
  return getScreenSize(context).height;
}

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
