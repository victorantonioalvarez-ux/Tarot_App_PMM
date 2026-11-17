

import 'models.dart';

class TarotCard {
    String id;
    String name;
    int number;
    Arcana arcana;
    Suit? suit;
    String? rank;
    List<String> keywords;
    String upright;
    String reversed;
    YesNo yesNo;
    Element element;
    Astrology astrology;
    String image;
    String url;

    TarotCard({
        required this.id,
        required this.name,
        required this.number,
        required this.arcana,
        required this.suit,
        required this.rank,
        required this.keywords,
        required this.upright,
        required this.reversed,
        required this.yesNo,
        required this.element,
        required this.astrology,
        required this.image,
        required this.url,
    });

    factory TarotCard.fromJson(String str) => TarotCard.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TarotCard.fromMap(Map<String, dynamic> json) => TarotCard(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        arcana: arcanaValues.map[json["arcana"]]!,
        suit: suitValues.map[json["suit"]],
        rank: json["rank"],
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        upright: json["upright"],
        reversed: json["reversed"],
        yesNo: YesNo.fromMap(json["yes_no"]),
        element: elementValues.map[json["element"]]!,
        astrology: Astrology.fromMap(json["astrology"]),
        image: json["image"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "number": number,
        "arcana": arcanaValues.reverse[arcana],
        "suit": suitValues.reverse[suit],
        "rank": rank,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "upright": upright,
        "reversed": reversed,
        "yes_no": yesNo.toMap(),
        "element": elementValues.reverse[element],
        "astrology": astrology.toMap(),
        "image": image,
        "url": url,
    };
}

enum Arcana {
    MAJOR,
    MINOR
}

final arcanaValues = EnumValues({
    "major": Arcana.MAJOR,
    "minor": Arcana.MINOR
});

class Astrology {
    String? planet;
    String? sign;
    int? decan;
    String? dates;
    String? elementalDignity;

    Astrology({
        required this.planet,
        required this.sign,
        required this.decan,
        required this.dates,
        required this.elementalDignity,
    });

    factory Astrology.fromJson(String str) => Astrology.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Astrology.fromMap(Map<String, dynamic> json) => Astrology(
        planet: json["planet"],
        sign: json["sign"],
        decan: json["decan"],
        dates: json["dates"],
        elementalDignity: json["elemental_dignity"],
    );

    Map<String, dynamic> toMap() => {
        "planet": planet,
        "sign": sign,
        "decan": decan,
        "dates": dates,
        "elemental_dignity": elementalDignity,
    };
}

enum Element {
    AIR,
    EARTH,
    FIRE,
    WATER
}

final elementValues = EnumValues({
    "air": Element.AIR,
    "earth": Element.EARTH,
    "fire": Element.FIRE,
    "water": Element.WATER
});

enum Suit {
    CUPS,
    PENTACLES,
    SWORDS,
    WANDS
}

final suitValues = EnumValues({
    "cups": Suit.CUPS,
    "pentacles": Suit.PENTACLES,
    "swords": Suit.SWORDS,
    "wands": Suit.WANDS
});

class YesNo {
    Reversed upright;
    Reversed reversed;
    String summary;

    YesNo({
        required this.upright,
        required this.reversed,
        required this.summary,
    });


    factory YesNo.fromMap(Map<String, dynamic> json) => YesNo(
        upright: reversedValues.map[json["upright"]]!,
        reversed: reversedValues.map[json["reversed"]]!,
        summary: json["summary"],
    );

    Map<String, dynamic> toMap() => {
        "upright": reversedValues.reverse[upright],
        "reversed": reversedValues.reverse[reversed],
        "summary": summary,
    };
}

enum Reversed {
    NO,
    YES
}

final reversedValues = EnumValues({
    "no": Reversed.NO,
    "yes": Reversed.YES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
