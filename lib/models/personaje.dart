import 'package:json_annotation/json_annotation.dart';
import 'package:isar/isar.dart';

part 'personaje.g.dart';

@JsonSerializable(explicitToJson: true)
@collection
class Personaje {
  @JsonKey(name: "id")
  Id? id;
  @JsonKey(name: "name")
  late String? name;
  @JsonKey(name: "species")
  late String? species;
  @JsonKey(name: "image")
  late String? image;
  @JsonKey(name: "status")
  late String? status;
  @JsonKey(name: "type")
  late String? type;
  @JsonKey(name: "gender")
  late String? gender;
  @JsonKey(name: "created")
  late String? created;
  Personaje({
    this.id,
    this.name,
    this.species,
    this.image,
    this.status,
    this.type,
    this.gender,
    this.created,
  });

  factory Personaje.fromJson(Map<String, dynamic> json) =>
      _$PersonajeFromJson(json);

  Map<String, dynamic> toJson() => _$PersonajeToJson(this);
}
