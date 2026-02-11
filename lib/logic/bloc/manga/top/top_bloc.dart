import 'package:equatable/equatable.dart';
import 'package:manga_app/data/models/models.dart';
import 'package:manga_app/data/repository/get_request/get_manga.dart';
import 'package:manga_app/logic/logic.dart';
import 'package:manga_app/constant/constant.dart';

part 'top_event.dart';
part 'top_state.dart';

class TopBloc extends Bloc<TopEvent, TopState> {
  TopBloc() : super(TopInitial()) {
    on<TopEvent>((event, emit) async {
      if (event is TopLoadEvent) {
        emit(TopLoading());
        final topRepo = await MangaRepository().getTopManga(Type.manga);
        emit(TopLoadedSuccess(topRepo));
      }
    });
  }
}
