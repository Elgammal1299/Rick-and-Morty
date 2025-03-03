import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';
@JsonSerializable()
class Result {
    int id;
    String name;
    String status;
    String species;
    String type;
    String gender;
    Map<String ,dynamic> origin;
    Map<String ,dynamic> location;
    String image;
    List<String> episode;
    String url;
    DateTime created;

    Result({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
        required this.episode,
        required this.url,
        required this.created,
    });
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);


}