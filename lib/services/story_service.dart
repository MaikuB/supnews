import 'package:url_launcher/url_launcher.dart';
import '../services/preferences_service.dart';

class StoryService {
  final PreferencesService _preferencesService;

  StoryService(this._preferencesService);

  Future<void> openInBrowser(String url) {
    return launch(url, forceSafariVC: false, forceWebView: false);
  }

  Future<void> open(String url) async {
    final defaultOpenInAppPreference = _preferencesService.openInApp;
    return launch(url,
        forceSafariVC: defaultOpenInAppPreference,
        forceWebView: defaultOpenInAppPreference);
  }
}
