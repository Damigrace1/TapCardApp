import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapcard/controllers/home_controller.dart';

import '../../widgets/business_card.dart';
import '../home.dart';

class MyCardsTab extends StatelessWidget {
  const MyCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return SingleChildScrollView(
      child: Column(
        children: [
          // 4293467747

          BusinessCard(
              name: 'Jonas Broms',
              jobTitle: 'UX/UI Designer',
              website: 'www.jonasbroms.com',
              email: 'jonas.broms@jonasbroms.com',
              phoneNumber: '+234 805 456 321',
              color: Color(homeController.pickerColor!.value)),
          BusinessCard(
            name: 'Jonas Brom',
            jobTitle: 'UX/UI Designer',
            website: 'www.jonasbroms.com',
            email: 'jonas.broms@jonasbroms.com',
            phoneNumber: '+234 805 456 321',
            color: Color(homeController.pickerColor!.value),
          ),
          const AddNewCard(),
        ],
      ),
    );
  }
}
