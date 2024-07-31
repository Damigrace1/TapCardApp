import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tapcard/utils/const.dart';

import '../../../controllers/home_controller.dart';
import '../../../custom_button.dart';

class ScanIncomingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ready to Scan',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
            SizedBox(height: 24.h,),
            Image.asset('assets/icons/ready_to_scan.png',width: 108.w,),
            SizedBox(height: 24.h,),
            CustomButton(text: 'Cancel',
                fillColor: kpurple1,
                onPressed: (){
              Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}