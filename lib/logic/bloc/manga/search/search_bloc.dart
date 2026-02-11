import 'package:equatable/equatable.dart';
import 'package:manga_app/data/models/models.dart';
import 'package:manga_app/data/repository/repository.dart';
import 'package:manga_app/constant/constant.dart';
import 'package:manga_app/logic/logic.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial([])) {
    on<SearchEvent>((event, emit) async {
      final currentState = state;
      if (event is SearchInitEvent) {
        emit(SearchLoading([]));

        emit(SearchLoadedSuccess([]));
      }

      if (event is SearchEventRequested) {
        final mangaSearch =
            await MangaRepository().getSearchManga(Type.manga, event.search);
        final currentMangas = List<Manga>.from(currentState.mangas)
          ..addAll(mangaSearch);

        emit(SearchLoadedSuccess(currentMangas));
        print('search event');
      }
    });
  }
}
