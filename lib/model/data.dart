// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.news,
    this.terrain,
    this.user,
  });

  News news;
  Map<String, Terrain> terrain;
  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    news: News.fromJson(json["News"]),
    terrain: Map.from(json["Terrain"]).map((k, v) => MapEntry<String, Terrain>(k, Terrain.fromJson(v))),
    user: User.fromJson(json["User"]),
  );

  Map<String, dynamic> toJson() => {
    "News": news.toJson(),
    "Terrain": Map.from(terrain).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "User": user.toJson(),
  };
}

class News {
  News({
    this.one,
    this.two,
  });

  TwoClass one;
  TwoClass two;

  factory News.fromJson(Map<String, dynamic> json) => News(
    one: TwoClass.fromJson(json["one"]),
    two: TwoClass.fromJson(json["two"]),
  );

  Map<String, dynamic> toJson() => {
    "one": one.toJson(),
    "two": two.toJson(),
  };
}

class TwoClass {
  TwoClass({
    this.auteur,
    this.contenu,
    this.date,
    this.id,
    this.titre,
  });

  String auteur;
  String contenu;
  DateTime date;
  int id;
  String titre;

  factory TwoClass.fromJson(Map<String, dynamic> json) => TwoClass(
    auteur: json["auteur"],
    contenu: json["contenu"],
    date: DateTime.parse(json["date"]),
    id: json["id"],
    titre: json["titre"],
  );

  Map<String, dynamic> toJson() => {
    "auteur": auteur,
    "contenu": contenu,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "id": id,
    "titre": titre,
  };
}

class Terrain {
  Terrain({
    this.adresse,
    this.cp,
    this.description,
    this.etat,
    this.id,
    this.img,
    this.latitude,
    this.longitude,
    this.nom,
    this.ville,
  });

  String adresse;
  int cp;
  String description;
  int etat;
  int id;
  String img;
  double latitude;
  double longitude;
  String nom;
  Ville ville;

  factory Terrain.fromJson(Map<String, dynamic> json) => Terrain(
    adresse: json["adresse"],
    cp: json["cp"],
    description: json["description"],
    etat: json["etat"],
    id: json["id"],
    img: json["img"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    nom: json["nom"],
    ville: villeValues.map[json["ville"]],
  );

  Map<String, dynamic> toJson() => {
    "adresse": adresse,
    "cp": cp,
    "description": description,
    "etat": etat,
    "id": id,
    "img": img,
    "latitude": latitude,
    "longitude": longitude,
    "nom": nom,
    "ville": villeValues.reverse[ville],
  };
}

enum Ville { RENNES, VERN_SUR_SEICHE, IUGHVBJ }

final villeValues = EnumValues({
  "iughvbj": Ville.IUGHVBJ,
  "Rennes": Ville.RENNES,
  "Vern sur seiche": Ville.VERN_SUR_SEICHE
});

class User {
  User({
    this.one,
  });

  UserOne one;

  factory User.fromJson(Map<String, dynamic> json) => User(
    one: UserOne.fromJson(json["one"]),
  );

  Map<String, dynamic> toJson() => {
    "one": one.toJson(),
  };
}

class UserOne {
  UserOne({
    this.admin,
    this.age,
    this.email,
    this.id,
    this.nom,
    this.prenom,
    this.tel,
  });

  int admin;
  int age;
  String email;
  int id;
  String nom;
  String prenom;
  String tel;

  factory UserOne.fromJson(Map<String, dynamic> json) => UserOne(
    admin: json["admin"],
    age: json["age"],
    email: json["email"],
    id: json["id"],
    nom: json["nom"],
    prenom: json["prenom"],
    tel: json["tel"],
  );

  Map<String, dynamic> toJson() => {
    "admin": admin,
    "age": age,
    "email": email,
    "id": id,
    "nom": nom,
    "prenom": prenom,
    "tel": tel,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
