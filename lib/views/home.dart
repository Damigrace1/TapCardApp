import 'package:flutter/material.dart';
import 'package:tapcard/views/edit_card.dart';
import 'package:tapcard/views/widgets/business_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BusinessCard(
              name: 'Jonas Broms',
              jobTitle: 'UX/UI Designer',
              website: 'www.jonasbroms.com',
              email: 'jonas.broms@jonasbroms.com',
              phoneNumber: '+234 805 456 321',
              color: const Color(0xff002214),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EditCard()));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Edit Card',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
