import 'package:flutter/material.dart';
import 'package:flutter_shortener/bitly_shortener.dart';
import '../DBHelper/dbhelper.dart';
import '../models/url.dart';

class HomePageWidget extends ChangeNotifier {
  final urlController = TextEditingController();
  List<Url> _keys = [];
  List<Url> get keys {
    return [..._keys];
  }

  String shortUrlMessage = "Give some long url to convert";

  Future<String?>? handleGetLinkButton() async {
    final lUrl = urlController.text;
    final shortener = BitLyShortener(
      accessToken: "7216baddd4f179b77920ca352cb8031efee64c6a",
    );
    final result = await shortener.generateShortLink(longUrl: lUrl);
    shortUrlMessage = "${result.link}";

    notifyListeners();
    DBHelper.insert('link_dbase', {'key': shortener.accessToken});
  }

  Future<void> fetchAndSetUrl() async {
    final dataList = await DBHelper.getData('link_dbase');
    _keys = dataList
        .map(
          (i) => Url(key: i['key']),
        )
        .toList();
  }
}
