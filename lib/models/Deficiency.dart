class Deficiency {

  String? deficiency;
  String? disease;

  Deficiency({this.deficiency, this.disease});

  factory Deficiency.fromJson(Map<String, dynamic> json) {
    return Deficiency(
      deficiency: json['deficiency'],
      disease: json['disease'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deficiency'] = deficiency;
    data['disease'] = disease;
    return data;
  }

}