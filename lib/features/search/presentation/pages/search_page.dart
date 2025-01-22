import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task1/core/app_color/app_colors.dart';
import 'package:task1/core/custom_showDialog/custom_show_dialog.dart';
import 'package:task1/features/home/blocs/home_bloc.dart';
import 'package:task1/features/home/model/product_model.dart';
import 'package:task1/features/home/presentation/pages/widgets/grid_widget.dart';
import 'package:task1/features/search/bloc/search_bloc.dart';
import 'package:task1/features/search/presentation/mixin/search_mixin.dart';
import 'package:task1/features/search/presentation/widgets/search_menu_widget.dart';

import '../widgets/bottom_sheet_widget.dart';

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
            child: isTapped
                ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isTapped = !isTapped;
                          });
                        },
                        icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    Text(
                      "Headphones",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Inter"),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isTapped = !isTapped;
                          });
                        },
                        icon: Icon(Icons.search))
                  ],
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  buildWhen: (p, n) => p.status != n.status,
                  builder: (context, state) {
                    if (state.status == StatusEnum.success) {
                      return SizedBox(
                        height: 40,
                        width: MediaQuery.sizeOf(context).width,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: category.length,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder:
                              (BuildContext context, int index) =>
                              SizedBox(
                                width: 8,
                              ),
                          itemBuilder:
                              (BuildContext context, int index) =>
                              GestureDetector(
                                onTap: () async {
                                  await _showModalMottomSheet(
                                      state.all!.first, () {
                                    {
                                      context.pop(context);

                                      if (checkList.contains(true)) {
                                        setState(() {
                                          checkList[checkList.indexOf(true)] =
                                          false;
                                        });
                                      }
                                    }
                                  }, "Filtirlash",
                                      selectedName: 'Tanlash'
                                          'haa');
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.color18),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        category[index],
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        if (state.status == StatusEnum.loading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state.status == StatusEnum.error) {
                          return Center(
                            child: Text(state.message.toString()),
                          );
                        } else if (state.status == StatusEnum.success) {
                          return GridWidget(
                              products: state.product, cart: null);
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ],
            )
                : SearchMenuWidget(
              controller: controller,
              menu: menu,
              onTap: () {
                if (controller.text.isNotEmpty) {
                  if (context.mounted) {
                    context.read<SearchBloc>().add(
                        NameSearchEvent(quote: controller.text.trim()));
                  }
                  setState(() {
                    isTapped = !isTapped;
                  });
                }
              },
              isTapped: isTapped,
              onTap1: () {
                context.read<SearchBloc>().add(ProductSearchEvent());
                setState(() {
                  isTapped = !isTapped;
                });
              },
            )
        )
    );
  }

  Future<void> _showModalMottomSheet(
      List<dynamic> prductsModel, VoidCallback onTap, String menuName,
      {required String selectedName}) async {
    final double itemLength = (MediaQuery.sizeOf(context).height * 0.35 - 72) +
        prductsModel.length * 72;

    final size = MediaQuery.sizeOf(context);
    await showModalBottomSheet(
        context: context,
        showDragHandle: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        builder: (BuildContext context) {
          print('');
          return BottomSheeWidget(
            prductsModel: prductsModel,
            menuName: menuName,
            height: size.height <= itemLength ? size.height - 100 : itemLength,
            onTap: () {
              onTap();
            },
            selectedName: selectedName,
          );
        });
  }

  List<bool> checkList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
}
