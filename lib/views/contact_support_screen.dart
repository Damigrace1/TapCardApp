import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/contact_support_controller.dart';

class ContactSupportScreen extends StatelessWidget {
  final controller = Get.put(ContactSupportController());

  ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          TextButton(
            onPressed: () => controller.sendMessage(),
            child: const Text('Send', style: TextStyle(color: Colors.purple)),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sync Contact',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('We will respond to this email address'),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  // labelText: 'Email',
                  hintText:
                      'Email                                 johndoe@gmail.com',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Message'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: controller.messageController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText:
                      'Experiencing issues? Let us know and we\'ll do our best to help out!',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
