import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviesapp/features/characters/store/character_store.dart';
import 'package:moviesapp/features/presentation/pages/character_detail_page.dart';
import 'package:moviesapp/features/presentation/widgets/character_card.dart';
import 'package:moviesapp/features/presentation/widgets/characters_list.dart';
import 'package:moviesapp/features/presentation/widgets/favorites_list.dart';
import 'package:moviesapp/features/presentation/widgets/filter_bar.dart';

class CharactersPage extends StatefulWidget {
  final CharacterStore store;

  const CharactersPage({super.key, required this.store});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  void initState() {
    super.initState();
    widget.store.fetchCharacters();
    widget.store.fetchSeriesInfo();
  }

  @override
  Widget build(BuildContext context) {
    return 
  DefaultTabController(
  length: 2,
  child: Scaffold(
    appBar: AppBar(
      title: const Text('Futurama'),
      bottom: const TabBar(
        tabs: [
          Tab(text: 'Personajes'),
          Tab(text: 'Favoritos'),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        CharactersList(store: widget.store),
        FavoritesList(store: widget.store),
      ],
    ),
  ),
);

  
  }
}
