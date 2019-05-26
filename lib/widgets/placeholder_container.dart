import 'package:flutter/material.dart';

class PlaceholderContainer extends AnimatedWidget {
  final Widget child;

  const PlaceholderContainer(
      {Key key, @required Animation<double> animation, @required this.child})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: animation.value < 0.9
              ? [animation.value, animation.value + 0.1, animation.value + 0.2]
              : [0.0, animation.value],
          colors: animation.value < 0.9
              ? [Colors.grey, Colors.grey.shade200, Colors.grey]
              : [Colors.grey, Colors.grey.shade200],
        ),
      ),
      child: child,
    );
  }
}
