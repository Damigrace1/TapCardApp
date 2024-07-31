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
  final CardReceiverController controller = Get.put(CardReceiverController());

  bool isLoading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
HomeController.it.getCards();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller)
    {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return BusinessCard(
                      businessCard:
                      BusinessCardModel.fromMap(controller.myCards[index]));
                },
                shrinkWrap: true,
                separatorBuilder: (c, _) => SizedBox(
                  height: 15.h,
                ),
                itemCount:controller. myCards.length),

            AddNewCard(),
          ],
        ),
      );
    });
  }
}


class CardReceiverController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 5), () => showCardShareDialog());
  }

  void showCardShareDialog() {
    Get.dialog(
        Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 100),
                const SizedBox(height: 20),
                const Text(
                  'Contact Saved!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20), // Add spacing between the text and the button
                InkWell(
                  onTap: () {
                    Navigator.of(Get.context!).pop(); // Close the dialog
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }

  // void showReceivedCardDialog() {
  //   Get.dialog(
  //       Dialog(
  //         backgroundColor: Colors.transparent,
  //         insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
  //         child: Container(
  //           width: MediaQuery.of(context).size.width,
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 BusinessCard(
  //                   businessCard: BusinessCardModel(
  //                     name: 'Jonas Broms',
  //                     jobTitle: 'UX/UI Designer',
  //                     website: 'www.jonasbroms.com',
  //                     email: 'jonas.broms@jonasbroms.com',
  //                     phoneNumber: '+234 805 456 321',
  //                     color: const Color(0xff002214),
  //                   ),
  //                 ),
  //                 const SizedBox(height: 20),
  //                 const Text(
  //                   'You received a business card!',
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 20),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     InkWell(
  //                       onTap: () {
  //                         Navigator.of(context).pop(); // Discard action
  //                       },
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(10),
  //                           border: Border.all(color: kgrey4),
  //                         ),
  //                         child: const Padding(
  //                           padding: EdgeInsets.symmetric(
  //                             horizontal: 20,
  //                             vertical: 15,
  //                           ),
  //                           child: Text(
  //                             'Close',
  //                             style: TextStyle(
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     InkWell(
  //                       onTap: () {
  //                         Navigator.of(context).pop();
  //                         _showSuccessDialog();
  //                       },
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(10),
  //                             color: kpurple
  //                         ),
  //                         child: const Padding(
  //                           padding: EdgeInsets.symmetric(
  //                             horizontal: 20,
  //                             vertical: 15,
  //                           ),
  //                           child: Text(
  //                             'Add to contacts',
  //                             style: TextStyle(
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.white,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       )
  //   );
  // }

  void addContact() {
    Get.dialog(AlertDialog(
      content: BusinessCard(
        businessCard: BusinessCardModel(
          name: 'Jonas Broms',
          jobTitle: 'UX/UI Designer',
          website: 'www.jonasbroms.com',
          email: 'jonas.broms@jonasbroms.com',
          phoneNumber: '+234 805 456 321',
          color: const Color(0xff002214),
        ),
      ),
      title: const Text(
        'You received a business card!',
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.pink),
                borderRadius: BorderRadius.circular(8.0)),
          ),
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () => completeSuccess(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.pink,
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
          child: const Text('Add to Contact'),
        )
      ],
    ));
  }

  void completeSuccess() {
    Get.dialog(
      AlertDialog(
        content: Container(
          width: 120.h,
          height: 120.h,
          decoration:
              const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          child: const Align(
              child: Icon(
            Icons.check,
            color: Colors.white,
          )),
        ),
        title: const Text(
          'Contact Saved!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: const [],
      ),
      barrierDismissible: false,
    );
  }
}
