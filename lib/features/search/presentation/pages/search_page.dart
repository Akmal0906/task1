import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/constants/image_constants.dart';
import 'package:task1/core/app_color/app_colors.dart';
import 'package:task1/features/search/presentation/mixin/search_mixin.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SearchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 24, left: 8, right: 8, bottom: 32),
        child: Column(
          children: [
            SizedBox(
              height:56,
              child: TextField(
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
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
      )),
    );
  }
}
