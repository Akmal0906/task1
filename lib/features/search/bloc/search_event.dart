part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

}
final class ProductSearchEvent extends SearchEvent{
  @override
  List<Object?> get props => [];
}
final class NameSearchEvent extends SearchEvent{
  final String quote;
  const NameSearchEvent({required this.quote});
  @override
  List<Object?> get props => [quote];
}

final class CategorySearchEvent extends SearchEvent{
  @override
  List<Object?> get props => [];

}

