import 'package:equatable/equatable.dart';

import '../../../../data/models/models.dart';
import '../../../../data/repository/repository.dart';
import '../../../logic.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) async {
      if (event is CharacterLoadEvent) {
        emit(CharacterLoading());

        try {
          final charactersRepo = await CharacterRepository().getCharacter();

          emit(CharacterLoadedSuccess(characters: charactersRepo));
        } catch (_) {
          emit(CharacterFailure());
        }
      }
    });
  }
}
