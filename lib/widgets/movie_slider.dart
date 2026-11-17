import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class TarotSlider extends StatelessWidget {
  final List<TarotCard> tarotCards;
  final String title;

  const TarotSlider({
    super.key,
    required this.tarotCards,
    this.title = 'Populars',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: tarotCards.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tarotCards.length,
                    itemBuilder: (_, int index) =>
                        _TarotPoster(tarotCard: tarotCards[index]),
                  ),
          )
        ],
      ),
    );
  }
}

class _TarotPoster extends StatelessWidget {
  final TarotCard tarotCard;

  const _TarotPoster({required this.tarotCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: tarotCard),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(tarotCard.image),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            tarotCard.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}