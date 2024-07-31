import 'package:flutter/material.dart';

class ShareOverlay extends StatelessWidget {
  const ShareOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.share, size: 48, color: Colors.white),
            const SizedBox(height: 16),
            const Text('Bring phones closer for sharing',
                style: TextStyle(color: Colors.white)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement cancel sharing logic
              },
              child: const Text('Cancel Sharing'),
            ),
          ],
        ),
      ),
    );
  }
}
