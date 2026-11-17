import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class TarotProvider extends ChangeNotifier {

String _baseUrl = 'tarostarot.com';

  TarotProvider() {
    print('Tarot Provider Inicializado');
    this.getOnDisplayTarot();
  }

  getOnDisplayTarot() async {
    print('getOnDisplayTarot');

    var url =
        Uri.https(_baseUrl, '/tarot-card-data/tarot-cards.json');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['cards'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
