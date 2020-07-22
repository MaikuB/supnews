// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavouritesStore on FavouritesStoreBase, Store {
  Computed<bool> _$hasFavouritesComputed;

  @override
  bool get hasFavourites =>
      (_$hasFavouritesComputed ??= Computed<bool>(() => super.hasFavourites,
              name: 'FavouritesStoreBase.hasFavourites'))
          .value;

  final _$favouritesAtom = Atom(name: 'FavouritesStoreBase.favourites');

  @override
  ObservableList<FeedItem> get favourites {
    _$favouritesAtom.reportRead();
    return super.favourites;
  }

  @override
  set favourites(ObservableList<FeedItem> value) {
    _$favouritesAtom.reportWrite(value, super.favourites, () {
      super.favourites = value;
    });
  }

  final _$FavouritesStoreBaseActionController =
      ActionController(name: 'FavouritesStoreBase');

  @override
  void loadFavourites() {
    final _$actionInfo = _$FavouritesStoreBaseActionController.startAction(
        name: 'FavouritesStoreBase.loadFavourites');
    try {
      return super.loadFavourites();
    } finally {
      _$FavouritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addFavourite(FeedItem item) {
    final _$actionInfo = _$FavouritesStoreBaseActionController.startAction(
        name: 'FavouritesStoreBase.addFavourite');
    try {
      return super.addFavourite(item);
    } finally {
      _$FavouritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFavourite(FeedItem item) {
    final _$actionInfo = _$FavouritesStoreBaseActionController.startAction(
        name: 'FavouritesStoreBase.removeFavourite');
    try {
      return super.removeFavourite(item);
    } finally {
      _$FavouritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favourites: ${favourites},
hasFavourites: ${hasFavourites}
    ''';
  }
}
