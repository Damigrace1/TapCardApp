
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tapcard/custom_button.dart';
import 'package:tapcard/models/business_model.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/widgets/business_card.dart';

import 'contact_saved.dart';
class IncomingCard extends StatelessWidget {
  const IncomingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BusinessCard(
                        businessCard: BusinessCardModel(
                          name: 'Jonas Broms',
                          jobTitle: 'UX/UI Designer',
                          website: 'www.jonasbroms.com',
                          email: 'jonas.broms@jonasbroms.com',
                          phoneNumber: '+234 805 456 321',
                          color: const Color(0xff002214),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'You received a business card!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            width: 169.w,
                            text: 'Close',
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            filled: false,
                          ),
                          CustomButton(
                            width: 169.w,
                              fillColor: kpurple,
                              text: 'Add to contacts',
                              onPressed: () {
                              Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (context) => ContactSaved());
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}





