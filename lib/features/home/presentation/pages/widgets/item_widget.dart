
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task1/core/app_color/app_colors.dart';
import 'package:task1/core/local_source/local_source.dart';
import 'package:task1/features/home/model/cart/cart_model.dart';

import '../../../model/product_model.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({super.key,  this.product,this.cart});

  ProductElement? product;
   CartElement ? cart;
   bool isLiked=false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: product==null? cart?.products.first.thumbnail??"":product?.images.first??"",
                  imageBuilder: (context, imageProvider) => Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Container(
                    height: size.height / 4,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/defaultImage.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:  EdgeInsets.only(top: 8, bottom: 4, left: 8),
              child: Text(
                "${product!=null? product?.price:cart?.products.first.price}so'm",
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Inter"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
              product!=null?product?.title??"":cart?.products.first.title??"",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: AppColors.color16),
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                product!=null?product?.description??"":cart?.products.first.title??"",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.color15),
                maxLines: 1,overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Positioned(
          right: 15,
          top: 15,
          child: StatefulBuilder(builder: (context, setState) {
            return CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Center(
                child: IconButton(
                    onPressed: () {




                      setState((){
                        if(product!=null){
                          if(product!.isLiked){
                            product?.isLiked=false;
                            isLiked=false;
                          }else{
                            product?.isLiked=true;
                            isLiked=true;
                          }
                        }else{
                          if(cart!.products.first.isLiked){
                            cart?.products.first.isLiked=false;
                            isLiked=false;
                          }else{
                            cart?.products.first.isLiked=true;
                            isLiked=true;
                          }
                        }
                      });
                    },
                    icon: Icon(
                    isLiked?
                           Icons.favorite_sharp
                          : Icons.favorite_border,
                    )),
              ),
            );
          }),
        ),
      ],
    );
  }
}
