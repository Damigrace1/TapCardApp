import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/views/home/home.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8E60DD),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
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
                    Get.offAll(()=> const HomeScreen());

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
