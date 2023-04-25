import 'package:idpet/models/Agenda.dart';
import 'package:idpet/models/Deficiency.dart';
import 'package:idpet/models/Medicament.dart';
import 'package:idpet/models/Observation.dart';
import 'package:idpet/models/PerfilPet.dart';
import 'package:idpet/models/Vaccine.dart';
import 'package:idpet/models/Vermifuge.dart';


class Pet{
  PerfilPet? perfil;
  List<Medicament>? medicament;
  List<Vermifuge>? vermifuge;
  List<Vaccine>? vaccine;
  List<Deficiency>? deficiency;
  List<Agenda>? agenda;
  List<Observation>? observation;

  Pet({
    this.perfil,
    this.medicament,
    this.vermifuge,
    this.vaccine,
    this.deficiency,
    this.agenda,
    this.observation,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    perfil: json['perfil'] != null ? PerfilPet.fromJson(json['perfil']) : null,
    medicament: json['medicament'] != null ? List<Medicament>.from(json['medicament'].map((x) => Medicament.fromJson(x))) : null,
    vermifuge: json['vermifuge'] != null ? List<Vermifuge>.from(json['vermifuge'].map((x) => Vermifuge.fromJson(x))) : null,
    vaccine: json['vaccine'] != null ? List<Vaccine>.from(json['vaccine'].map((x) => Vaccine.fromJson(x))) : null,
    deficiency: json['deficiency'] != null ? List<Deficiency>.from(json['deficiency'].map((x) => Deficiency.fromJson(x))) : null,
    agenda: json['agenda'] != null ? List<Agenda>.from(json['agenda'].map((x) => Agenda.fromJson(x))) : null,
    observation: json['observation'] != null ? List<Observation>.from(json['observation'].map((x) => Observation.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['perfil'] = perfil?.toJson();
    data['medicament'] = medicament?.map((x) => x.toJson()).toList();
    data['vermifuge'] = vermifuge?.map((x) => x.toJson()).toList();
    data['vaccine'] =  vaccine?.map((x) => x.toJson()).toList();
    data['deficiency'] = deficiency?.map((x) => x.toJson()).toList();
    data['agenda'] = agenda?.map((x) => x.toJson()).toList();
    data['observation'] = observation?.map((x) => x.toJson()).toList();
    return data;
  }

}