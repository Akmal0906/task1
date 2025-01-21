import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task1/features/api/repository.dart';
import 'package:task1/features/home/model/cart/cart_model.dart';
import 'package:task1/features/home/model/product_model.dart';

import '../model/new_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.repository})
      : super(HomeState(status: StatusEnum.initial, currentIndex: 0)) {
    on<ProductHomeEvent>(_product);
    on<CartHomeEvent>(_cart);

  }

  final Repository repository;

  Future<void> _product(ProductHomeEvent event, Emitter<HomeState> emit) async {
    final Product? product = await repository.getProduct();
    if (product != null) {
      emit(state.copyWith(status: StatusEnum.success, product: product));
    } else {
      emit(state.copyWith(status: StatusEnum.error, message: 'null kelvotti'));
    }
  }

  Future<void> _cart(CartHomeEvent event, Emitter<HomeState> emit) async {
    final Cart? cart = await repository.getCart();
    if (cart != null) {
      emit(state.copyWith(status: StatusEnum.success, cart: cart));
    } else {
      emit(state.copyWith(status: StatusEnum.error, message: 'null kelvotti'));
    }
  }
}
