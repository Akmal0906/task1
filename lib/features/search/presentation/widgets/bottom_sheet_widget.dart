import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";
import 'package:task1/features/home/model/product_model.dart';
import '../../../../core/app_color/app_colors.dart';
import 'bottom_navigation_button_widget.dart';
import 'choose_item_widget.dart';
class BottomSheeWidget extends StatefulWidget {
  const BottomSheeWidget(
      {super.key,
        required this.prductsModel,
        required this.menuName,
        required this.height,required this.selectedName,
        required this.onTap});

  final List<dynamic> prductsModel;
  final String menuName;
  final double height;
  final VoidCallback onTap;
  final String selectedName;

  @override
  State<BottomSheeWidget> createState() => _BottomSheeWidgetState();
}

class _BottomSheeWidgetState extends State<BottomSheeWidget> {
  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
    initialChildSize: widget.height / MediaQuery.sizeOf(context).height,
    maxChildSize: widget.height / MediaQuery.sizeOf(context).height,
    minChildSize: widget.height / MediaQuery.sizeOf(context).height,
    expand: false,
    builder: (context, controller) {
      print("checkList }");
      return Container(
        height: widget.height,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.only(left: 24, right: 24, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.menuName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.blue),
                  ),
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.close,color: Colors.blue,)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                controller: controller,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                children: [
                  ...List.generate(
                    widget.prductsModel.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: ChooseItemWidget(
                        onTap: () {
                          setState(() {
                            if (checkList.contains(true)) {
                              checkList[checkList.indexOf(true)] = false;
                            }

                            checkList[index] = true;
                          });
                        },
                        itemName: widget.prductsModel[index],
                        isSelected: checkIsSelected(widget.prductsModel,index,widget.selectedName),
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomNavigationButtonWidget(
              bottomName: "Apply",
              onTap: widget.onTap,

            ),
          ],
        ),
      );
    },
  );
}
bool checkIsSelected(List<dynamic> regionsModel,int index,String selectedName){
  if(checkList.contains(true)){
    return checkList[index];
  }else{
    return regionsModel[index]==selectedName;
  }
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
  false,false,
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
  false
];