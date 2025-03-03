import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/feature/home/data/model/info.dart';
import 'package:rickandmorty/feature/home/data/model/result.dart';

part 'characters.g.dart';

@JsonSerializable()
class CharactersModel {
    Info info;
    List<Result> results;

    CharactersModel({
        required this.info,
        required this.results,
    });
  factory CharactersModel.fromJson(Map<String, dynamic> json) => _$CharactersModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersModelToJson(this);
}