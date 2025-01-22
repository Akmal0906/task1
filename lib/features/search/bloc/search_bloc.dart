import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task1/features/home/model/product_model.dart';

import '../../api/repository.dart';
import '../../home/blocs/home_bloc.dart';
import '../../home/model/cart/cart_model.dart';
import '../../home/model/new_model.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.repository})
      : super(SearchState(status: StatusEnum.initial)) {
    on<ProductSearchEvent>(_product);
    on<NameSearchEvent>(_search);


  }

  final Repository repository;

  Future<void> _product(
      ProductSearchEvent event, Emitter<SearchState> emit) async {
    final Product? product = await repository.getProduct();
    if (product != null) {
      emit(state.copyWith(status: StatusEnum.success, product: product, all: []));
    } else {
      emit(state.copyWith(status: StatusEnum.error, message: 'null kelvotti', all: []));
    }
  }

  Future<void> _search(NameSearchEvent event, Emitter<SearchState> emit) async {
    List<List<dynamic>> all=[];
    final Product? product = await repository.search(quote: event.quote);
    final List<dynamic>? list = await repository.getCategory();
    if (product != null) {
      List<String> brand = [];
      List<String> price=[];
      for (int i = 0; i < product!.products.length; i++) {
        if(!brand.contains(product.products[i].brand)){
          brand.add(product.products[i].brand.toString());
        }else if(!price.contains(product.products[i].price.toString())){
          price.add(product.products[i].price.toString());
        }

      }
      all..add(list!)..add(brand)..add(price);
      print('allllllllll $all');

      emit(state.copyWith(status: StatusEnum.success, all: all));
    } else {
      emit(state.copyWith(status: StatusEnum.error, message: 'null kelvotti', all: []));
    }
  }





}
