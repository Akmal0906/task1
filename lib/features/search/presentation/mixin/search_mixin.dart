


import 'package:flutter/cupertino.dart';
import 'package:task1/features/search/presentation/pages/search_page.dart';

mixin SearchMixin on State<SearchPage>{
late bool isTapped;
late List<String> menu;
@override
  void initState() {
    super.initState();
    menu=[
      "Audio",
      "Drones + Electronics",
      "Photo + Video",
      "Gaming + VR",
      "Networking",
      "Notebooks + PCs",
      "PC components",
      "Peripherals",
      "Smartphones + Tablets",
      "Software solutions",
      "TV + Home cinema",

    ];
    isTapped=false;
  }

}