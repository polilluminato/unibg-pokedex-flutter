import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unibg_pokemon/models/home_tab_model.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:unibg_pokemon/pages/home/tabs/grid_tab.dart';
import 'package:unibg_pokemon/pages/home/tabs/list_tab.dart';
import 'package:unibg_pokemon/pages/singlepokemon_page.dart';
import 'package:unibg_pokemon/repository/pokemon_repository.dart';

final indexTabProvider = StateProvider<int>((ref) => 0);

final List<HomeTab> tabList = [
  HomeTab(
    label: "List",
    icon: Icons.list_alt,
    content: const ListTab(),
  ),
  HomeTab(
    label: "Grid",
    icon: Icons.grid_view,
    content: const GridTab(),
  ),
];

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UniBG Pokédex"),
      ),
      body: tabList[ref.watch(indexTabProvider)].content,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          ref.read(indexTabProvider.notifier).state = index;
        },
        selectedIndex: ref.watch(indexTabProvider),
        destinations: tabList
            .map(
              (singleScreenTab) => NavigationDestination(
            icon: Icon(singleScreenTab.icon),
            label: singleScreenTab.label,
          ),
        )
            .toList(),
      ),
    );
  }
}
