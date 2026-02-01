import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviesapp/features/characters/store/character_store.dart';
import 'package:moviesapp/features/presentation/pages/character_detail_page.dart';
import 'package:moviesapp/features/presentation/widgets/character_card.dart';
import 'package:moviesapp/features/presentation/widgets/filter_bar.dart';

class CharactersList extends StatelessWidget {
  final CharacterStore store;

  const CharactersList({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return   Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilterBar(store: store),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                if (store.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: store.filteredCharacters.length,
                  itemBuilder: (_, index) {
                    final character =
                        store.filteredCharacters[index];

                    return CharacterCard(
                      character: character,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CharacterDetailPage(
                              character: character,
                              store: store,
                            ),
                          ),
                        );
                      },
                      store: store,
                    );
                  },
                );
              },
            ),
          ),
        ],
      );
  }
}
