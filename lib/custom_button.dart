import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,  this.filled = true, required this.text,
    required this.onPressed,
  });
  final bool filled;
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: filled ? Colors.black : Colors.white,
        side: BorderSide(color:  filled ? Colors.black : Colors.grey.shade400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(text,style: TextStyle(
          color: filled? Colors.white : Colors.black
      ),),
    );
  }
}