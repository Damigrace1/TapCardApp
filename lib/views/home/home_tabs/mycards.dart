import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/business_card.dart';
import '../home.dart';

class MyCardsTab extends StatelessWidget {
   MyCardsTab({super.key});

  final CardReceiverController controller = Get.put(CardReceiverController()); 

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


// AM CREATING THE CARD RECEIVER USING FUTURE DELAY AS TIMER
// TO SET UP THE NFC FUNCTIONALITY. 
// AUTHOR : TOZ. 

class CardReceiverController extends GetxController{
  @override
  
  void onInit() {
    super.onInit(); 

    Future.delayed(const Duration(
      seconds: 5), 
      () => showCardShareDialog()
      );  
    
  }

  void showCardShareDialog() {
    Get.dialog(
       AlertDialog(
        title: const Text('Incoming Card Share', 
        style: TextStyle(fontWeight: FontWeight.bold, 
        fontSize: 16),
        textAlign: TextAlign.center,),
        content: SizedBox(
          width: 100.w, 
          height: 100.h,
          child: const Image(
            image: AssetImage('assets/images/iphone_share.png'), 
            ),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actionsPadding: const EdgeInsets.only(left: 18, right: 20),
          actions: [

 TextButton(
    onPressed: () => Get.back(), 
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,  
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0), 
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), 
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.pink),
        borderRadius: BorderRadius.circular(8.0)), 
    ), 
  child: const Text('Decline'), 
  ),

TextButton(
  onPressed: () => addContact(), 
  style: TextButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Colors.pink, 
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0), 
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), 
  ), 
child: const Text('Accept'), 
)
          ],
          
      ), 
      barrierDismissible: false
    );
  }

  void addContact(){
    
  }

}