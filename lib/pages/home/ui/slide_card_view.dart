import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:unibg_pokemon/pages/singlepokemon_page.dart';
import 'package:unibg_pokemon/styles/dimens.dart';
import 'package:unibg_pokemon/utils/string_extensions.dart';
import 'package:unibg_pokemon/utils/utils.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class SlideCardView extends StatelessWidget {
  const SlideCardView({super.key, required this.thisPokemon});

  final PokemonItem thisPokemon;

  void doNothing(String actionType) {
    debugPrint("$actionType) ${thisPokemon.name.capitalize()}");
  }

  @override
  Widget build(BuildContext context) {
    SliverWoltModalSheetPage pokemonBottomSheetWidget(
      BuildContext modalSheetContext,
      TextTheme textTheme,
    ) {
      return WoltModalSheetPage(
        hasSabGradient: false,
        topBarTitle: Text(
          thisPokemon.name.capitalize(),
          style: textTheme.titleLarge,
        ),
        isTopBarLayerAlwaysVisible: true,
        trailingNavBarWidget: IconButton(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.mainPadding,
            vertical: Dimens.smallPadding,
          ),
          icon: const Icon(Icons.close),
          onPressed: Navigator.of(modalSheetContext).pop,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
          child: Hero(
            tag: thisPokemon.id!,
            child: Image.network(
              thisPokemon.imagePng!,
              width: getScreenWidth(context) * .8,
              height: getScreenWidth(context) * .8,
            ),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SinglePokemonPage(
            pokemonId: thisPokemon.id!,
          ),
        ),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                WoltModalSheet.show<void>(
                  context: context,
                  pageListBuilder: (modalSheetContext) {
                    return [
                      pokemonBottomSheetWidget(
                        modalSheetContext,
                        Theme.of(context).textTheme,
                      ),
                    ];
                  },
                  modalTypeBuilder: (context) {
                    final size = MediaQuery.of(context).size.width;
                    if (size < 600) {
                      return WoltModalType.bottomSheet;
                    } else {
                      return WoltModalType.dialog;
                    }
                  },
                  onModalDismissedWithBarrierTap: Navigator.of(context).pop,
                  maxDialogWidth: 560,
                  minDialogWidth: 400,
                  minPageHeight: 0.0,
                  maxPageHeight: 0.9,
                );
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.info_outline,
              label: 'More Info',
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => doNothing("delete"),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: _InsideCard(thisPokemon: thisPokemon),
      ),
    );
  }
}

class _InsideCard extends StatelessWidget {
  const _InsideCard({required this.thisPokemon});

  final PokemonItem thisPokemon;

  @override
  Widget build(BuildContext context) {
    ThemeData thisTheme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Dimens.smallMargin,
        vertical: Dimens.tinyMargin,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.mainPadding,
        vertical: Dimens.smallPadding,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: Dimens.smallBorderSideWidth,
          color: thisTheme.colorScheme.primary,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(Dimens.smallRoundedCorner),
        ),
      ),
      child: Row(
        children: [
          Hero(
            tag: thisPokemon.id!,
            child: Image.network(
              thisPokemon.imagePng!,
              width: 50,
            ),
          ),
          const SizedBox(
            width: Dimens.mainSpace,
            height: Dimens.mainSpace,
          ),
          Expanded(
            child: Text(
              thisPokemon.name,
              style: thisTheme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
