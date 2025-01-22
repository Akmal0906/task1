import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:task1/constants/image_constants.dart';
import 'package:task1/core/app_color/app_colors.dart';

class CustomShowDialog extends StatelessWidget {
  const CustomShowDialog({super.key, required this.category,required this.list});

  final List<dynamic> category;
  final List<bool> list;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Dialog(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.6,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView.separated(
          itemCount: category.length,
          itemBuilder: (BuildContext context, int index) {
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(category[index],style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",color: AppColors.black
                  ),),
                  SvgPicture.asset(SvgIcons.icCircle),

                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 7,),
        ),
      ),
    );
  }
}
