import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rickandmorty/feature/home/data/model/characters.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api/')
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @GET('character')
  Future<CharactersModel> getCharacters();
}