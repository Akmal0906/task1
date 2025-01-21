part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();


}
final class ProductHomeEvent extends HomeEvent{
  @override
  List<Object?> get props => [];

}
final class CartHomeEvent extends HomeEvent{
  @override
  List<Object?> get props => [];

}
