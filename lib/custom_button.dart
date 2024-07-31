import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.filled = true,
      required this.text,
      required this.onPressed,
      this.fillColor,
      this.width,
      this.enabled = true});
  final bool filled;
  final String text;
  final Function() onPressed;
  final Color? fillColor;
  final double? width;
  bool enabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: filled
              ? fillColor?.withOpacity(enabled ? 1 : 0.4) ??
                  Colors.black.withOpacity(enabled ? 1 : 0.4)
              : Colors.white,
          side: BorderSide(
              color: filled
                  ? fillColor?.withOpacity(enabled ? 1 : 0) ??
                      Colors.black.withOpacity(enabled ? 1 : 0)
                  : Colors.grey.shade400.withOpacity(enabled ? 1 : 0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: filled ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
