import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api/repository.dart';
import '../../home/blocs/home_bloc.dart';
import '../../home/model/cart/cart_model.dart';
import '../../home/model/new_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.repository}) : super(SearchState(status: StatusEnum.initial)) {
    on<ProductSearchEvent>(_product);
  }

  final Repository repository;

  Future<void> _product(ProductSearchEvent event, Emitter<SearchState> emit) async {
    final Product? product = await repository.getProduct();
    if (product != null) {
      emit(state.copyWith(status: StatusEnum.success, product: product));
    } else {
      emit(state.copyWith(status: StatusEnum.error, message: 'null kelvotti'));
    }
  }

}

