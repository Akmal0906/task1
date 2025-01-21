part of 'home_bloc.dart';

enum StatusEnum {
  initial,
  loading,
  error,
  success,
  upload
}

class HomeState extends Equatable {
  const HomeState({this.product, this.cart,required this.status,this.message,required this.currentIndex});

  final StatusEnum status;
  final Product? product;
  final Cart? cart;

  final String? message;
  final int currentIndex;

  @override
  List<Object?> get props => [product,status,message,currentIndex,cart];

  HomeState copyWith({Product? product, Cart? cart, required StatusEnum status,String? message,int? currentIndex}) =>
      HomeState(
          product: product ?? this.product,
          cart: cart ?? this.cart,

          status: status ?? this.status,
          message: message?? this.message,
          currentIndex: currentIndex?? this.currentIndex
      );
}

