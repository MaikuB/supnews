import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/settings_store.dart';

class SettingsPage extends StatefulWidget {
  final SettingsStore store;

  SettingsPage(this.store, {Key key}) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        Observer(
          builder: (_) => Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: SwitchListTile(
                  title: Text('Dark mode'),
                  subtitle: Text(
                      'Note: this won\'t affect the articles that are displayed'),
                  value: widget.store.useDarkMode,
                  onChanged: (bool value) {
                    widget.store.setDarkMode(value);
                  },
                ),
              ),
        ),
        Observer(
          builder: (_) => SwitchListTile(
                title: Text('Display stories within app'),
                subtitle: Text(
                    'Controls the default behaviour when tapping on a story to read'),
                value: widget.store.openInApp,
                onChanged: (bool value) {
                  widget.store.setOpenInApp(value);
                },
              ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
