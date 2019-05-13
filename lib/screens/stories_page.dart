import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/stories_store.dart';
import '../widgets/placeholder_stories.dart';
import '../widgets/placeholder_story.dart';
import '../widgets/story.dart';

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
                return Center(
                  child: Column(
                    children: [
                      Text('Oops something went wrong'),
                      RaisedButton(
                        child: Text('Retry'),
                        onPressed: () async {
                          await store.refresh();
                        },
                      ),
                    ],
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  await store.refresh();
                },
                child: Observer(
                  builder: (_) => NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification.metrics.pixels ==
                              scrollNotification.metrics.maxScrollExtent) {
                            store.loadNextPage();
                          }
                        },
                        child: ListView.builder(
                            itemCount: store.feedItems.length,
                            itemBuilder: (context, index) {
                              if (index == store.feedItems.length - 1 &&
                                  store.hasNextPage &&
                                  !store.loadingNextPage) {
                                store.loadNextPage();
                                return Column(
                                  children: [
                                    Story(store, store.feedItems[index]),
                                    PlaceholderStory(),
                                  ],
                                );
                              }
                              return Story(store, store.feedItems[index]);
                            }),
                      ),
                ),
              );

            default:
              return PlaceholderStories();
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
