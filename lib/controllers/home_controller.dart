import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:tapcard/models/business_model.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/customize/cardcustom.dart';
import 'package:tapcard/views/edit_card.dart';
import 'package:tapcard/views/widgets/card2__widget.dart';

import '../custom_button.dart';
import '../services/local_storage_services.dart';

class HomeController extends GetxController {
  static HomeController get it => Get.find();
  RxInt pickerColor = 4293467747.obs;
  List myCards = [];

  getCards() async {
    myCards = await LocalStorageService.instance.getMyCards()??[];
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    String mode = await LocalStorageService.instance.getThemeVal();
    themeMode = mode == 'dark' ? ThemeMode.dark : ThemeMode.light;
//    getColor();
  }

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode val) {
    String mode = val == ThemeMode.dark ? 'dark' : 'light';
    LocalStorageService.instance.saveThemeValue(mode);
    _themeMode = val;
    update();
  }

  ThemeData _themeData = ThemeData.light();
  ThemeData get theme => _themeData;
  set theme(ThemeData val) {
    _themeData = val;
    update();
  }

  // Future<Color?> getColor() async {
  //   String? colorString = await LocalStorageService.instance.getColorVal();
  //   print(' $colorString is this');
  //   // int colorValue = int.parse(colorString, radix: 16);
  //   // Ensure the string starts with `#`
  //   if (colorString.startsWith('#')) {
  //     colorString = colorString.substring(1);
  //   }
  //
  //   int colorInt = int.parse(colorString, radix: 16);
  //   pickerColor.value = colorInt;
  //   return Color(colorInt);
  // }

  void showEditCardDialog(BuildContext context, BusinessCardModel cardModel) {

    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        'Edit Card',
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            visualDensity: VisualDensity(vertical: -4),
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              'assets/icons/edit.png',
              width: 18.5.w,
            ),
            title: Text('Change Details'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => EditCard(cardModel: cardModel,));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -4),
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              'assets/icons/palette.png',
              width: 18.5.w,
            ),
            title: Text('Customize Card'),
            onTap: () {
              Get.to(() => CustomCard(business: cardModel));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -4),
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              'assets/icons/delete.png',
              width: 18.5.w,
            ),
            title: Text('Delete'),
            onTap: () {
              LocalStorageService.instance.deleteCard(cardModel.id.toString());
              HomeController.it.getCards();
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
                text: 'Close',
                filled: false,
                onPressed: () {
                  Navigator.pop(context);
                }),
            // child: CustomButton(
            //     text: 'Close',
            //     filled: false,
            //     onPressed: () {
            //       Navigator.pop(context);
            //     }),
          )
        ],
      ),
    ));
  }
}
