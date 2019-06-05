import 'package:async/async.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/enums.dart';
import '../services/preferences_service.dart';

part 'stories_store.g.dart';

class StoriesStore = StoriesStoreBase with _$StoriesStore;

abstract class StoriesStoreBase implements Store {
  final StoryFeedType _storyFeedType;
  final HnpwaClient _hnpwaClient;
  final PreferencesService _preferencesService;
  final AsyncMemoizer _asyncMemoizer = AsyncMemoizer();

  int _currentPage = 1;
  bool _isLoadingNextPage = false;

  @observable
  bool hasNextPage = false;

  @observable
  ObservableList<FeedItem> feedItems = ObservableList<FeedItem>();

  @observable
  ObservableFuture loadFeedItemsFuture;

  @observable
  bool loadingNextPage = false;

  StoriesStoreBase(
      this._storyFeedType, this._hnpwaClient, this._preferencesService);

  @action
  Future<void> refresh() {
    return _loadFirstPageStories();
  }

  @action
  void retry() {
    loadFeedItemsFuture = ObservableFuture(_loadFirstPageStories());
  }

  @action
  void loadInitialStories() {
    loadFeedItemsFuture = ObservableFuture(_asyncMemoizer.runOnce(() async {
      await _loadFirstPageStories();
    }));
  }

  Future<void> open(String url) async {
    final defaultOpenInAppPreference = _preferencesService.openInApp;
    return launch(url,
        forceSafariVC: defaultOpenInAppPreference,
        forceWebView: defaultOpenInAppPreference);
  }

  @action
  Future<void> loadNextPage() async {
    try {
      if (_isLoadingNextPage || (_currentPage > 1 && !hasNextPage)) {
        return;
      }
      _isLoadingNextPage = true;
      var feed = _storyFeedType == StoryFeedType.Top
          ? (await _hnpwaClient.news(page: _currentPage))
          : (await _hnpwaClient.newest(page: _currentPage));
      // some items from the official API don't have a URL but the HNPWA API will put "item?={id}" as the URL so need to filter those out
      feedItems.addAll(feed.items.where((fi) {
        var uri = Uri.tryParse(fi.url);
        return uri != null && uri.hasScheme;
      }));
      hasNextPage = feed.hasNextPage;
      _currentPage++;
    } finally {
      _isLoadingNextPage = false;
    }
  }

  @action
  Future<void> _loadFirstPageStories() async {
    feedItems.clear();
    _currentPage = 1;
    await loadNextPage();
  }
}
