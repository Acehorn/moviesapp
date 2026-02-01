import 'package:flutter/material.dart';
import 'package:moviesapp/features/presentation/pages/characters_page.dart';
import 'features/characters/data/futurama_api.dart';
import 'features/characters/data/omdb_api.dart';
import 'features/characters/store/character_store.dart';

void main() {
  final store = CharacterStore(
    FuturamaApi(),
    OmdbApi(),
  );

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
