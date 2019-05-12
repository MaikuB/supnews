import 'package:flutter/material.dart';
import 'package:supnews/models/item.dart';
import 'package:supnews/stores/stories_store.dart';
import 'package:intl/intl.dart' show DateFormat;

class Story extends StatelessWidget {
  final Item item;
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
                    item.score.toString(),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(item.title,
                          style: Theme.of(context).textTheme.subhead),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        '${item.by} - ${DateFormat().format(
                          DateTime.fromMillisecondsSinceEpoch(item.time * 1000),
                        )}',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                    Text(
                      '${item.kids.length} ${item.kids.length == 1 ? 'comment' : 'comments'}',
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
