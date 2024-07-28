import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountController extends GetxController {
  void showUpdateEmailDialog() {
    Get.dialog(
      Column(
        children: [
          Container(
            height: 310,
          ),
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
            title: const Text(
              'Update Email',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
            content: const TextField(
              decoration: InputDecoration(
                hintText: 'Enter email',
                border: OutlineInputBorder(),
              ),
            ),
            // clipBehavior: Clip.antiAlias,
            actions: [
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 110,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: const Color(0xff8e60dd),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Colors.grey[200],
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          elevation: 0),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
