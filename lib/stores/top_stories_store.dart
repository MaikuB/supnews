import 'package:supnews/models/enums.dart';
import 'package:supnews/services/items_service.dart';
import 'package:supnews/services/preferences_service.dart';
import 'package:supnews/stores/stories_store.dart';

class TopStoriesStore extends StoriesStore {
  TopStoriesStore(
      ItemsService itemsService, PreferencesService preferencesService)
      : super(StoryFeedType.Top, itemsService, preferencesService);
}
