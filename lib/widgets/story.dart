import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import '../services/story_service.dart';
import '../services/sharing_service.dart';
import '../stores/favourites_store.dart';

import 'styles.dart';

class Story extends StatelessWidget {
  final FeedItem _item;
  Story(this._item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storyService = Provider.of<StoryService>(context);
    final sharingService = Provider.of<SharingService>(context);
    final favouritesStore = Provider.of<FavouritesStore>(context);
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
        child: Row(
          children: [
            Center(
              child: CircleAvatar(
                child: Center(
                  child: Text(
                    _item.points.toString(),
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
                      Text(_item.title,
                          style: Theme.of(context).textTheme.subhead),
                    ),
                    TextSpacer(
                      Text(
                        _item.url,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                    TextSpacer(
                      Text(
                        '${_item.user} - ${DateFormat().format(
                          DateTime.fromMillisecondsSinceEpoch(
                              _item.time * 1000),
                        )}',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                    Text(
                      '${_item.commentsCount} ${_item.commentsCount == 1 ? 'comment' : 'comments'}',
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
        await storyService.open(_item.url);
      },
      onLongPress: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) {
              return Observer(
                builder: (_) => Container(
                      child: new Wrap(
                        children: <Widget>[
                          new ListTile(
                            leading: new Icon(Icons.favorite),
                            title: new Text(
                                favouritesStore.isInFavourites(_item)
                                    ? 'Remove from favourites'
                                    : 'Add to favourites'),
                            onTap: () {
                              favouritesStore.isInFavourites(_item)
                                  ? favouritesStore.removeFavourite(_item)
                                  : favouritesStore.addFavourite(_item);
                              Navigator.of(context).pop();
                            },
                          ),
                          new ListTile(
                            leading: new Icon(Icons.open_in_browser),
                            title: new Text('Open in browser'),
                            onTap: () async {
                              await storyService.openInBrowser(_item.url);
                              Navigator.of(context).pop();
                            },
                          ),
                          if (_item.url != null)
                            new ListTile(
                              leading: new Icon(Icons.share),
                              title: new Text('Share'),
                              onTap: () async {
                                await sharingService.share(_item.url);
                                Navigator.of(context).pop();
                              },
                            ),
                        ],
                      ),
                    ),
              );
            });
      },
    );
  }
}
