import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable(explicitToJson: true)
class Info {
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "pages")
  int? pages;
  @JsonKey(name: "next")
  String? next;
  @JsonKey(name: "prev")
  String? prev;

  Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
