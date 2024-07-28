import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactSupportController extends GetxController {
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  void sendMessage() {
    // Implement send message logic
    print('Sending message: ${messageController.text}');
    Get.back();
  }

  @override
  void onClose() {
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
