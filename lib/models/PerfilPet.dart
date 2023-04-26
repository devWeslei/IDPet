class PerfilPet {
  String? urlPerfilImage;
  String? urlDocImage;
  String? species;
  String? name;
  String? nickName;
  String? race;
  DateTime? birth;
  String? gender;
  String? pelage;
  String? owner;
  String? temperament;
  String? sociable;
  String? food;
  String? observation;

  PerfilPet(
      {this.urlPerfilImage,
      this.urlDocImage,
      this.species,
      this.name,
      this.nickName,
      this.race,
      this.birth,
      this.gender,
      this.pelage,
      this.owner,
      this.temperament,
      this.sociable,
      this.food,
      this.observation});

  factory PerfilPet.fromJson(Map<String, dynamic> json) => PerfilPet(
        urlPerfilImage: json['urlPerfilImage'],
        urlDocImage: json['urlDocImage'],
        species: json['species'],
        name: json['name'],
        nickName: json['nickName'],
        race: json['race'],
        birth: DateTime.tryParse(json['birth']),
        gender: json['gender'],
        pelage: json['pelage'],
        owner: json['owner'],
        temperament: json['temperament'],
        sociable: json['sociable'],
        food: json['food'],
        observation: json['observation'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['urlPerfilImage'] = urlPerfilImage;
    data['urlDocImage'] = urlDocImage;
    data['species'] = species;
    data['name'] = name;
    data['nickName'] = nickName;
    data['race'] = race;
    data['birth'] = birth?.toIso8601String();
    data['gender'] = gender;
    data['pelage'] = pelage;
    data['owner'] = owner;
    data['temperament'] = temperament;
    data['sociable'] = sociable;
    data['food'] = food;
    data['observation'] = observation;
    return data;
  }
}
