import 'package:flutter/material.dart';

import 'placeholder_container.dart';
import 'styles.dart';

class PlaceholderStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      child: Row(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Center(
                child: Text(
                  '',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextSpacer(
                    PlaceholderContainer(
                      child: Text(
                        '',
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                  ),
                  TextSpacer(
                    PlaceholderContainer(
                      child: Text(
                        '',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                  ),
                  PlaceholderContainer(
                    child:
                        Text('', style: Theme.of(context).textTheme.subtitle),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
