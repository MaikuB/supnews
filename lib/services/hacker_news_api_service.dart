import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supnews/models/enums.dart';
import 'package:supnews/models/item.dart';

class HackerNewsApiService {
  final String _baseUrl = 'https://hacker-news.firebaseio.com/v0/';

  Future<Item> fetchItem(int id) async {
    var response = await http.get('$_baseUrl/item/$id.json');
    if (response.statusCode == 200) {
      return Item.fromJson(response.body);
    }
    throw Exception('Could not fetch story');
  }

  Future<List<int>> fetchItemIds(StoryFeedType storyFeedType) async {
    var response = await http.get(
        '$_baseUrl/${(storyFeedType == StoryFeedType.New ? 'newstories.json' : 'topstories.json')}');
    if (response.statusCode == 200) {
      var decodeResult = json.decode(response.body);
      return List<int>.from(decodeResult);
    }
    throw Exception('Could not fetch stories');
  }
}
