import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';
import '../stores/stories_store.dart';
import '../widgets/placeholder_stories.dart';
import '../widgets/placeholder_story.dart';
import '../widgets/story.dart';

class StoriesPage<T extends StoriesStore> extends StatefulWidget {
  final T store;
  StoriesPage(this.store, {Key key}) : super(key: key);

  @override
  _StoriesPageState createState() => _StoriesPageState();
}

/// Notes: use of [AutomaticKeepAliveClientMixin] with the [wantKeepAlive] override will effectively allow Flutter to retain the page state, including the scroll position.
/// Without it, switching back and forth between tabs would cause the data to tab to be rebuilt, which in turn causes data to be fetched etc
class _StoriesPageState<T extends StoriesStore> extends State<StoriesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.store.loadInitialStories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) {
        switch (widget.store.loadFeedItemsFuture.status) {
          case FutureStatus.pending:
            return PlaceholderStories();
          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Oops something went wrong'),
                  RaisedButton(
                    child: Text('Retry'),
                    onPressed: () {
                      widget.store.retry();
                    },
                  ),
                ],
              ),
            );
          case FutureStatus.fulfilled:
            return RefreshIndicator(
              child: IncrementallyLoadingListView(
                loadMore: () async {
                  await widget.store.loadNextPage();
                },
                hasMore: () => widget.store.hasNextPage,
                itemCount: () => widget.store.feedItems.length,
                itemBuilder: (context, index) {
                  if (index == widget.store.feedItems.length - 1 &&
                      widget.store.hasNextPage &&
                      !widget.store.loadingNextPage) {
                    return Column(
                      children: [
                        Story(widget.store.feedItems[index]),
                        PlaceholderStory(),
                      ],
                    );
                  }
                  return Story(widget.store.feedItems[index]);
                },
              ),
              onRefresh: () async {
                await widget.store.refresh();
              },
            );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
