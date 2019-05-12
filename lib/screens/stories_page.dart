import 'package:flutter/material.dart';
import 'package:supnews/models/item.dart';
import 'package:supnews/stores/stories_store.dart';
import 'package:supnews/widgets/placeholder_story.dart';
import 'package:supnews/widgets/story.dart';

class StoriesPage<T extends StoriesStore> extends StatefulWidget {
  final T store;
  StoriesPage(this.store, {Key key}) : super(key: key);

  @override
  _StoriesPageState createState() => _StoriesPageState();
}

/// Notes: use of [AutomaticKeepAliveClientMixin] with the [wantKeepAlive] override will effectively allow Flutter to retain the page state, including the scroll position.
/// Without it, switching back and forth between tabs would cause the data to tab to be rebuilt, which in turn causes data to be fetched etc
class _StoriesPageState extends State<StoriesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: FutureBuilder(
        future: widget.store.loadInitialStories(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Could not load stories');
              }
              return RefreshIndicator(
                onRefresh: () async {
                  await widget.store.refresh();
                },
                child: ListView.builder(
                  itemCount: widget.store.stories.length,
                  itemBuilder: (context, index) => FutureBuilder(
                        future: widget.store.stories[index],
                        builder: (_, AsyncSnapshot<Item> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.done:
                              debugPrint('show $index');
                              if (snapshot.hasError) {
                                return Text('Could not load story');
                              }
                              return Story(widget.store, snapshot.data);

                            default:
                              debugPrint('hit $index');
                              return PlaceholderStory();
                          }
                        },
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
