part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

}
final class ProductSearchEvent extends SearchEvent{
  @override
  List<Object?> get props => [];

}
