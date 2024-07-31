import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tapcard/controllers/cardcustom_controller.dart';
import 'package:tapcard/controllers/home_controller.dart';
import 'package:tapcard/models/business_model.dart';
import 'package:tapcard/services/local_storage_services.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/home/home.dart';
import 'package:tapcard/views/widgets/business_card.dart';
import 'package:tapcard/views/widgets/dialogs/customization_complete.dart';
import 'package:tapcard/views/widgets/spacing.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.business});

  final BusinessCardModel business;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  late BusinessCardModel businessCardModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    businessCardModel = widget.business;
  }

  @override
  Widget build(BuildContext context) {
    final CardCustomController cardcustomcontroller =
        Get.put(CardCustomController());
    final HomeController homecontroller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
//                homecontroller.getColor();
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/back.png',
                height: 15,
                width: 15,
              ),
            ),
            addHorizontalSpacing(10),
            const Expanded(
              child: Text(
                'Customize Card',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context)=>CustomizationComplete());
                LocalStorageService.instance
                    .updateMyCard(businessCardModel.toMap());
              },
              child: Row(
                children: [
                  const Text(
                    'Save',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: kpurple,
                        fontWeight: FontWeight.w500),
                  ),
                  addHorizontalSpacing(2),
                  Image.asset(
                    'assets/images/arrow.png',
                    height: 15,
                    width: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
        shape: const Border(bottom: BorderSide(color: kblack, width: 0.1)),
        surfaceTintColor: Colors.transparent,
        elevation: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preview',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            addVerticalSpacing(8),
            BusinessCard(

              businessCard: BusinessCardModel(
                name: businessCardModel.name,
                jobTitle: businessCardModel.jobTitle,
                website: businessCardModel.website,
                email: businessCardModel.email,
                phoneNumber: businessCardModel.phoneNumber,
                color: businessCardModel.color,
              ),

            ),

            addVerticalSpacing(30),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     height: 50,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(14), color: kpurple),
            //     child: const Center(
            //       child: Text(
            //         'Change color',
            //         style: TextStyle(
            //             color: kwhite,
            //             fontFamily: 'Inter',
            //             fontSize: 18,
            //             fontWeight: FontWeight.w600),
            //       ),
            //     ),
            //   ),
            // ),
            addHorizontalSpacing(21),

            const Text(
              'Color',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.h,),
            ColorPicker(
              padding: EdgeInsets.zero,
              pickersEnabled: const <ColorPickerType, bool>{
                ColorPickerType.both: false,
                ColorPickerType.primary: false,
                ColorPickerType.accent: false,
                ColorPickerType.bw: false,
                ColorPickerType.custom: false,
                ColorPickerType.wheel: false,
              },
              enableShadesSelection: false,
              color: cardcustomcontroller.pickerColor.value,
              onColorChanged: (Color color) async {
                cardcustomcontroller.pickerColor.value = color;
                setState(() {
                  businessCardModel.color = color;
                });

                // await cardcustomcontroller.setColor(color);
              },
              spacing: 15.w,
              width: 40,
              height: 40,
              borderRadius: 16,
            ),
          ],
        ),
      ),
    );
  }}


