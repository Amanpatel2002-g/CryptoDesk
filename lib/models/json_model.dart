// To parse this JSON data, do
//
//     final jsonmodel = jsonmodelFromJson(jsonString);

import 'dart:convert';

Jsonmodel jsonmodelFromJson(String str) => Jsonmodel.fromJson(json.decode(str));

String jsonmodelToJson(Jsonmodel data) => json.encode(data.toJson());

class Jsonmodel {
  Jsonmodel({
    required this.restarants,
  });

  List<Restarant>restarants;

  factory Jsonmodel.fromJson(Map<String, dynamic> json) => Jsonmodel(
        restarants: List<Restarant>.from(
            json["restarants"].map((x) => Restarant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restarants": List<dynamic>.from(restarants.map((x) => x.toJson())),
      };
}

class Restarant {
  Restarant({
    required this.url,
    required this.id,
    required this.address,
    required this.addressLine2,
    required this.name,
    required this.outcode,
    required this.postcode,
    required this.rating,
    required this.typeOfFood,
  });

  String url;
  Id id;
  dynamic address;
  String addressLine2;
  String name;
  String outcode;
  String postcode;
  dynamic rating;
  String typeOfFood;

  factory Restarant.fromJson(Map<String, dynamic> json) => Restarant(
        url: json["URL"],
        id: Id.fromJson(json["_id"]),
        address: json["address"],
        addressLine2: json["address line 2"] ?? "nothing to show",
        name: json["name"] ?? "no name available",
        outcode: json["outcode"] ?? "no outcode available",
        postcode: json["postcode"] ?? "no postcode available",
        rating: json["rating"],
        typeOfFood: json["type_of_food"] ?? "no information available",
      );

  Map<String, dynamic> toJson() => {
        "URL": url,
        "_id": id.toJson(),
        "address": address,
        "address line 2": addressLine2 ?? "nothing to show",
        "name": name ?? "no name available",
        "outcode": outcode ?? "no outcode available",
        "postcode": postcode ?? "no postcode available",
        "rating": rating,
        "type_of_food": typeOfFood ?? "no information available",
      };
}

class Id {
  Id({
    required this.oid,
  });

  String oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

enum RatingEnum { NOT_YET_RATED }

final ratingEnumValues =
    EnumValues({"Not yet rated": RatingEnum.NOT_YET_RATED});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
