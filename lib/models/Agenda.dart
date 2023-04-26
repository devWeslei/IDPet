class Agenda {
  String? agendaId;
  String? clinic;
  String? motiveConsultation;
  DateTime? dateConsultation;
  String? appointment;
  String? motiveAgenda;
  DateTime? dateAgenda;

  Agenda(
      {this.agendaId,
      this.clinic,
      this.motiveConsultation,
      this.dateConsultation,
      this.appointment,
      this.motiveAgenda,
      this.dateAgenda});

  factory Agenda.fromJson(Map<String, dynamic> json) {
    return Agenda(
      agendaId: json['agendaId'],
      clinic: json['clinic'],
      motiveConsultation: json['motiveConsultation'],
      dateConsultation: json['dateConsultation'] != null
          ? DateTime.parse(json['dateConsultation'])
          : null,
      appointment: json['appointment'],
      motiveAgenda: json['motiveAgenda'],
      dateAgenda: json['dateAgenda'] != null
          ? DateTime.parse(json['dateAgenda'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['agendaId'] = agendaId;
    data['clinic'] = clinic;
    data['motiveConsultation'] = motiveConsultation;
    data['dateConsultation'] = dateConsultation?.toIso8601String();
    data['appointment'] = appointment;
    data['motiveAgenda'] = motiveAgenda;
    data['dateAgenda'] = dateAgenda?.toIso8601String();
    return data;
  }
}
