part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInitEvent extends SearchEvent {}

class SearchEventRequested extends SearchEvent {
  final String search;

  const SearchEventRequested({required this.search});
}

class SearchTypeChanged extends SearchEvent {
  final Type type;

  SearchTypeChanged({required this.type});

  SearchTypeChanged copyWith({
    required Type type,
  }) {
    return SearchTypeChanged(
      type: this.type,
    );
  }

  @override
  List<Object> get props => [type];
}
