import 'package:flutter/material.dart';

import '../../widgets/business_card.dart';
import '../home.dart';

class MyCardsTab extends StatelessWidget {
  const MyCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           BusinessCard(
            name: 'Jonas Broms',
            jobTitle: 'UX/UI Designer',
            website: 'www.jonasbroms.com',
            email: 'jonas.broms@jonasbroms.com',
            phoneNumber: '+234 805 456 321',
            color: const Color(0xff002214),
          ),
           BusinessCard(
            name: 'Jonas Brom',
            jobTitle: 'UX/UI Designer',
            website: 'www.jonasbroms.com',
            email: 'jonas.broms@jonasbroms.com',
            phoneNumber: '+234 805 456 321',
            color: const Color(0xff503dd4),
          ),
          const AddNewCard(),
          
        ],
      ),
    );
  }
}
