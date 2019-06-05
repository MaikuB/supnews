// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$FavouritesStore on FavouritesStoreBase, Store {
  Computed<bool> _$hasFavouritesComputed;

  @override
  bool get hasFavourites =>
      (_$hasFavouritesComputed ??= Computed<bool>(() => super.hasFavourites))
          .value;

  final _$favouritesAtom = Atom(name: 'FavouritesStoreBase.favourites');

  @override
  ObservableList<FeedItem> get favourites {
    _$favouritesAtom.reportObserved();
    return super.favourites;
  }

  @override
  set favourites(ObservableList<FeedItem> value) {
    _$favouritesAtom.context
        .checkIfStateModificationsAreAllowed(_$favouritesAtom);
    super.favourites = value;
    _$favouritesAtom.reportChanged();
  }

  final _$FavouritesStoreBaseActionController =
      ActionController(name: 'FavouritesStoreBase');

  @override
  void loadFavourites() {
    final _$actionInfo = _$FavouritesStoreBaseActionController.startAction();
    try {
      return super.loadFavourites();
    } finally {
      _$FavouritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addFavourite(FeedItem item) {
    final _$actionInfo = _$FavouritesStoreBaseActionController.startAction();
    try {
      return super.addFavourite(item);
    } finally {
      _$FavouritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFavourite(FeedItem item) {
    final _$actionInfo = _$FavouritesStoreBaseActionController.startAction();
    try {
      return super.removeFavourite(item);
    } finally {
      _$FavouritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
