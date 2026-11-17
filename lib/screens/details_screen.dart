import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Canviar després per una instància de Peli
    final TarotCard tarotCard =
        ModalRoute.of(context)?.settings.arguments as TarotCard;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(tarotCard: tarotCard),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _CardAndTitle(tarotCard: tarotCard),
                _Overview(tarotCard: tarotCard),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final TarotCard tarotCard;

  const _CustomAppBar({Key? key, required this.tarotCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            tarotCard.name,
            style: TextStyle(fontSize: 16,color: Colors.white),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              tarotCard.image ?? 'https://placehold.co/500x300/png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _CardAndTitle extends StatelessWidget {
  final TarotCard tarotCard;

  const _CardAndTitle({Key? key, required this.tarotCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                  tarotCard.image ?? 'https://placehold.co/200x300/png'),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tarotCard.name,
                style: textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                tarotCard.arcana.name,
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const SizedBox(width: 5),
                  Text(tarotCard.element.name, style: textTheme.bodySmall),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final TarotCard tarotCard;

  const _Overview({Key? key, required this.tarotCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Title(color: Colors.black, child: Text('Upright')),
            Text(
              tarotCard.upright,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 15,),
            Title(color: Colors.black, child: Text('Reversed')),
            Text(
              tarotCard.reversed,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 15,),
          ],
        ));
  }
}
