import 'package:flutter/material.dart';

extension ColorToHex on Color {
  String toHex({bool leadingHashSign = true}) {
    int rInt = (r * 255).round();
    int gInt = (g * 255).round();
    int bInt = (b * 255).round();
    return '${leadingHashSign ? '#' : ''}'
        '${rInt.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${gInt.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${bInt.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }
}
