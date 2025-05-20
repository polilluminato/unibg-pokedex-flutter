import 'package:flutter/material.dart';
import 'package:unibg_pokemon/data/models/pokemon.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:unibg_pokemon/presentation/styles/dimens.dart';

Future<void> modalAIView({
  required BuildContext context,
  required Pokemon pokemon,
}) async {
  return WoltModalSheet.show<void>(
    context: context,
    showDragHandle: false,
    pageListBuilder: (context) {
      return [
        WoltModalSheetPage(
          navBarHeight: 48,
          topBarTitle: Text(
            "Pokémon AI Assistant",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          isTopBarLayerAlwaysVisible: true,
          trailingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(Dimens.smallPadding),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(context).pop,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.mainPadding),
            child: Column(
              spacing: Dimens.smallSpace,
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),
        ),
      ];
    },
    modalTypeBuilder: (_) => WoltModalType.bottomSheet(),
    barrierDismissible: true,
  );
}
