import 'package:dio/dio.dart';
import 'package:task1/constants/constants.dart';
import 'package:task1/features/api/repository.dart';
import 'package:task1/features/home/model/cart/cart_model.dart';
import 'package:task1/features/home/model/product_model.dart';

import '../home/model/new_model.dart';

class RepositoryIml extends Repository {
  final Dio dio;

  RepositoryIml(this.dio);

  @override
  Future<Product?> getProduct() async {
    final Response response = await dio.get(
      Urls.explore,
    );
    if(response.statusCode==200||response.statusCode==201){
      print(response.data);
      return  Product.fromJson(response.data);

    }
    else{
      return null;
    }

  }

  @override
  Future<Cart?> getCart()async {
    final Response response = await dio.get(
      Urls.cart,
    );
    if(response.statusCode==200||response.statusCode==201){
      print(response.data);
      return  Cart.fromJson(response.data);

    }
    else{
      return null;
    }
  }

  @override
  Future<Product?> search({required String quote}) async {
    final Response response = await dio.get(
      "${Urls.quote}$quote",
    );
    if(response.statusCode==200||response.statusCode==201){
      print(response.data);
      return  Product.fromJson(response.data);

    }
    else{
      return null;
    }
  }

  @override
  Future<List<dynamic>?> getCategory() async{
    final Response response = await dio.get(
      Urls.category,
    );
    if(response.statusCode==200||response.statusCode==201){
      print(response.data);
      return response.data;

    }
    return null;

  }
}
