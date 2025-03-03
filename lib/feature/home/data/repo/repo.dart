import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/api_services.dart';
import 'package:rickandmorty/feature/home/data/model/characters.dart';

class CharactersRepository {
  final ApiServices apiServices;

  CharactersRepository(this.apiServices);

  Future<Either< String, CharactersModel> > getAllCharacters() async {

    try {
      final characters = await apiServices.getCharacters();
      return Right(characters);
    } catch (e) {
      return Left(e.toString());
    }
  }
}