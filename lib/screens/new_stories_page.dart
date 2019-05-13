import 'package:flutter/foundation.dart';
import '../screens/stories_page.dart';
import '../stores/new_stories_store.dart';

class NewStoriesPage extends StoriesPage<NewStoriesStore> {
  NewStoriesPage(NewStoriesStore store, {Key key}) : super(store, key: key);
}
