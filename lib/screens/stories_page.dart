import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
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
    /*_streamSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Offline')));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Online')));
      }
    });*/
    /*_disposeConnectivityReaction = autorun((_) {
      if (!mounted) {
        return;
      }
      if (widget.store.connectivityChanged.value == ConnectivityResult.none) {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Offline')));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Online')));
      }
    });*/
    widget.store.loadInitialStories();
  }

  @override
  void dispose() {
    //_streamSubscription.cancel();
    super.dispose();
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
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification.metrics.pixels ==
                    scrollNotification.metrics.maxScrollExtent) {
                  widget.store.loadNextPage();
                }
              },
              child: ListView.builder(
                itemCount: widget.store.feedItems.length,
                itemBuilder: (context, index) {
                  if (index == widget.store.feedItems.length - 1 &&
                      widget.store.hasNextPage &&
                      !widget.store.loadingNextPage) {
                    return Column(
                      children: [
                        Story(widget.store, widget.store.feedItems[index]),
                        PlaceholderStory(),
                      ],
                    );
                  }
                  return Story(widget.store, widget.store.feedItems[index]);
                },
              ),
            );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
