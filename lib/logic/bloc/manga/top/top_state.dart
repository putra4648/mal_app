part of 'top_bloc.dart';

abstract class TopState extends Equatable {
  final List<Manga> mangas;

  const TopState(this.mangas);

  @override
  List<Object> get props => [mangas];
}

class TopInitial extends TopState {
  TopInitial() : super([]);
}

class TopLoading extends TopState {
  TopLoading() : super([]);
}

class TopLoadedSuccess extends TopState {
  TopLoadedSuccess(List<Manga> mangas) : super(mangas);
}

class TopFailure extends TopState {
  TopFailure() : super([]);
}
