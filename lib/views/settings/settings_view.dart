
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
import 'package:tapcard/utils/themes.dart';

import '../../controllers/home_controller.dart';
import '../widgets/common_widgets.dart';



// ignore: use_key_in_widget_constructors
class SettingsView extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _lightMode = false;
  bool _darkMode = false;
  bool _usePhoneSettings = true;

  void _onLightModeChanged(bool value) {
    setState(() {
      _lightMode = value;
      if (value) {
        _darkMode = false;
        _usePhoneSettings = false;
        HomeController.it.themeMode = ThemeMode.light;
      }
      else {
        HomeController.it.themeMode = ThemeMode.dark;
      }
      HomeController.it.update();
    });
  }

  void _onDarkModeChanged(bool value) {
    setState(() {
      _darkMode = value;
      if (value) {
        _lightMode = false;
        _usePhoneSettings = false;
        HomeController.it.themeMode = ThemeMode.dark;
      }
      else {
        HomeController.it.themeMode = ThemeMode.light;
      }
      HomeController.it.update();
    });
  }

  void _onUsePhoneSettingsChanged(bool value) {
    setState(() {
      _usePhoneSettings = value;
      if (value) {
        _lightMode = false;
        _darkMode = false;
        HomeController.it.themeMode = ThemeMode.system;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        leadingWidth: 104.w,
        centerTitle: true,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20.w,),
            ColorFiltered(
                colorFilter: ColorFilter.mode( currentTheme.dividerColor,
                BlendMode.srcATop),
                child: Image.asset('assets/icons/left_arrow.png', width: 13.w,)),
            SizedBox(width: 3.w,),
            Text('Settings', style: TextStyle(fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: currentTheme.dividerColor),
            )
          ],
        ),
        title: Text('App Theme', style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 16.sp
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
        child: buildSettingsColumn(
            title: 'Choose your default app theme',
            children: [
              buildSettingsTile(
                title: 'Light mode',
                value: CupertinoSwitch(
                  value: _lightMode,
                  onChanged: _onLightModeChanged,
                ),
              ),
              buildSettingsTile(
                title: 'Dark mode',
                value: CupertinoSwitch(
                  value: _darkMode,
                  onChanged: _onDarkModeChanged,
                ),
              ),
              buildSettingsTile(
                title: 'Use phone settings',
                value: CupertinoSwitch(
                  value: _usePhoneSettings,
                  onChanged: _onUsePhoneSettingsChanged,
                ),
              ),

            ]
        ),
      ),
    );
  }

}