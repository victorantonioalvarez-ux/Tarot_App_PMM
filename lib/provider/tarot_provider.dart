import 'package:flutter/material.dart';

class TarotProvider extends ChangeNotifier {
  TarotProvider(){
    print('Tarot Provider Inicializado');
    this.getOnDisplayTarot();
  }

  getOnDisplayTarot() async{
    print('getOnDisplayTarot');
  }
}