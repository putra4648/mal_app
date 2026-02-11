import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manga_app/data/models/models.dart';
import 'package:manga_app/data/repository/repository.dart';
import 'package:manga_app/logic/logic.dart';

part 'season_event.dart';
part 'season_state.dart';

class SeasonBloc extends Bloc<SeasonEvent, SeasonState> {
  SeasonBloc() : super(SeasonInitial()) {
    on<SeasonEvent>((event, emit) async {
      if (event is SeasonLoadEvent) {
        emit(SeasonLoading());
        final seasonsRepo = await SeasonRepository().getMangaSeason();
        emit(SeasonLoadedSuccess(seasonsRepo));
      }
    });
  }
}
