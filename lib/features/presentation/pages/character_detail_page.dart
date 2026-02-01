import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviesapp/features/characters/store/character_store.dart';
import 'package:moviesapp/features/presentation/widgets/character_image.dart';
import '../../../../core/models/character.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;
  final CharacterStore store;

  const CharacterDetailPage({
    super.key,
    required this.character,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name), actions: [
        Observer(
  builder: (_) => IconButton(
    icon: Icon(
      store.isFavorite(character.id)
          ? Icons.favorite
          : Icons.favorite_border,
    ),
    color: store.isFavorite(character.id) ? Colors.red : Colors.white,
    onPressed: () {
      store.toggleFavorite(character.id);
    },
  ),
),

      ],),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
  tag: 'character_${character.id}',
  child: CharacterImage(
    imageUrl: character.image,
    size: 220,
  ),
),

            ),
            const SizedBox(height: 16),
            Text(
              character.name,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('${character.species} • ${character.gender}'),
            const SizedBox(height: 16),
            Text(character.status),
            const Divider(height: 32),

            const Text(
              'Serie',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Observer(
              builder: (_) {
                if (store.loadingSeries) {
                  return const CircularProgressIndicator();
                }

                final series = store.seriesInfo;
                if (series == null) {
                  return const Text('Información no disponible');
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text('Título: ${series.title}'),
                    Text('Año: ${series.year}'),
                    Text('IMDb: ${series.rating}'),
                    const SizedBox(height: 8),
                    Text(series.plot),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
