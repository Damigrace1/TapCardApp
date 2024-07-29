import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SyncContactScreen extends StatelessWidget {
  const SyncContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
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
            const SizedBox(
              height: 12,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              tileColor: Colors.white,
              title: const Text('Contacts on this device'),
              trailing: const Icon(Icons.chevron_right),
              // onTap: () {
              //   Get.to(() => AppThemeScreen());
              // },
            ),
          ],
        ),
      ),
    );
  }
}
