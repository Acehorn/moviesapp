import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviesapp/features/characters/store/character_store.dart';

class SearchingBar extends StatelessWidget {
  final CharacterStore store;

  const SearchingBar({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextField(
        onChanged: store.setSearchQuery,
        decoration: InputDecoration(
          hintText: 'Buscar personaje...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: store.searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => store.setSearchQuery(''),
                )
              : null,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
