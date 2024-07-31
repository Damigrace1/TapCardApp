import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/home_controller.dart';
import '../../../custom_button.dart';

class CardAdded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 87.75),
            SizedBox(height: 16.h),
            Text('New card added successfully!',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
            SizedBox(height: 24.h,),
            CustomButton(text: 'Done',
                filled: false,
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pop(context);
                  HomeController.it.getMyCards();
                })
          ],
        ),
      ),
    );
  }
}