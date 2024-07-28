import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapcard/utils/themes.dart';

import 'home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentTheme.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/app_logo.png', width: 81.22.w,),
              SizedBox(width: 3.w,),
              Text('tapcard',style: TextStyle(
                fontSize: 43.36.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade100
              ),)
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: 382.w,
                child: ElevatedButton(
                  onPressed: (){
                    Get.to(()=> Home());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r)
                    )
                  ),
                  child: Text('Get Started',style: TextStyle(
                    fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.grey.shade800

                  ),),
                ),
              ),
              SizedBox(height: 24.h,)
            ],
          )
        ],
      ),
    );
  }
}
