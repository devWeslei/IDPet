class Vaccine {

  String? name;
  String? dosage;
  DateTime? initiation;
  DateTime? booster;

  Vaccine({this.name, this.dosage, this.initiation, this.booster});

  factory Vaccine.fromJson(Map<String, dynamic> json) {
    return Vaccine(
      name: json['name'],
      dosage: json['dosage'],
      initiation: json['initiation'] != null ? DateTime.parse(json['initiation']) : null,
      booster: json['booster'] != null ? DateTime.parse(json['booster']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['dosage'] = dosage;
    data['initiation'] = initiation?.toIso8601String();
    data['booster'] = booster?.toIso8601String();
    return data;
  }

}