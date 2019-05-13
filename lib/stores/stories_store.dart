import 'package:async/async.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
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

  @observable
  bool hasNextPage = false;

  @observable
  bool _isLoadingNextPage = false;

  @observable
  ObservableList<FeedItem> feedItems = ObservableList<FeedItem>();

  StoriesStoreBase(
      this._storyFeedType, this._hnpwaClient, this._preferencesService);

  @action
  Future<void> refresh() async {
    return _loadStories();
  }

  @action
  Future<void> loadInitialStories() {
    return _asyncMemoizer.runOnce(() async {
      await _loadStories();
    });
  }

  Future<void> open(String url) async {
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

  @action
  Future<void> loadNextPage() async {
    try {
      if (_isLoadingNextPage) {
        return;
      }
      _isLoadingNextPage = true;
      var feed = _storyFeedType == StoryFeedType.Top
          ? (await _hnpwaClient.news(page: _currentPage))
          : (await _hnpwaClient.newest(page: _currentPage));
      feedItems.addAll(feed.items);
      hasNextPage = feed.hasNextPage;
      _currentPage++;
    } finally {
      _isLoadingNextPage = false;
    }
  }

  @observable
  bool loadingNextPage = false;

  @action
  Future<void> _loadStories() async {
    feedItems.clear();
    await loadNextPage();
  }
}
