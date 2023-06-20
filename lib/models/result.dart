import 'package:json_annotation/json_annotation.dart';
import 'package:prueba_tecnica/models/personaje.dart';

part 'result.g.dart';

@JsonSerializable(explicitToJson: true)
class Result {
  @JsonKey(name: "results", defaultValue: [])
  List<Personaje>? personajes;

  Result({required this.personajes});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
