import 'package:flutter/material.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'styles.dart';
import '../stores/stories_store.dart';

class Story extends StatelessWidget {
  final FeedItem item;
  final StoriesStore store;
  Story(this.store, this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
        child: Row(
          children: [
            Center(
              child: CircleAvatar(
                child: Center(
                  child: Text(
                    item.points.toString(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSpacer(
                      Text(item.title,
                          style: Theme.of(context).textTheme.subhead),
                    ),
                    TextSpacer(
                      Text(
                        '${item.user} - ${DateFormat().format(
                          DateTime.fromMillisecondsSinceEpoch(item.time * 1000),
                        )}',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                    Text(
                      '${item.commentsCount} ${item.commentsCount == 1 ? 'comment' : 'comments'}',
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () async {
        await store.open(item.url);
      },
      onLongPress: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) {
              return Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.open_in_browser),
                        title: new Text('Open in browser'),
                        onTap: () {
                          store.openInBrowser(item.url);
                        }),
                    if (item.url != null)
                      new ListTile(
                        leading: new Icon(Icons.share),
                        title: new Text('Share'),
                        onTap: () async {
                          await store.share(item.url);
                        },
                      ),
                  ],
                ),
              );
            });
      },
    );
  }
}
