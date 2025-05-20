import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unibg_pokemon/presentation/pages/home/tabs/list_tab.dart';
import 'package:unibg_pokemon/presentation/pages/settings/settings_page.dart';
import 'package:unibg_pokemon/presentation/styles/dimens.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UniBG Pokédex"),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: Dimens.mainPadding),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListTab(),
    );
  }
}
