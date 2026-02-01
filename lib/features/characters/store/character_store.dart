import 'package:mobx/mobx.dart';
import 'package:moviesapp/core/models/series.dart';
import 'package:moviesapp/core/storage/favorites_storage.dart';
import 'package:moviesapp/features/characters/data/omdb_api.dart';
import '../../../core/models/character.dart';
import '../data/futurama_api.dart';

part 'character_store.g.dart';

class CharacterStore = CharacterStoreBase with _$CharacterStore;

abstract class CharacterStoreBase with Store {
  final FuturamaApi api;
  final OmdbApi omdbApi;
  final FavoritesStorage favoritesStorage;

  CharacterStoreBase(
    this.api,
    this.omdbApi,
    this.favoritesStorage,
  );


  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  String selectedGender = 'ALL';

  @observable
  Series? seriesInfo;

  @observable
  bool loadingSeries = false;

  @observable
  ObservableSet<int> favoriteIds = ObservableSet<int>();

 
  @computed
  List<Character> get filteredCharacters {
    if (selectedGender == 'ALL') {
      return characters.toList();
    }
    return characters.where((c) => c.gender == selectedGender).toList();
  }

  @computed
  List<Character> get favoriteCharacters {
    return characters.where((c) => favoriteIds.contains(c.id)).toList();
  }

  
  @action
  Future<void> init() async {
    final savedFavorites = await favoritesStorage.loadFavorites();
    favoriteIds
      ..clear()
      ..addAll(savedFavorites);
  }

 
  @action
  Future<void> fetchCharacters() async {
    loading = true;
    error = null;

    try {
      final result = await api.getCharacters();
      characters
        ..clear()
        ..addAll(result);
    } catch (e) {
      error = 'Error al cargar personajes';
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> fetchSeriesInfo() async {
    loadingSeries = true;
    try {
      seriesInfo = await omdbApi.getSeriesInfo('Futurama');
    } catch (_) {
      seriesInfo = null;
    } finally {
      loadingSeries = false;
    }
  }

  @action
  void setGenderFilter(String gender) {
    selectedGender = gender;
  }

  @action
  Future<void> toggleFavorite(int characterId) async {
    if (favoriteIds.contains(characterId)) {
      favoriteIds.remove(characterId);
    } else {
      favoriteIds.add(characterId);
    }

    await favoritesStorage.saveFavorites(favoriteIds);
  }

  bool isFavorite(int id) => favoriteIds.contains(id);
}
