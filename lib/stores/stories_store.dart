import 'package:async/async.dart';
import 'package:mobx/mobx.dart';
import 'package:supnews/models/enums.dart';
import 'package:supnews/models/item.dart';
import 'package:supnews/services/items_service.dart';
import 'package:supnews/services/preferences_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

part 'stories_store.g.dart';

class StoriesStore = StoriesStoreBase with _$StoriesStore;

abstract class StoriesStoreBase implements Store {
  final StoryFeedType _storyFeedType;
  final ItemsService _itemsService;
  final PreferencesService _preferencesService;
  final AsyncMemoizer _asyncMemoizer = AsyncMemoizer();

  bool isInitialLoadDone = false;

  @observable
  bool isLoadingInitialStories = false;

  @observable
  ObservableList<Future<Item>> stories = ObservableList<Future<Item>>();

  StoriesStoreBase(
      this._storyFeedType, this._itemsService, this._preferencesService);

  @action
  Future<void> refresh() {
    return _loadStories(true);
  }

  @action
  Future<void> loadInitialStories() async {
    await _asyncMemoizer.runOnce(() async {
      await _loadStories(false);
    });
  }

  Future<void> open(String url) {
    final defaultOpenInAppPreference = _preferencesService.getOpenInApp();
    return launch(url,
        forceSafariVC: defaultOpenInAppPreference,
        forceWebView: defaultOpenInAppPreference);
  }

  Future<void> openInBrowser(String url) {
    return launch(url, forceSafariVC: false, forceWebView: false);
  }

  Future<void> share(String url) {
    return Share.share(url);
  }

  Future<void> _loadStories(bool isRefreshing) async {
    try {
      // invalidate all cached items. possible to comment out this line and let it return cached item details if they were available
      _itemsService.invalidateCache();
      if (!isRefreshing) {
        isLoadingInitialStories = true;
      }
      var storyIds = await _itemsService.fetchItemIds(_storyFeedType);
      stories.clear();
      stories
          .addAll(storyIds.map((id) => _itemsService.fetchItem(id)).toList());
    } finally {
      if (!isRefreshing) {
        isLoadingInitialStories = false;
      }
    }
  }
}
