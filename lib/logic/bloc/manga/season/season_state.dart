part of 'season_bloc.dart';

abstract class SeasonState extends Equatable {
  final List<Manga> seasons;

  const SeasonState(this.seasons);

  @override
  List<Object> get props => [seasons];
}

class SeasonInitial extends SeasonState {
  SeasonInitial() : super([]);
}

class SeasonLoading extends SeasonState {
  SeasonLoading() : super([]);
}

class SeasonLoadedSuccess extends SeasonState {
  SeasonLoadedSuccess(List<Manga> seasons) : super(seasons);
}

class SeasonFailure extends SeasonState {
  SeasonFailure() : super([]);
}
