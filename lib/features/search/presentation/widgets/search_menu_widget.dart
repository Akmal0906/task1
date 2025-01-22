import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/image_constants.dart';
import '../../../../core/app_color/app_colors.dart';
import '../../bloc/search_bloc.dart';

class SearchMenuWidget extends StatelessWidget {
  const SearchMenuWidget(
      {super.key,
      required this.controller,
      required this.menu,
      required this.onTap,
      required this.isTapped,required this.onTap1});

  final TextEditingController controller;
  final List<String> menu;
  final VoidCallback onTap;
  final bool isTapped;
 final VoidCallback onTap1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          SizedBox(
            height: 56,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: AppColors.color18,
                filled: true,
                enabledBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Search',
                suffixIcon: IconButton(
                    onPressed: () {
                      onTap();
                      if(isTapped){

                      }
                    },
                    icon:isTapped?Icon(Icons.clear): Icon(Icons.search)),
              ),
            ),
          ),
          ListView.separated(
            itemCount: menu.length,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: 8, right: 8, top: 32),
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                index < menu.length - 1
                    ? Divider(
                        thickness: 1,
                        color: Colors.grey,
                      )
                    : SizedBox.shrink(),
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
              onTap1();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      menu[index],
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.color17),
                    ),
                    SvgPicture.asset(SvgIcons.icForward)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
