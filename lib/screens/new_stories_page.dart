import 'package:flutter/foundation.dart';
import 'package:supnews/screens/stories_page.dart';
import 'package:supnews/stores/new_stories_store.dart';

class NewStoriesPage extends StoriesPage<NewStoriesStore> {
  NewStoriesPage(NewStoriesStore store, {Key key}) : super(store, key: key);
}
