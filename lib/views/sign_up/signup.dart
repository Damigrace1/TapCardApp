import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapcard/controllers/signup_controller.dart';
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/widgets/spacing.dart';
import 'package:tapcard/views/widgets/textfield.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                addVerticalSpacing(24),
                const Center(
                  child: Text(
                    'Sign Up Account to Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter'),
                  ),
                ),
                addVerticalSpacing(40),
                const Text(
                  'Email Address',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                ),
                addVerticalSpacing(4),
                SizedBox(
                  height: 48,
                  child: TTextField(
                    decoration: InputDecoration(
                        focusColor: kpurple,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: kgrey4, width: 1),
                          borderRadius: BorderRadius.circular(14),
                        )),
                  ),
                ),
                addVerticalSpacing(16),
                const Text(
                  'Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                ),
                addVerticalSpacing(4),
                SizedBox(
                  height: 48,
                  child: TTextField(
                    decoration: InputDecoration(
                        focusColor: kpurple,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: kgrey4, width: 1),
                          borderRadius: BorderRadius.circular(14),
                        )),
                  ),
                ),
                addVerticalSpacing(16),
                const Text(
                  'Confirm Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                ),
                addVerticalSpacing(4),
                SizedBox(
                  height: 48,
                  child: TTextField(
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Image.asset(
                            'assets/icons/hide.png',
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        suffixIconConstraints: BoxConstraints(
                            maxHeight: 24,
                            maxWidth: 24,
                            minHeight: 24,
                            minWidth: 24),
                        focusColor: kpurple,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: kgrey4, width: 1),
                          borderRadius: BorderRadius.circular(14),
                        )),
                  ),
                ),
                addVerticalSpacing(27),
                GestureDetector(
                  // onTap: () {
                  //   controller.googleLogin();
                  // },
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kpurple,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Center(
                        child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: kwhite,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    )),
                  ),
                ),
                addVerticalSpacing(12),
                const Center(
                  child: Text(
                    'or',
                    style: TextStyle(
                        color: kblack,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
                addVerticalSpacing(12),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.googleLogin();
                    },
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: kgrey4),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: controller.isloading.value == false
                              ? Image.asset(
                                  'assets/images/google.png',
                                  height: 22,
                                )
                              : const CircularProgressIndicator(
                                  color: kgrey4,
                                )),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
