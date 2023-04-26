class Observation {
  String? observationId;
  String? name;
  String? observation;
  DateTime? dateObservation;

  Observation(
      {this.observationId, this.name, this.observation, this.dateObservation});

  factory Observation.fromJson(Map<String, dynamic> json) => Observation(
        observationId: json['observationId'],
        name: json['name'],
        observation: json['observation'],
        dateObservation: json['dateObservation'] != null
            ? DateTime.parse(json['dateObservation'])
            : null,
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['observation'] = observationId;
    data['name'] = name;
    data['observation'] = observation;
    data['dateObservation'] = dateObservation?.toIso8601String();
    return data;
  }
}
