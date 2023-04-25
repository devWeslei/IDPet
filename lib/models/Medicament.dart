class Medicament {

  String? name;
  String? motive;
  String? dosage;
  String? interval;
  DateTime? initiation;
  DateTime? finish;

  Medicament(
      {this.name,
      this.motive,
      this.dosage,
      this.interval,
      this.initiation,
      this.finish});

  factory Medicament.fromJson(Map<String, dynamic> json) {
    return Medicament(
      name: json['name'],
      motive: json['motive'],
      dosage: json['dosage'],
      interval: json['interval'],
      initiation: json['initiation'] != null ? DateTime.parse(json['initiation']) : null,
      finish: json['finish'] != null ? DateTime.parse(json['finish']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['motive'] = motive;
    data['dosage'] = dosage;
    data['interval'] = interval;
    data['initiation'] = initiation?.toIso8601String();
    data['finish'] = finish?.toIso8601String();
    return data;
  }

}