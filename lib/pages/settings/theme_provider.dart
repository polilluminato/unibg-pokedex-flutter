import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brightnessProvider = StateProvider<Brightness>((ref) => Brightness.light);

final accentColorProvider = StateProvider<Color>((ref) => Colors.orange);
