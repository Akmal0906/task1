part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState(
      {this.product,
      this.cart,
      required this.status,
      this.message,
     });

  final StatusEnum status;
  final Product? product;
  final Cart? cart;

  final String? message;


  @override
  List<Object?> get props => [product, status, message, cart];

  SearchState copyWith(
          {Product? product,
          Cart? cart,
          required StatusEnum status,
          String? message,
          int? currentIndex}) =>
      SearchState(
          product: product ?? this.product,
          cart: cart ?? this.cart,
          status: status ?? this.status,
          message: message ?? this.message,
          );
}
