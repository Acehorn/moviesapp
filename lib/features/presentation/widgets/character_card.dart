import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviesapp/features/characters/store/character_store.dart';
import 'package:moviesapp/features/presentation/widgets/character_image.dart';
import '../../../../core/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;
   final CharacterStore store;

  const CharacterCard({
    super.key,
    required this.character,
    required this.onTap, 
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Hero(
  tag: 'character_${character.id}',
  child: CharacterImage(
    imageUrl: character.image,
    size: 56,
  ),
),

        title: Text(character.name),
        subtitle: Text('${character.species} • ${character.gender}'),
        onTap: onTap,

      trailing: Observer(
  builder: (_) => IconButton(
    icon: Icon(
      store.isFavorite(character.id)
          ? Icons.favorite
          : Icons.favorite_border,
      color: store.isFavorite(character.id) ? Colors.red : Colors.grey,
    ),
    onPressed: () {
      store.toggleFavorite(character.id);
    },
  ),
),
      ),
    );
  }
}
