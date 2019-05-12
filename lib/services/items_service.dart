import 'package:async/async.dart';
import 'package:supnews/models/enums.dart';
import 'package:supnews/models/item.dart';
import 'package:supnews/services/hacker_news_api_service.dart';

/// For managing items retrieved from Hacker News API.
/// Implements basic caching that will return a cached item if available or goes to fetch it
class ItemsService {
  final Map<int, AsyncCache<Item>> _cachedItems = Map<int, AsyncCache<Item>>();
  final HackerNewsApiService _hackerNewsApiService = HackerNewsApiService();

  Future<Item> fetchItem(int id) {
    if (!_cachedItems.containsKey(id)) {
      _cachedItems[id] = AsyncCache<Item>(const Duration(hours: 1));
    }
    return _cachedItems[id].fetch(() => _hackerNewsApiService.fetchItem(id));
  }

  Future<List<int>> fetchItemIds(StoryFeedType storyFeedType) {
    return _hackerNewsApiService.fetchItemIds(storyFeedType);
  }

  void invalidateCache() {
    _cachedItems.values?.forEach((c) => c?.invalidate());
  }
}
