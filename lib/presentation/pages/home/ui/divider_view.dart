import 'package:flutter/material.dart';
import 'package:unibg_pokemon/styles/dimens.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: Dimens.hugeSpace,
      color: Colors.black26,
    );
  }
}
