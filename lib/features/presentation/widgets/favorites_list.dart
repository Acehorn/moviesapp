import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviesapp/features/characters/store/character_store.dart';
import 'package:moviesapp/features/presentation/pages/character_detail_page.dart';
import 'package:moviesapp/features/presentation/widgets/character_card.dart';

class FavoritesList extends StatelessWidget {
  final CharacterStore store;

  const FavoritesList({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.favoriteCharacters.isEmpty) {
          return const Center(
            child: Text('No hay favoritos aún'),
          );
        }

        return ListView.builder(
          itemCount: store.favoriteCharacters.length,
          itemBuilder: (_, index) {
            final character = store.favoriteCharacters[index];

            return CharacterCard(
              character: character,
              store: store,
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
            );
          },
        );
      },
    );
  }
}
