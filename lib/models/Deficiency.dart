class Deficiency {
  String? deficiencyId;
  String? deficiency;
  String? disease;

  Deficiency({this.deficiencyId, this.deficiency, this.disease});

  factory Deficiency.fromJson(Map<String, dynamic> json) {
    return Deficiency(
      deficiencyId: json['deficiencyId'],
      deficiency: json['deficiency'],
      disease: json['disease'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deficiencyId'] = deficiencyId;
    data['deficiency'] = deficiency;
    data['disease'] = disease;
    return data;
  }
}
