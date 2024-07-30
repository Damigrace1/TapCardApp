import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tapcard/views/widgets/sharing_dialog.dart';

import '../../controllers/home_controller.dart';
import '../../custom_button.dart';
import '../../models/business_model.dart';

class BusinessCard extends StatelessWidget {

  final BusinessCardModel business;

  BusinessCard({
   required this.business});
  ValueNotifier<bool> isTapped = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: isTapped, builder: (context,
    val,_){
    return GestureDetector(
      onTap: () {
        isTapped.value = !isTapped.value;
      },
      child: SizedBox(
        width: 390.w,
        child: Card(
          color: business.color, // Custom dark green color

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 33.5.h, horizontal: 24.w),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          business.website??'',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          business.company??'',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500),
                        ),

                      ],
                    ),
                    Image.asset(
                      'assets/images/default_card_logo.png',
                      width: 44.w,
                    )

                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  business.name??'',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

               // SizedBox(height: 8.h),
                Text(
                  business.jobTitle??'',
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
                      business.email??'',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 8.sp),

                    ),
                    Text(
                      business.phoneNumber??'',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 8.sp),
                    ),
                  ],
                ),

                if (val) // Replace with condition to show/hide buttons
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       SizedBox(height: 24.h),
                      const Divider(),
                      SizedBox(height: 24.h,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.h,vertical:4.h ),
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(14.r)),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(text: 'Share',
                                onPressed: (){
                                  showDialog(
                                    context: context,
                                    builder: (context) => const SharingDialog(),
                                  );
                                },),
                            ),
                            SizedBox(width: 12.w,),
                            Expanded(
                              child: CustomButton(filled:  false,
                                onPressed :(){
                                  HomeController.it.showEditCardDialog(context);
                                },
                                text: 'Edit',),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  });
}}

