import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator, this.inputType, required this.title,
  });
  final TextInputType? inputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextFormField(
          controller: controller,
          validator: validator,
          textInputAction: TextInputAction.next,
          keyboardType: inputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16.h,)
      ],
    );
  }
}