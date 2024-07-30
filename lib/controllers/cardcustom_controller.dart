import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tapcard/services/local_storage_services.dart';
import 'package:tapcard/utils/const.dart';

class CardCustomController extends GetxController {
  var pickerColor = kpurple.obs;
  var currentColor = kpurple.obs;

  // void changeColor(Color color) {
  //   pickerColor.value = color;
  //   print(pickerColor.value.value);
  // }

  // Future<void> setInt(String key, int value) async {
  //   localStorage.setItem(key, value.toString());
  // }

  // String? getInt(String key) {
  //   return localStorage.getItem(key);
  // }

  // Future<void> setColor(Color color) async {
  //   String colorString = color.value.toRadixString(16);
  //   print(colorString);
  //
  //   print(
  //       'SavedColor is ${LocalStorageService.instance.saveColorValue.toString()}');
  // }

  // Future<Color?> getColor(String key) async {
  //   String? colorValue = await localStorageServicee.getInt(key);
  //   print(colorValue);
  //   int colorvaluee = int.parse(colorValue!);
  //   if (colorvaluee != null) {
  //     print(colorvaluee);
  //     return Color(colorvaluee);
  //   }
  //   return null;
  // }
}
