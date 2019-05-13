import 'package:flutter/foundation.dart';
import 'stories_page.dart';
import '../stores/top_stories_store.dart';

class TopStoriesPage extends StoriesPage<TopStoriesStore> {
  TopStoriesPage(TopStoriesStore store, {Key key}) : super(store, key: key);
}
