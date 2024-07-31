import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tapcard/controllers/home_controller.dart';
import 'package:tapcard/models/business_model.dart';

import '../../../services/local_storage_services.dart';
import '../../widgets/business_card.dart';
import '../home.dart';

class MyCardsTab extends StatefulWidget {
  MyCardsTab({super.key});

  @override
  State<MyCardsTab> createState() => _MyCardsTabState();
}

class _MyCardsTabState extends State<MyCardsTab> {

  bool isLoading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
HomeController.it.getMyCards();
//HomeController.it.readBusinessCard();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller)
    {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 28.h,),
            ListView.separated(

                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return BusinessCard(
                    tappable: true,
                      businessCard:
                      BusinessCardModel.fromMap(controller.myCards[index]));
                },
                shrinkWrap: true,
                separatorBuilder: (c, _) => SizedBox(
                  height: 15.h,
                ),
                itemCount:controller. myCards.length),
            const AddNewCard(),
          ],
        ),
      );
    });
  }
}
