class Vermifuge {

  String? name;
  String? dosage;
  String? interval;
  DateTime? initiation;
  DateTime? finish;

  Vermifuge({this.name, this.dosage, this.interval, this.initiation, this.finish});

  factory Vermifuge.fromJson(Map<String, dynamic> json) {
    return Vermifuge(
      name: json['name'],
      dosage: json['dosage'],
      interval: json['interval'],
      initiation: json['initiation'] != null ? DateTime.parse(json['initiation']) : null,
      finish: json['finish'] != null ? DateTime.parse(json['finish']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['dosage'] = dosage;
    data['interval'] = interval;
    data['initiation'] = initiation?.toIso8601String();
    data['finish'] = finish?.toIso8601String();
    return data;
  }
}