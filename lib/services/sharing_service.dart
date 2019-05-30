import 'package:share/share.dart';

class SharingService {
  Future<void> share(String url) {
    return Share.share(url);
  }
}
