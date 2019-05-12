// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Item> _$itemSerializer = new _$ItemSerializer();

class _$ItemSerializer implements StructuredSerializer<Item> {
  @override
  final Iterable<Type> types = const [Item, _$Item];
  @override
  final String wireName = 'Item';

  @override
  Iterable serialize(Serializers serializers, Item object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'by',
      serializers.serialize(object.by, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'kids',
      serializers.serialize(object.kids,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'score',
      serializers.serialize(object.score, specifiedType: const FullType(int)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    if (object.descendants != null) {
      result
        ..add('descendants')
        ..add(serializers.serialize(object.descendants,
            specifiedType: const FullType(int)));
    }
    if (object.dead != null) {
      result
        ..add('dead')
        ..add(serializers.serialize(object.dead,
            specifiedType: const FullType(bool)));
    }
    if (object.parent != null) {
      result
        ..add('parent')
        ..add(serializers.serialize(object.parent,
            specifiedType: const FullType(int)));
    }
    if (object.poll != null) {
      result
        ..add('poll')
        ..add(serializers.serialize(object.poll,
            specifiedType: const FullType(int)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Item deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'by':
          result.by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'kids':
          result.kids.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'descendants':
          result.descendants = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'dead':
          result.dead = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'parent':
          result.parent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'poll':
          result.poll = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Item extends Item {
  @override
  final String by;
  @override
  final int id;
  @override
  final BuiltList<int> kids;
  @override
  final int score;
  @override
  final int time;
  @override
  final String type;
  @override
  final int descendants;
  @override
  final bool dead;
  @override
  final int parent;
  @override
  final int poll;
  @override
  final String title;
  @override
  final String url;

  factory _$Item([void Function(ItemBuilder) updates]) =>
      (new ItemBuilder()..update(updates)).build();

  _$Item._(
      {this.by,
      this.id,
      this.kids,
      this.score,
      this.time,
      this.type,
      this.descendants,
      this.dead,
      this.parent,
      this.poll,
      this.title,
      this.url})
      : super._() {
    if (by == null) {
      throw new BuiltValueNullFieldError('Item', 'by');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Item', 'id');
    }
    if (kids == null) {
      throw new BuiltValueNullFieldError('Item', 'kids');
    }
    if (score == null) {
      throw new BuiltValueNullFieldError('Item', 'score');
    }
    if (time == null) {
      throw new BuiltValueNullFieldError('Item', 'time');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Item', 'type');
    }
  }

  @override
  Item rebuild(void Function(ItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemBuilder toBuilder() => new ItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Item &&
        by == other.by &&
        id == other.id &&
        kids == other.kids &&
        score == other.score &&
        time == other.time &&
        type == other.type &&
        descendants == other.descendants &&
        dead == other.dead &&
        parent == other.parent &&
        poll == other.poll &&
        title == other.title &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, by.hashCode),
                                                id.hashCode),
                                            kids.hashCode),
                                        score.hashCode),
                                    time.hashCode),
                                type.hashCode),
                            descendants.hashCode),
                        dead.hashCode),
                    parent.hashCode),
                poll.hashCode),
            title.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Item')
          ..add('by', by)
          ..add('id', id)
          ..add('kids', kids)
          ..add('score', score)
          ..add('time', time)
          ..add('type', type)
          ..add('descendants', descendants)
          ..add('dead', dead)
          ..add('parent', parent)
          ..add('poll', poll)
          ..add('title', title)
          ..add('url', url))
        .toString();
  }
}

class ItemBuilder implements Builder<Item, ItemBuilder> {
  _$Item _$v;

  String _by;
  String get by => _$this._by;
  set by(String by) => _$this._by = by;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<int> _kids;
  ListBuilder<int> get kids => _$this._kids ??= new ListBuilder<int>();
  set kids(ListBuilder<int> kids) => _$this._kids = kids;

  int _score;
  int get score => _$this._score;
  set score(int score) => _$this._score = score;

  int _time;
  int get time => _$this._time;
  set time(int time) => _$this._time = time;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  int _descendants;
  int get descendants => _$this._descendants;
  set descendants(int descendants) => _$this._descendants = descendants;

  bool _dead;
  bool get dead => _$this._dead;
  set dead(bool dead) => _$this._dead = dead;

  int _parent;
  int get parent => _$this._parent;
  set parent(int parent) => _$this._parent = parent;

  int _poll;
  int get poll => _$this._poll;
  set poll(int poll) => _$this._poll = poll;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  ItemBuilder();

  ItemBuilder get _$this {
    if (_$v != null) {
      _by = _$v.by;
      _id = _$v.id;
      _kids = _$v.kids?.toBuilder();
      _score = _$v.score;
      _time = _$v.time;
      _type = _$v.type;
      _descendants = _$v.descendants;
      _dead = _$v.dead;
      _parent = _$v.parent;
      _poll = _$v.poll;
      _title = _$v.title;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Item other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Item;
  }

  @override
  void update(void Function(ItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Item build() {
    _$Item _$result;
    try {
      _$result = _$v ??
          new _$Item._(
              by: by,
              id: id,
              kids: kids.build(),
              score: score,
              time: time,
              type: type,
              descendants: descendants,
              dead: dead,
              parent: parent,
              poll: poll,
              title: title,
              url: url);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'kids';
        kids.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Item', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
