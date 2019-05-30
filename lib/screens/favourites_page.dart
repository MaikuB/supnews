import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/favourites_store.dart';
import '../widgets/story.dart';

class FavouritesPage extends StatefulWidget {
  final FavouritesStore store;

  const FavouritesPage(
    this.store, {
    Key key,
  }) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.store.loadFavourites();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) {
        if (widget.store.hasFavourites) {
          return ListView.builder(
            itemCount: widget.store.favourites.length,
            itemBuilder: (context, index) {
              return Story(widget.store.favourites[index]);
            },
          );
        } else {
          return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.favorite), Text('No favourites here')]),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
