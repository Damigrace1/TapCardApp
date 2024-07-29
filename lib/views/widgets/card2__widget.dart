import 'package:flutter/material.dart';

class Card2Widget extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String website;
  final String email;
  final String phoneNumber;
  final Color color;

  const Card2Widget({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.website,
    required this.email,
    required this.phoneNumber,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        // Add logic for showing buttons
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  website,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                Image.asset(
                  'assets/images/card_logo.png',
                  width: 40,
                  alignment: Alignment.topRight,
                  matchTextDirection: true,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              jobTitle,
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  email,
                  style: const TextStyle(color: Colors.white, fontSize: 9),
                ),
                const SizedBox(height: 4),
                Text(
                  phoneNumber,
                  style: const TextStyle(color: Colors.white, fontSize: 9),
                ),
              ],
            ),

            // const SizedBox(height: 16),
            // if (true) // Replace with condition to show/hide buttons
            // Row(
            //   children: [
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: Text('Share'),
            //     ),
            //     SizedBox(width: 8),
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: Text('Edit'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
