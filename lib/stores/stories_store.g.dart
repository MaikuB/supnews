// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoriesStore on StoriesStoreBase, Store {
  final _$hasNextPageAtom = Atom(name: 'StoriesStoreBase.hasNextPage');

  @override
  bool get hasNextPage {
    _$hasNextPageAtom.reportRead();
    return super.hasNextPage;
  }

  @override
  set hasNextPage(bool value) {
    _$hasNextPageAtom.reportWrite(value, super.hasNextPage, () {
      super.hasNextPage = value;
    });
  }

  final _$feedItemsAtom = Atom(name: 'StoriesStoreBase.feedItems');

  @override
  ObservableList<FeedItem> get feedItems {
    _$feedItemsAtom.reportRead();
    return super.feedItems;
  }

  @override
  set feedItems(ObservableList<FeedItem> value) {
    _$feedItemsAtom.reportWrite(value, super.feedItems, () {
      super.feedItems = value;
    });
  }

  final _$loadFeedItemsFutureAtom =
      Atom(name: 'StoriesStoreBase.loadFeedItemsFuture');

  @override
  ObservableFuture<dynamic> get loadFeedItemsFuture {
    _$loadFeedItemsFutureAtom.reportRead();
    return super.loadFeedItemsFuture;
  }

  @override
  set loadFeedItemsFuture(ObservableFuture<dynamic> value) {
    _$loadFeedItemsFutureAtom.reportWrite(value, super.loadFeedItemsFuture, () {
      super.loadFeedItemsFuture = value;
    });
  }

  final _$loadingNextPageAtom = Atom(name: 'StoriesStoreBase.loadingNextPage');

  @override
  bool get loadingNextPage {
    _$loadingNextPageAtom.reportRead();
    return super.loadingNextPage;
  }

  @override
  set loadingNextPage(bool value) {
    _$loadingNextPageAtom.reportWrite(value, super.loadingNextPage, () {
      super.loadingNextPage = value;
    });
  }

  final _$loadNextPageAsyncAction =
      AsyncAction('StoriesStoreBase.loadNextPage');

  @override
  Future<void> loadNextPage() {
    return _$loadNextPageAsyncAction.run(() => super.loadNextPage());
  }

  final _$_loadFirstPageStoriesAsyncAction =
      AsyncAction('StoriesStoreBase._loadFirstPageStories');

  @override
  Future<void> _loadFirstPageStories() {
    return _$_loadFirstPageStoriesAsyncAction
        .run(() => super._loadFirstPageStories());
  }

  final _$StoriesStoreBaseActionController =
      ActionController(name: 'StoriesStoreBase');

  @override
  Future<void> refresh() {
    final _$actionInfo = _$StoriesStoreBaseActionController.startAction(
        name: 'StoriesStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$StoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> retry() {
    final _$actionInfo = _$StoriesStoreBaseActionController.startAction(
        name: 'StoriesStoreBase.retry');
    try {
      return super.retry();
    } finally {
      _$StoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> loadInitialStories() {
    final _$actionInfo = _$StoriesStoreBaseActionController.startAction(
        name: 'StoriesStoreBase.loadInitialStories');
    try {
      return super.loadInitialStories();
    } finally {
      _$StoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasNextPage: ${hasNextPage},
feedItems: ${feedItems},
loadFeedItemsFuture: ${loadFeedItemsFuture},
loadingNextPage: ${loadingNextPage}
    ''';
  }
}
