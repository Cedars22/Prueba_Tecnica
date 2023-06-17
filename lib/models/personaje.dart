import 'package:json_annotation/json_annotation.dart';

part 'personaje.g.dart';

@JsonSerializable(explicitToJson: true)
class Personaje {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "species")
  String? species;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "status")
  String? status;
  Personaje({this.id, this.name, this.species, this.image, this.status});

  factory Personaje.fromJson(Map<String, dynamic> json) =>
      _$PersonajeFromJson(json);

  Map<String, dynamic> toJson() => _$PersonajeToJson(this);
}
