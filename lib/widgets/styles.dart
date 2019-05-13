import 'package:flutter/material.dart';

class TextSpacer extends StatelessWidget {
  final Widget _child;

  const TextSpacer(this._child, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 4), child: _child);
}
