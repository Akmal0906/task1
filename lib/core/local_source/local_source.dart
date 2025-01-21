import "dart:io";

import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:path_provider/path_provider.dart";
import "package:task1/features/home/model/product_model.dart";

import "../../constants/constants.dart";

late Box<dynamic>box;
final class LocalSource {




  Future<void> setFavorites(ProductElement products) async {
    await box.put(AppKeys.favorites, products.toJson().toString());
  }
  String get favorites => box.get(AppKeys.favorites, defaultValue: "yoqku");
  Future<void> clear() async {
    await box.clear();
  }
}

Future<void> initHive() async {
  const String boxName = "task1";
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  box = await Hive.openBox<dynamic>(boxName);
}

