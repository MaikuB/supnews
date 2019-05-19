// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$StoriesStore on StoriesStoreBase, Store {
  final _$hasNextPageAtom = Atom(name: 'StoriesStoreBase.hasNextPage');

  @override
  bool get hasNextPage {
    _$hasNextPageAtom.reportObserved();
    return super.hasNextPage;
  }

  @override
  set hasNextPage(bool value) {
    _$hasNextPageAtom.context
        .checkIfStateModificationsAreAllowed(_$hasNextPageAtom);
    super.hasNextPage = value;
    _$hasNextPageAtom.reportChanged();
  }

  final _$_isLoadingNextPageAtom =
      Atom(name: 'StoriesStoreBase._isLoadingNextPage');

  @override
  bool get _isLoadingNextPage {
    _$_isLoadingNextPageAtom.reportObserved();
    return super._isLoadingNextPage;
  }

  @override
  set _isLoadingNextPage(bool value) {
    _$_isLoadingNextPageAtom.context
        .checkIfStateModificationsAreAllowed(_$_isLoadingNextPageAtom);
    super._isLoadingNextPage = value;
    _$_isLoadingNextPageAtom.reportChanged();
  }

  final _$feedItemsAtom = Atom(name: 'StoriesStoreBase.feedItems');

  @override
  ObservableList<FeedItem> get feedItems {
    _$feedItemsAtom.reportObserved();
    return super.feedItems;
  }

  @override
  set feedItems(ObservableList<FeedItem> value) {
    _$feedItemsAtom.context
        .checkIfStateModificationsAreAllowed(_$feedItemsAtom);
    super.feedItems = value;
    _$feedItemsAtom.reportChanged();
  }

  final _$loadFeedItemsFutureAtom =
      Atom(name: 'StoriesStoreBase.loadFeedItemsFuture');

  @override
  ObservableFuture get loadFeedItemsFuture {
    _$loadFeedItemsFutureAtom.reportObserved();
    return super.loadFeedItemsFuture;
  }

  @override
  set loadFeedItemsFuture(ObservableFuture value) {
    _$loadFeedItemsFutureAtom.context
        .checkIfStateModificationsAreAllowed(_$loadFeedItemsFutureAtom);
    super.loadFeedItemsFuture = value;
    _$loadFeedItemsFutureAtom.reportChanged();
  }

  final _$loadingNextPageAtom = Atom(name: 'StoriesStoreBase.loadingNextPage');

  @override
  bool get loadingNextPage {
    _$loadingNextPageAtom.reportObserved();
    return super.loadingNextPage;
  }

  @override
  set loadingNextPage(bool value) {
    _$loadingNextPageAtom.context
        .checkIfStateModificationsAreAllowed(_$loadingNextPageAtom);
    super.loadingNextPage = value;
    _$loadingNextPageAtom.reportChanged();
  }

  final _$loadNextPageAsyncAction = AsyncAction('loadNextPage');

  @override
  Future<void> loadNextPage() {
    return _$loadNextPageAsyncAction.run(() => super.loadNextPage());
  }

  final _$StoriesStoreBaseActionController =
      ActionController(name: 'StoriesStoreBase');

  @override
  Future<void> refresh() {
    final _$actionInfo = _$StoriesStoreBaseActionController.startAction();
    try {
      return super.refresh();
    } finally {
      _$StoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void retry() {
    final _$actionInfo = _$StoriesStoreBaseActionController.startAction();
    try {
      return super.retry();
    } finally {
      _$StoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
