import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:nfc_card_exchange/controllers/change_password_controller.dart';
// import 'package:nfc_card_exchange/screens/signed_in_screen.dart';

import '../controllers/change_password_controller.dart';
import '../controllers/my_account_controller.dart';
import 'signed_in_screen.dart';
import 'sync_contact_screen.dart';

// ignore: use_key_in_widget_constructors
class MyAccountScreen extends StatelessWidget {
  final email = Get.put(MyAccountController());
  final password = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.to(() => SignedInScreen()),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Account',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),

              title: const Text(
                'Change your email',
                style: TextStyle(fontSize: 15),
                softWrap: false,
              ),
              // subtitle: const Text(
              //   'johndoe@gmail.com',
              //   style: TextStyle(fontSize: 12),
              // ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => email.showUpdateEmailDialog(),
            ),
            const Divider(
              height: 0,
              indent: 20,
              endIndent: 30,
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Change your password'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => password.showUpdatePasswordDialog(),
            ),
            const Divider(
              height: 0,
              indent: 20,
              endIndent: 30,
            ),
            ListTile(
              tileColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              title: const Text('Sync your contacts'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SyncContactScreen()));
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(

                onPressed: () {
                  // Implement delete account logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff03227),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  'Delete account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
