import 'package:hnpwa_client/hnpwa_client.dart';
import '../common/enums.dart';
import '../services/preferences_service.dart';
import 'stories_store.dart';

class TopStoriesStore extends StoriesStore {
  TopStoriesStore(
      HnpwaClient hnpwaClient, PreferencesService preferencesService)
      : super(StoryFeedType.Top, hnpwaClient, preferencesService);
}
