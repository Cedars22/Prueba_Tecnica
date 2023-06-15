// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personaje.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Personaje _$PersonajeFromJson(Map<String, dynamic> json) => Personaje(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['species'] as String?,
      image: json['image'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$PersonajeToJson(Personaje instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'species': instance.type,
      'image': instance.image,
      'gender': instance.gender,
    };
