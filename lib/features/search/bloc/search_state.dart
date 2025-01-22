part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState(
      {this.product,
      this.cart,
      required this.status,
      this.message,
        this.all});

  final StatusEnum status;
  final Product? product;
  final Cart? cart;
  final List<List<dynamic>>? all;


  final String? message;

  @override
  List<Object?> get props => [product, status, message, cart,all];

  SearchState copyWith(
          {Product? product,
          Cart? cart,
          required StatusEnum status,
          String? message,
          required List<List<dynamic>> all,}) =>
      SearchState(
        product: product ?? this.product,
        cart: cart ?? this.cart,
        status: status ?? this.status,
        message: message ?? this.message,
        all: all ?? this.all,

      );
}
