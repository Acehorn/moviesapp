import 'package:flutter/material.dart';
import 'package:moviesapp/features/presentation/pages/characters_page.dart';
import 'features/characters/data/futurama_api.dart';
import 'features/characters/data/omdb_api.dart';
import 'features/characters/store/character_store.dart';
import 'package:moviesapp/core/storage/favorites_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final store = CharacterStore(
    FuturamaApi(),
    OmdbApi(),
    FavoritesStorage(),
  );

  await store.init();

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final CharacterStore store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futurama App',
      theme: ThemeData.dark(),
      home: CharactersPage(store: store),
    );
  }
}
