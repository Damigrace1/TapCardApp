import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  /// Create a model that contains the details of the business card and replace it with all these placeholders

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      child: Card(
        color: Color(0xFF002B27),  // Custom dark green color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 33.5.h,horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'www.jonasbroms.com',
                    style: TextStyle(color: Colors.white,fontSize: 8.sp,fontWeight: FontWeight.w500),
                  ),
                 Image.asset('assets/images/default_card_logo.png',width: 44.w,)
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                'Jonas Broms',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
             // SizedBox(height: 8.h),
              Text(
                'UX/UI Designer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 23.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'jonas.broms@jonasbroms.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8.sp
                    ),
                  ),
                  Text(
                    '+234 805 456 321',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 8.sp
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}