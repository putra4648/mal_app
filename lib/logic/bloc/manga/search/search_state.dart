part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  final List<Manga> mangas;

  const SearchState(this.mangas);

  @override
  List<Object> get props => [mangas];
}

class SearchInitial extends SearchState {
  SearchInitial(List<Manga> mangas) : super(mangas);
}

class SearchLoading extends SearchState {
  SearchLoading(List<Manga> mangas) : super(mangas);
}

class SearchLoadedSuccess extends SearchState {
  SearchLoadedSuccess(List<Manga> mangas) : super(mangas);
}
