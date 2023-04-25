class Agenda {

  String? clinic;
  String? motiveConsultation;
  DateTime? dateConsultation;
  String? appointment;
  String? motiveAgenda;
  DateTime? dateAgenda;

  Agenda(
      {this.clinic,
      this.motiveConsultation,
      this.dateConsultation,
      this.appointment,
      this.motiveAgenda,
      this.dateAgenda});

  factory Agenda.fromJson(Map<String, dynamic> json) {
    return Agenda(
      clinic: json['clinic'] as String?,
      motiveConsultation: json['motiveConsultation'] as String?,
      dateConsultation: json['dateConsultation'] != null
          ? DateTime.parse(json['dateConsultation'] as String)
          : null,
      appointment: json['appointment'] as String?,
      motiveAgenda: json['motiveAgenda'] as String?,
      dateAgenda: json['dateAgenda'] != null
          ? DateTime.parse(json['dateAgenda'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clinic'] = clinic;
    data['motiveConsultation'] = motiveConsultation;
    data['dateConsultation'] = dateConsultation?.toIso8601String();
    data['appointment'] = appointment;
    data['motiveAgenda'] = motiveAgenda;
    data['dateAgenda'] = dateAgenda?.toIso8601String();
    return data;
  }
}