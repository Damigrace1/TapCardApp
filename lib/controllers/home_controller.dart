import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/views/widgets/card2__widget.dart';
import '../services/local_storage_services.dart';

class HomeController extends GetxController {
  static HomeController get it => Get.find();

  @override
  void onInit() async {
    super.onInit();
    String mode = await LocalStorageService.instance.getThemeVal();
    themeMode = mode == 'dark' ? ThemeMode.dark : ThemeMode.light;
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


  void showEditCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Edit Card',style:
            TextStyle(
              fontSize: 20.sp,fontWeight: FontWeight.w600
            ),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.zero,
                leading: Image.asset('assets/icons/edit.png',
                  width: 18.5.w,),
                title: Text('Change Details'),
                onTap: () {
                  // Handle change details
                },
              ),
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.zero,
                leading:Image.asset('assets/icons/palette.png',
                  width: 18.5.w,),
                title: Text('Customize Card'),
                onTap: () {
                  // Handle customize card
                },
              ),
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.zero,
                leading: Image.asset('assets/icons/delete.png',
                width: 18.5.w,),
                title: Text('Delete'),
                onTap: () {
                  // Handle delete
                },
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButton(text: 'Close',
                    filled : false,
                        onPressed: (){
                  Navigator.pop(context);
                }),
              )
            ],
          ),

        );
      },
    );
  }
}

