import 'package:task1/features/home/model/cart/cart_model.dart';
import 'package:task1/features/home/model/product_model.dart';

import '../home/model/new_model.dart';

abstract class Repository{
  Future<Product?> getProduct();
  Future<Cart?> getCart();
  Future<Product?> search({required String quote});
  Future<List<dynamic>?> getCategory();

}