import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';
import 'widgets/bottom_navigation_bar.dart';
// import '../widgets/bottom_navigation_bar.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Settings',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                leading: const CircleAvatar(
                  backgroundColor: Color(0xffeaddff),
                  child: Icon(Icons.person_outlined,
                      color: Color.fromARGB(255, 117, 69, 207)),
                ),
                title: const Text('Sign in to TapCard'),
                subtitle: const Text('Backup and restore your cards'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => controller.signIn(),
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                'Sharing Settings',
                style: TextStyle(color: Colors.black45),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                tileColor: Colors.white,
                title: const Text('Default sharing method'),
                trailing: const Icon(Icons.chevron_right),
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                'Appearance & Themes',
                style: TextStyle(color: Colors.black45),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                tileColor: Colors.white,
                title: const Text('App Theme'),
                trailing: const Icon(Icons.chevron_right),
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                'Support',
                style: TextStyle(color: Colors.black45),
              ),
              const SizedBox(
                height: 5,
              ),
              const ListTile(
                tileColor: Colors.white,
                title: Text('Help Center'),
                trailing: Icon(Icons.chevron_right),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
              const Divider(
                height: 0,
                indent: 20,
                endIndent: 30,
              ),
              const ListTile(
                tileColor: Colors.white,
                title: Text('Contact Support'),
                trailing: Icon(Icons.chevron_right),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                tileColor: Colors.white,
                title: const Text('App Version'),
                trailing: const Text('2024.7.0(001)'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
