import 'package:flutter/material.dart';

class PlaceholderStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ListTile(
        title: Container(
          color: Colors.grey,
          child: Text(''),
        ),
      ),
    );
  }
}
