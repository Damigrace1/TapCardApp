import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  runApp(const TapCardApp());
  // firebse initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class TapCardApp extends StatelessWidget {
  const TapCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (_, child) {
          return GetMaterialApp(
            builder: (context, child) {
              return Overlay(
                initialEntries: [OverlayEntry(builder: (context) => child!)],
              );
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: Container(),
          );
        });
  }
}
