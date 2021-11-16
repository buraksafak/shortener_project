import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shortly_project/model/url_shortner_model.dart';

class UrlShortnerState with ChangeNotifier {
  final urlController = TextEditingController();
  String shortUrlMessage = "";

  handleGetLinkButton() async {
    final longUrl = urlController.text;
    final String shortUrl = await getShortLink(longUrl);
    shortUrlMessage = shortUrl;
    notifyListeners();
  }
  Future<String> getShortLink(String longUrl) async {
    var uri = Uri.parse(
        "https://api.shrtco.de/v2/shorten?url=example.org/very/long/link.html");
    final result = await http.post(uri, body: {"url": longUrl});

    if (result.statusCode == 201) {
      debugPrint('Succesfully completed');
      final response = urlShortnerResponseFromJson(result.body);
      // debugPrint(response.result.fullShortLink);
      return response.result.fullShortLink;
    } else {
      debugPrint("Error in http api Code: " + result.statusCode.toString());
      return "";
    }
  }
}
