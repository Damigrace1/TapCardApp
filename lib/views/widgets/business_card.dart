import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/views/widgets/sharing_dialog.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/nfc_controller.dart';
import '../../custom_button.dart';
import '../../model/nfc_service_model.dart';
// import '../../model/nfc_service_model.dart';

class BusinessCard extends StatelessWidget {
  // final BusinessCardModel card;
  /// Create a model that contains the details of the business card and replace it with all these placeholders
  final Color? color;

  final String name;
  final String? jobTitle;
  final String? website;
  final String? email;
  final String phoneNumber;

  BusinessCard({
    super.key,
    required this.name,
    this.jobTitle,
    this.website,
    this.email,
    required this.phoneNumber,
    required this.color,
  });
  ValueNotifier<bool> isTapped = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isTapped,
        builder: (context, val, _) {
          return GestureDetector(
            onTap: () {
              isTapped.value = !isTapped.value;
            },
            child: SizedBox(
              width: 390.w,
              child: Card(
                color: color ?? Color(0xFF002B27), // Custom dark green color

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 33.5.h, horizontal: 24.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            website ?? '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Image.asset(
                            'assets/images/default_card_logo.png',
                            width: 44.w,
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        name ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // SizedBox(height: 8.h),
                      Text(
                        jobTitle ?? '',
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
                            email ?? '',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 8.sp),
                          ),
                          Text(
                            phoneNumber ?? '',
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
                            Divider(),
                            SizedBox(
                              height: 24.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 4.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.r)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      text: 'Share',
                                      onPressed: () {
                                        print('Share button pressed');
                                        HomeController.it.shareBusinessCard(
                                            BusinessCardModel(
                                                name: name,
                                                phoneNumber: phoneNumber));
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const SharingDialog(),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Expanded(
                                    child: CustomButton(
                                      filled: false,
                                      onPressed: () {
                                        HomeController.it
                                            .showEditCardDialog(context);
                                      },
                                      text: 'Edit',
                                    ),
                                  ),
                                  SizedBox(width: 12.0),
                                  Expanded(
                                    child: CustomButton(
                                      filled: false,
                                      text: 'Read NFC',
                                      onPressed: () {
                                        print('Read NFC button pressed');
                                        HomeController.it.readNfcTag();
                                      },
                                    ),
                                  ),
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
  }
}
