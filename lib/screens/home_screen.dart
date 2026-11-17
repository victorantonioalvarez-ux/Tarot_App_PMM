import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/provider/tarot_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tarotProvider = Provider.of<TarotProvider>(context);

    //print(tarotProvider.onDisplayTarot);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarot Cards'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(tarotCards: tarotProvider.onDisplayTarot),

              // Slider de pel·licules
              TarotSlider(
                  tarotCards: tarotProvider.majorArcana,
                  title: 'Major arcana'),
              // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
              TarotSlider(
                  tarotCards: tarotProvider.minorArcana,
                  title: 'Minor arcana'),
              TarotSlider(
                  tarotCards: tarotProvider.cups,
                  title: 'Cups'),
              TarotSlider(
                  tarotCards: tarotProvider.swords,
                  title: 'Swords'),
              TarotSlider(
                  tarotCards: tarotProvider.pentacles,
                  title: 'Pentacles'),
              TarotSlider(
                  tarotCards: tarotProvider.wands,
                  title: 'Wands'),
            ],
          ),
        ),
      ),
    );
  }
}
