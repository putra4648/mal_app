import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manga_app/data/models/models.dart';
import 'package:manga_app/data/repository/repository.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleInitial()) {
    on<ScheduleEvent>((event, emit) async {
      if (event is ScheduleLoadEvent) {
        emit(ScheduleLoading());
        final scheduleRepo = await AnimeRepository().getAnimeSchedule();
        emit(ScheduleLoadedSuccess(mangas: scheduleRepo));
      }
    });
  }
}
