import 'package:flutter/material.dart';

class PlaceholderContainer extends StatelessWidget {
  final Widget child;

  const PlaceholderContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey,
        child: child,
      );
}
