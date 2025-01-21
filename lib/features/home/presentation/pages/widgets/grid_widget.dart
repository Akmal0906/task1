import 'package:flutter/material.dart';
import 'package:task1/features/home/model/cart/cart_model.dart';
import 'package:task1/features/home/model/product_model.dart';

import '../../../model/new_model.dart';
import 'item_widget.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({super.key, required this.products,required this.cart});

  final Product? products;
  final Cart? cart;

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.products?.products.length?? widget.cart?.carts.length??0,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.5),
        itemBuilder: (BuildContext context, int index) {
        if(widget.products!=null){
          return ItemWidget(product: widget.products?.products[index]);
        }else if(widget.cart!=null){
          return  ItemWidget(cart: widget.cart?.carts[index]);
        }

        });
  }
}
