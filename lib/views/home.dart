import 'package:flutter/material.dart';
import 'package:tapcard/views/widgets/business_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: BusinessCard(),
      ),
    );
  }
}
