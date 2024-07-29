import 'package:flutter/material.dart';

class SharingDialog extends StatelessWidget {
  const SharingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        // widthFactor: double.infinity,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Bring phones closer\nfor sharing!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            // const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/iphone_share.png',
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8e60dd),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Text(
                        'Cancel Sharing',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
