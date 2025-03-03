import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/feature/home/data/model/characters.dart';
import 'package:rickandmorty/feature/home/data/repo/repo.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.charactersRepository) : super(CharacterInitial());

  final CharactersRepository charactersRepository;

  Future<void> fetchCharacter() async {
    emit(CharacterLoading());
    var result = await charactersRepository.getAllCharacters();
    result.fold((message) {
      emit(CharacterError(message));
    }, (characters) {
      emit(CharacterLoaded(characters));
    
      
    });
  }
}
