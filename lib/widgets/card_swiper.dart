import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart'; 

class CardSwiper extends StatelessWidget {

  final List<TarotCard> tarotCards;

  const CardSwiper({super.key, required this.tarotCards});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
        height: size.height * 0.5,
        // color: Colors.red,
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (BuildContext context, int index) {
            final tarotCard = tarotCards[index];
            //print(tarotCard.image);
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'detalls peli'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(tarotCard.image),
                    fit: BoxFit.cover),
              ),
            );
          },
        ));
  }
}
