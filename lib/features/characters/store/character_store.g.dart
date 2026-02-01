// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on CharacterStoreBase, Store {
  Computed<List<Character>>? _$filteredCharactersComputed;

  @override
  List<Character> get filteredCharacters =>
      (_$filteredCharactersComputed ??= Computed<List<Character>>(
            () => super.filteredCharacters,
            name: 'CharacterStoreBase.filteredCharacters',
          ))
          .value;
  Computed<List<Character>>? _$favoriteCharactersComputed;

  @override
  List<Character> get favoriteCharacters =>
      (_$favoriteCharactersComputed ??= Computed<List<Character>>(
            () => super.favoriteCharacters,
            name: 'CharacterStoreBase.favoriteCharacters',
          ))
          .value;

  late final _$loadingAtom = Atom(
    name: 'CharacterStoreBase.loading',
    context: context,
  );

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom = Atom(
    name: 'CharacterStoreBase.error',
    context: context,
  );

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$charactersAtom = Atom(
    name: 'CharacterStoreBase.characters',
    context: context,
  );

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$selectedGenderAtom = Atom(
    name: 'CharacterStoreBase.selectedGender',
    context: context,
  );

  @override
  String get selectedGender {
    _$selectedGenderAtom.reportRead();
    return super.selectedGender;
  }

  @override
  set selectedGender(String value) {
    _$selectedGenderAtom.reportWrite(value, super.selectedGender, () {
      super.selectedGender = value;
    });
  }

  late final _$seriesInfoAtom = Atom(
    name: 'CharacterStoreBase.seriesInfo',
    context: context,
  );

  @override
  Series? get seriesInfo {
    _$seriesInfoAtom.reportRead();
    return super.seriesInfo;
  }

  @override
  set seriesInfo(Series? value) {
    _$seriesInfoAtom.reportWrite(value, super.seriesInfo, () {
      super.seriesInfo = value;
    });
  }

  late final _$loadingSeriesAtom = Atom(
    name: 'CharacterStoreBase.loadingSeries',
    context: context,
  );

  @override
  bool get loadingSeries {
    _$loadingSeriesAtom.reportRead();
    return super.loadingSeries;
  }

  @override
  set loadingSeries(bool value) {
    _$loadingSeriesAtom.reportWrite(value, super.loadingSeries, () {
      super.loadingSeries = value;
    });
  }

  late final _$favoriteIdsAtom = Atom(
    name: 'CharacterStoreBase.favoriteIds',
    context: context,
  );

  @override
  ObservableSet<int> get favoriteIds {
    _$favoriteIdsAtom.reportRead();
    return super.favoriteIds;
  }

  @override
  set favoriteIds(ObservableSet<int> value) {
    _$favoriteIdsAtom.reportWrite(value, super.favoriteIds, () {
      super.favoriteIds = value;
    });
  }

  late final _$initAsyncAction = AsyncAction(
    'CharacterStoreBase.init',
    context: context,
  );

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$fetchCharactersAsyncAction = AsyncAction(
    'CharacterStoreBase.fetchCharacters',
    context: context,
  );

  @override
  Future<void> fetchCharacters() {
    return _$fetchCharactersAsyncAction.run(() => super.fetchCharacters());
  }

  late final _$fetchSeriesInfoAsyncAction = AsyncAction(
    'CharacterStoreBase.fetchSeriesInfo',
    context: context,
  );

  @override
  Future<void> fetchSeriesInfo() {
    return _$fetchSeriesInfoAsyncAction.run(() => super.fetchSeriesInfo());
  }

  late final _$toggleFavoriteAsyncAction = AsyncAction(
    'CharacterStoreBase.toggleFavorite',
    context: context,
  );

  @override
  Future<void> toggleFavorite(int characterId) {
    return _$toggleFavoriteAsyncAction.run(
      () => super.toggleFavorite(characterId),
    );
  }

  late final _$CharacterStoreBaseActionController = ActionController(
    name: 'CharacterStoreBase',
    context: context,
  );

  @override
  void setGenderFilter(String gender) {
    final _$actionInfo = _$CharacterStoreBaseActionController.startAction(
      name: 'CharacterStoreBase.setGenderFilter',
    );
    try {
      return super.setGenderFilter(gender);
    } finally {
      _$CharacterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
characters: ${characters},
selectedGender: ${selectedGender},
seriesInfo: ${seriesInfo},
loadingSeries: ${loadingSeries},
favoriteIds: ${favoriteIds},
filteredCharacters: ${filteredCharacters},
favoriteCharacters: ${favoriteCharacters}
    ''';
  }
}
