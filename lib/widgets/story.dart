import 'package:flutter/material.dart';
import 'package:supnews/models/item.dart';
import 'package:supnews/stores/stories_store.dart';

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
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Text(
                          item.by,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Text(
                        '${item.kids.length} comments',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
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
