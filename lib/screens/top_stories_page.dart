import 'package:flutter/foundation.dart';
import 'package:supnews/screens/stories_page.dart';
import 'package:supnews/stores/top_stories_store.dart';

class TopStoriesPage extends StoriesPage<TopStoriesStore> {
  TopStoriesPage(TopStoriesStore store, {Key key}) : super(store, key: key);
}
