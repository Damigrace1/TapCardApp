import 'package:flutter/material.dart';

class ShareOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.share, size: 48, color: Colors.white),
            SizedBox(height: 16),
            Text('Bring phones closer for sharing',
                style: TextStyle(color: Colors.white)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement cancel sharing logic
              },
              child: Text('Cancel Sharing'),
            ),
          ],
        ),
      ),
    );
  }
}
