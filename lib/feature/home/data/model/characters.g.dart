// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersModel _$CharactersModelFromJson(Map<String, dynamic> json) =>
    CharactersModel(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results:
          (json['results'] as List<dynamic>)
              .map((e) => Result.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CharactersModelToJson(CharactersModel instance) =>
    <String, dynamic>{'info': instance.info, 'results': instance.results};
