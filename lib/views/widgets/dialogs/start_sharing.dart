import 'package:flutter/material.dart';
import 'package:tapcard/custom_button.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/widgets/dialogs/sharing_complete.dart';

class StartSharing extends StatelessWidget {
  const StartSharing({super.key});

  @override
  Widget build(BuildContext context) {
  return  Dialog(
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
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Bring phones closer\nfor sharing!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25
                ),
                child: Image.asset(
                  'assets/images/iphone_share.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomButton(text: 'Cancel sharing',onPressed: (){
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => const SharingComplete(),
                    );
                  },fillColor: kpurple,)
              ),
              const SizedBox(height: 20),
            ],
          )
        ),
      ),
    );


  }
}
