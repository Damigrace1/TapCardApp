
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tapcard/controllers/home_controller.dart';
import 'package:tapcard/custom_button.dart';
import 'package:tapcard/models/business_model.dart';
import 'package:tapcard/services/local_storage_services.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/home/home_tabs/mycontacts.dart';
import 'package:tapcard/views/widgets/business_card.dart';
import 'package:tapcard/views/widgets/dialogs/contact_saved.dart';

class ReceivedCard extends StatelessWidget {
  const ReceivedCard({Key? key, required this.businessCardModel}) : super(key: key);
final BusinessCardModel businessCardModel;
  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                businessCard: businessCardModel,
              ),
              const SizedBox(height: 20),
               Text(
                'You received a business card!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                     // HomeController.it.readBusinessCard();// Discard action
                    },
                    child: Container(
                      width: 169.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kgrey4),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      LocalStorageService.instance.saveOthersCards(businessCardModel.toMap());
                      Get.put(ContactController()).getContacts();
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (context) => const ContactSaved(),
                      );
                     // HomeController.it.readBusinessCard();
                    },
                    child: Container(
                      width: 169.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kpurple),
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Text(
                          'Add to contacts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}