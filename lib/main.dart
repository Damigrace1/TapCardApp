import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/controllers/home_controller.dart';
import 'package:tapcard/utils/themes.dart';
import 'package:tapcard/views/home.dart';
import 'package:tapcard/views/sign_up/signup.dart';
import 'package:tapcard/views/splash_screen.dart';
// import 'package:tapcard/views/settings/settings_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  Get.put(HomeController());

  runApp(const TapCardApp());
}

class TapCardApp extends StatelessWidget {
  const TapCardApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (_, child) {
          return GetBuilder<HomeController>(
            builder: (controller) {
              return GetMaterialApp(
                title: 'Tap Card',
                theme: TapCardThemes.lightTheme,
                darkTheme: TapCardThemes.darkTheme,
                themeMode: HomeController.it.themeMode,
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
              );
            },
          );
        });
  }
}
