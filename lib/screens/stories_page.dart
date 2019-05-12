import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:supnews/models/item.dart';
import 'package:supnews/stores/stories_store.dart';
import 'package:supnews/widgets/placeholder_story.dart';
import 'package:supnews/widgets/story.dart';

class StoriesPage<T extends StoriesStore> extends StatefulWidget {
  final T _store;
  StoriesPage(this._store, {Key key}) : super(key: key);

  @override
  _StoriesPageState createState() => _StoriesPageState(_store);
}

/// Notes: use of [AutomaticKeepAliveClientMixin] with the [wantKeepAlive] override will effectively allow Flutter to retain the page state, including the scroll position.
/// Without it, switching back and forth between tabs would cause the data to tab to be rebuilt, which in turn causes data to be fetched etc
class _StoriesPageState<T extends StoriesStore> extends State<StoriesPage>
    with AutomaticKeepAliveClientMixin {
  T store;
  _StoriesPageState(this.store);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: FutureBuilder(
        future: store.loadInitialStories(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Could not load stories: ${snapshot.error}');
              }
              return RefreshIndicator(
                onRefresh: () async {
                  await store.refresh();
                },
                child: Observer(
                  builder: (_) => ListView.builder(
                        itemCount: store.stories.length,
                        itemBuilder: (context, index) => FutureBuilder(
                              future: store.stories[index],
                              builder: (_, AsyncSnapshot<Item> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.done:
                                    debugPrint('show $index');
                                    if (snapshot.hasError) {
                                      return Text(
                                          'Could not load story ${snapshot.error}');
                                    }
                                    return Story(store, snapshot.data);

                                  default:
                                    debugPrint('hit $index');
                                    return PlaceholderStory();
                                }
                              },
                            ),
                      ),
                ),
              );

            default:
              return PlaceholderStory();
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
