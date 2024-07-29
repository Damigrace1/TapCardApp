import 'package:flutter/material.dart';
// import 'package:nfc_card_exchange/screens/settings_screen.dart';

import '../settings_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => ()),
        // );
        break;
      case 1:
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => ()),
        // );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SettingsScreen()),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/House.png',
            width: 24,
            height: 24,
            color: currentIndex == 0 ? const Color(0xff8e60dd) : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/IdentificationCard.png',
            width: 24,
            height: 24,
            color: currentIndex == 1 ? const Color(0xff8e60dd) : Colors.grey,
          ),
          label: 'Cards',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/GearSix.png',
            width: 24,
            height: 24,
            color: currentIndex == 2 ? const Color(0xff8e60dd) : Colors.grey,
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
