import 'dart:convert';

import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:mobx/mobx.dart';
import '../services/preferences_service.dart';

part 'favourites_store.g.dart';

class FavouritesStore = FavouritesStoreBase with _$FavouritesStore;

abstract class FavouritesStoreBase with Store {
  PreferencesService _preferencesService;

  FavouritesStoreBase(this._preferencesService);

  @observable
  ObservableList<FeedItem> favourites = ObservableList<FeedItem>();

  @computed
  bool get hasFavourites => favourites.isNotEmpty;

  bool isInFavourites(FeedItem feedItem) =>
      favourites.any((f) => f.id == feedItem.id);

  @action
  void loadFavourites() {
    _preferencesService.favourites
        .map((f) => FeedItem.fromJson(jsonDecode(f)))
        .forEach((f) => favourites.add(f));
  }

  @action
  addFavourite(FeedItem item) {
    favourites.add(item);
    _saveFavourites();
  }

  @action
  void removeFavourite(FeedItem item) {
    favourites.removeWhere((fi) => fi.id == item.id);
    _saveFavourites();
  }

  void _saveFavourites() {
    _preferencesService.favourites =
        favourites.map((fi) => fi.toString()).toList();
  }
}
