import 'models.dart';

class TarotResponse {
    String title;
    String version;
    DateTime updated;
    String source;
    String license;
    String licenseUrl;
    String attribution;
    String images;
    List<TarotCard> cards;

    TarotResponse({
        required this.title,
        required this.version,
        required this.updated,
        required this.source,
        required this.license,
        required this.licenseUrl,
        required this.attribution,
        required this.images,
        required this.cards,
    });

    factory TarotResponse.fromJson(String str) => TarotResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TarotResponse.fromMap(Map<String, dynamic> json) => TarotResponse(
        title: json["title"],
        version: json["version"],
        updated: DateTime.parse(json["updated"]),
        source: json["source"],
        license: json["license"],
        licenseUrl: json["license_url"],
        attribution: json["attribution"],
        images: json["images"],
        cards: List<TarotCard>.from(json["cards"].map((x) => TarotCard.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "version": version,
        "updated": "${updated.year.toString().padLeft(4, '0')}-${updated.month.toString().padLeft(2, '0')}-${updated.day.toString().padLeft(2, '0')}",
        "source": source,
        "license": license,
        "license_url": licenseUrl,
        "attribution": attribution,
        "images": images,
        "cards": List<dynamic>.from(cards.map((x) => x.toMap())),
    };
}