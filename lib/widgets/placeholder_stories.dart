import 'package:flutter/material.dart';
import 'placeholder_story.dart';

class PlaceholderStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => PlaceholderStory(),
    );
  }
}
