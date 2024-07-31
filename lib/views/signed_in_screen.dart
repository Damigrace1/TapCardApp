import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapcard/views/settings/settings_view.dart';


import '../controllers/settings_controller.dart';
import 'contact_support_screen.dart';
import 'my_account_screen.dart';
import 'widgets/bottom_navigation_bar.dart';

class SignedInScreen extends StatefulWidget {
  const SignedInScreen({super.key});

  @override
  State<SignedInScreen> createState() => _SignedInScreenState();
}

class _SignedInScreenState extends State<SignedInScreen> {
  final controller = Get.put(SettingsController());
  void _navigateToContactSupportScreen() {
    Get.to(ContactSupportScreen());
    // Get.off(() => ContactSupportScreen());
  }

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
                leading: CircleAvatar(
                  backgroundColor: Colors.purple[100],
                  child:
                      Text('JD', style: TextStyle(color: Colors.purple[800])),
                ),
                title: const Text('John Doe'),
                subtitle: const Text('johndoe@gmail.com'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Get.off(MyAccountScreen()),
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
                onTap: () {
                  Get.to(() => SettingsView());
                },
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
              ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                tileColor: Colors.white,
                title: const Text('Help Center'),
                trailing: const Icon(Icons.chevron_right),
                // onTap: () => Get.off(ContactSupportScreen()),
                onTap: _navigateToContactSupportScreen,
              ),
              const Divider(
                height: 0,
                indent: 20,
                endIndent: 30,
              ),
              ListTile(
                tileColor: Colors.white,
                title: const Text('Contact Support'),
                trailing: const Icon(Icons.chevron_right),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                onTap: _navigateToContactSupportScreen,
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
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.signOut(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff03227),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: const Text(
                    'Sign out',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
