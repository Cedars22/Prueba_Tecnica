import 'package:json_annotation/json_annotation.dart';

part 'personaje.g.dart';

class Personaje {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "species")
  String? type;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "gender")
  String? gender;
  Personaje({this.id, this.name, this.type, this.image, this.gender});

  factory Personaje.fromJson(Map<String, dynamic> json) =>
      _$PersonajeFromJson(json);

  Map<String, dynamic> toJson() => _$PersonajeToJson(this);
}
