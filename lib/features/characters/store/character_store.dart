import 'package:mobx/mobx.dart';
import 'package:moviesapp/core/models/series.dart';
import 'package:moviesapp/features/characters/data/omdb_api.dart';
import '../../../core/models/character.dart';
import '../data/futurama_api.dart';

part 'character_store.g.dart';

class CharacterStore = CharacterStoreBase with _$CharacterStore;

abstract class CharacterStoreBase with Store {
  final FuturamaApi api;
  final OmdbApi omdbApi;

  CharacterStoreBase(this.api, this.omdbApi);

 

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
  return characters
      .where((c) => c.gender == selectedGender)
      .toList();
}

@computed
List<Character> get favoriteCharacters {
  return characters
      .where((c) => favoriteIds.contains(c.id))
      .toList();
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
  } catch (e) {
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
void toggleFavorite(int characterId) {
  if (favoriteIds.contains(characterId)) {
    favoriteIds.remove(characterId);
  } else {
    favoriteIds.add(characterId);
  }
}

bool isFavorite(int id) => favoriteIds.contains(id);




}
