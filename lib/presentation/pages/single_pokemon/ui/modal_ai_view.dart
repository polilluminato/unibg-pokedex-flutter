import 'package:flutter/material.dart';
import 'package:unibg_pokemon/models/pokemon.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:unibg_pokemon/styles/dimens.dart';

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
          topBarTitle: Text("Pokémon AI Assistant"),
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
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    WoltModalSheet.of(context).showPageWithId("description");
                  },
                  child: const Text('Description'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    WoltModalSheet.of(context).showPageWithId("opponent_up");
                  },
                  child: const Text('Opponent Up'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    WoltModalSheet.of(context).showPageWithId("opponent_down");
                  },
                  child: const Text('Opponent Down'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {
                    WoltModalSheet.of(context).showPageWithId("team");
                  },
                  child: const Text('Team'),
                ),
              ],
            ),
          ),
        ),
        WoltModalSheetPage(
          id: "description",
          navBarHeight: 48,
          topBarTitle: Text("Description"),
          isTopBarLayerAlwaysVisible: true,
          leadingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(Dimens.smallPadding),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => WoltModalSheet.of(context).showAtIndex(0),
          ),
          child: const SizedBox.shrink(),
        ),
        WoltModalSheetPage(
          id: "opponent_up",
          navBarHeight: 48,
          topBarTitle: Text("Opponent Up"),
          isTopBarLayerAlwaysVisible: true,
          leadingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(Dimens.smallPadding),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => WoltModalSheet.of(context).showAtIndex(0),
          ),
          child: const SizedBox.shrink(),
        ),
        WoltModalSheetPage(
          id: "opponent_down",
          navBarHeight: 48,
          topBarTitle: Text("Opponent Down"),
          isTopBarLayerAlwaysVisible: true,
          leadingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(Dimens.smallPadding),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => WoltModalSheet.of(context).showAtIndex(0),
          ),
          child: const SizedBox.shrink(),
        ),
        WoltModalSheetPage(
          id: "team",
          navBarHeight: 48,
          topBarTitle: Text("Team"),
          isTopBarLayerAlwaysVisible: true,
          leadingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(Dimens.smallPadding),
            icon: const Icon(Icons.arrow_back),
            onPressed: () => WoltModalSheet.of(context).showAtIndex(0),
          ),
          child: const SizedBox.shrink(),
        ),
      ];
    },
    modalTypeBuilder: (_) => WoltModalType.bottomSheet(),
    barrierDismissible: true,
  );
}
