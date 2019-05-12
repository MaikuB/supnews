import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:supnews/serializers.dart';

part 'item.g.dart';

abstract class Item implements Built<Item, ItemBuilder> {
  Item._();

  factory Item([updates(ItemBuilder b)]) = _$Item;

  String get by;

  int get id;

  BuiltList<int> get kids;

  int get score;

  int get time;

  String get type;

  @nullable
  int get descendants;

  @nullable
  bool get dead;

  @nullable
  int get parent;

  @nullable
  int get poll;

  @nullable
  String get title;

  @nullable
  String get url;

  String toJson() {
    return json.encode(serializers.serializeWith(Item.serializer, this));
  }

  static Item fromJson(String jsonString) {
    return serializers.deserializeWith(
        Item.serializer, json.decode(jsonString));
  }

  static Serializer<Item> get serializer => _$itemSerializer;
}
