// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      personajes: (json['results'] as List<dynamic>?)
              ?.map((e) => Personaje.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'info': instance.info.toJson(),
      'results': instance.personajes?.map((e) => e.toJson()).toList(),
    };
