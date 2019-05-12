// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$StoriesStore on StoriesStoreBase, Store {
  final _$isLoadingInitialStoriesAtom =
      Atom(name: 'StoriesStoreBase.isLoadingInitialStories');

  @override
  bool get isLoadingInitialStories {
    _$isLoadingInitialStoriesAtom.reportObserved();
    return super.isLoadingInitialStories;
  }

  @override
  set isLoadingInitialStories(bool value) {
    _$isLoadingInitialStoriesAtom.context
        .checkIfStateModificationsAreAllowed(_$isLoadingInitialStoriesAtom);
    super.isLoadingInitialStories = value;
    _$isLoadingInitialStoriesAtom.reportChanged();
  }

  final _$storiesAtom = Atom(name: 'StoriesStoreBase.stories');

  @override
  ObservableList<Future<Item>> get stories {
    _$storiesAtom.reportObserved();
    return super.stories;
  }

  @override
  set stories(ObservableList<Future<Item>> value) {
    _$storiesAtom.context.checkIfStateModificationsAreAllowed(_$storiesAtom);
    super.stories = value;
    _$storiesAtom.reportChanged();
  }

  final _$loadInitialStoriesAsyncAction = AsyncAction('loadInitialStories');

  @override
  Future<void> loadInitialStories() {
    return _$loadInitialStoriesAsyncAction
        .run(() => super.loadInitialStories());
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
}
