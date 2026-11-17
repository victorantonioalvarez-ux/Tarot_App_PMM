import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class TarotProvider extends ChangeNotifier {
  String _baseUrl = 'tarostarot.com';

  List<TarotCard> onDisplayTarot = [];

  List<TarotCard> get majorArcana =>
      onDisplayTarot.where((c) => c.arcana == Arcana.MAJOR).toList();

  List<TarotCard> get minorArcana =>
      onDisplayTarot.where((c) => c.arcana == Arcana.MINOR).toList();

  List<TarotCard> get cups =>
      onDisplayTarot.where((c) => c.suit == Suit.CUPS).toList();

  List<TarotCard> get pentacles =>
      onDisplayTarot.where((c) => c.suit == Suit.PENTACLES).toList();

  List<TarotCard> get swords =>
      onDisplayTarot.where((c) => c.suit == Suit.SWORDS).toList();

  List<TarotCard> get wands =>
      onDisplayTarot.where((c) => c.suit == Suit.WANDS).toList();

  TarotProvider() {
    print('Tarot Provider Inicializado');
    this.getOnDisplayTarot();
  }

  getOnDisplayTarot() async {
    print('getOnDisplayTarot');

    var url = Uri.https(_baseUrl, '/tarot-card-data/tarot-cards.json');

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final tarotResponse = TarotResponse.fromJson(result.body);

    onDisplayTarot = tarotResponse.cards;

    notifyListeners();
  }
}
