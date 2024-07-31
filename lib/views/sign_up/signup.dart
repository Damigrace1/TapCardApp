// // ignore_for_file: use_build_context_synchronously
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:tapcard/controllers/signup_controller.dart';
// import 'package:tapcard/utils/const.dart';
// import 'package:tapcard/views/login/login.dart';
// import 'package:tapcard/views/widgets/spacing.dart';
// import 'package:tapcard/views/widgets/custom_textfield.dart';
//
// class Signup extends StatelessWidget {
//   const Signup({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final SignupController controller = Get.put(SignupController());
//     final _formKey = GlobalKey<FormState>();
//
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Form(
//                 autovalidateMode: AutovalidateMode.always,
//                 key: _formKey,
//                 child: SafeArea(
//                     child: Obx(
//                   () => Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Icon(
//                           Icons.arrow_back,
//                           color: kblack,
//                           size: 26,
//                         ),
//                       ),
//                       addVerticalSpacing(25),
//                       const Center(
//                         child: Text(
//                           'Sign Up Account to Get Started',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Inter'),
//                         ),
//                       ),
//                       addVerticalSpacing(40),
//                       const Text(
//                         'Email Address',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'Inter'),
//                       ),
//                       addVerticalSpacing(4),
//                       SizedBox(
//                         height: 48,
//                         child: TTextField(
//                           cursorHeight: 20,
//                           style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: kblack,
//                               fontFamily: 'Inter'),
//                           controller: controller.emailController,
//                           validators: controller.emailValidator,
//                           decoration: InputDecoration(
//                               hintText: 'Enter email',
//                               hintStyle: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: kgrey5,
//                                   fontFamily: 'Inter'),
//                               border: OutlineInputBorder(
//                                 borderSide:
//                                     const BorderSide(color: kgrey4, width: 1),
//                                 borderRadius: BorderRadius.circular(14),
//                               )),
//                         ),
//                       ),
//                       addVerticalSpacing(16),
//                       const Text(
//                         'Password',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'Inter'),
//                       ),
//                       addVerticalSpacing(4),
//                       SizedBox(
//                         height: 48,
//                         child: TTextField(
//                           controller: controller.passwordController,
//                           keyboardType: TextInputType.visiblePassword,
//                           validators: controller.passwordValidator,
//                           decoration: InputDecoration(
//                               focusColor: kpurple,
//                               hintText: 'Enter password',
//                               hintStyle: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: kgrey5,
//                                   fontFamily: 'Inter'),
//                               border: OutlineInputBorder(
//                                 borderSide:
//                                     const BorderSide(color: kgrey4, width: 1),
//                                 borderRadius: BorderRadius.circular(14),
//                               )),
//                         ),
//                       ),
//                       addVerticalSpacing(16),
//                       const Text(
//                         'Confirm Password',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'Inter'),
//                       ),
//                       addVerticalSpacing(4),
//                       SizedBox(
//                         height: 48,
//                         child: TTextField(
//                           controller: controller.repasswordController,
//                           validators: controller.passwordValidator,
//                           keyboardType: TextInputType.visiblePassword,
//                           decoration: InputDecoration(
//                               hintText: 'Re-enter password',
//                               hintStyle: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: kgrey5,
//                                   fontFamily: 'Inter'),
//                               suffixIcon: Padding(
//                                 padding: const EdgeInsets.only(right: 7),
//                                 child: Image.asset(
//                                   'assets/icons/hide.png',
//                                 ),
//                               ),
//                               contentPadding: const EdgeInsets.all(10),
//                               suffixIconConstraints: const BoxConstraints(
//                                   maxHeight: 24,
//                                   maxWidth: 24,
//                                   minHeight: 24,
//                                   minWidth: 24),
//                               focusColor: kpurple,
//                               border: OutlineInputBorder(
//                                 borderSide:
//                                     const BorderSide(color: kgrey4, width: 1),
//                                 borderRadius: BorderRadius.circular(14),
//                               )),
//                         ),
//                       ),
//                       addVerticalSpacing(27),
//                       GestureDetector(
//                         onTap: () async {
//                           try {
//                             if (_formKey.currentState!.validate()) {
//                               if (controller.passwordController.text ==
//                                   controller.repasswordController.text) {
//                                 await controller.signUp(
//                                   controller.emailController.text,
//                                   controller.passwordController.text,
//                                 );
//                                 Get.to(() => const Login());
//                               } else {
//                                 return _showalertdialog(
//                                     'Dear user,  passwords are not similar.',
//                                     context);
//                               }
//                             }
//                           } on FirebaseAuthException catch (e) {
//                             var message = e.message;
//                             _showalertdialog(message.toString(), context);
//                             controller.isloadingemail.value = false;
//                           }
//                         },
//                         child: Container(
//                             height: 56,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 color: kpurple,
//                                 borderRadius: BorderRadius.circular(16)),
//                             child: Center(
//                                 child: controller.isloadingemail.value == false
//                                     ? const Text(
//                                         'Sign Up',
//                                         style: TextStyle(
//                                             color: kwhite,
//                                             fontFamily: 'Inter',
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 16),
//                                       )
//                                     : const CircularProgressIndicator(
//                                         color: kwhite,
//                                       ))),
//                       ),
//                       addVerticalSpacing(12),
//                       const Center(
//                         child: Text(
//                           'or',
//                           style: TextStyle(
//                               color: kblack,
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16),
//                         ),
//                       ),
//                       addVerticalSpacing(12),
//                       GestureDetector(
//                         onTap: () async {
//                           try {
//                             await controller.googleLogin();
//                             Get.to(() => const Login());
//                           } on FirebaseAuthException catch (e) {
//                             var message = e.message;
//                             _showalertdialog(message.toString(), context);
//                           }
//                         },
//                         child: Container(
//                           height: 56,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: Colors.transparent,
//                               border: Border.all(color: kgrey4),
//                               borderRadius: BorderRadius.circular(16)),
//                           child: Center(
//                               child: controller.isloadinggoogle.value == false
//                                   ? Image.asset(
//                                       'assets/images/google.png',
//                                       height: 22,
//                                     )
//                                   : const CircularProgressIndicator(
//                                       color: kgrey4,
//                                     )),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//               ),
//               Center(
//                   child: RichText(
//                 text: TextSpan(
//                     text: 'Already have an account?',
//                     style: const TextStyle(
//                         color: kblack,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Inter'),
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: ' Log In',
//                           style: const TextStyle(
//                               color: kpurple,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'Inter'),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               Navigator.pushNamed(context, '/login');
//                             })
//                     ]),
//               )),
//             ],
//           ),
//         ));
//   }
// }
//
// _showalertdialog(String errorMsg, BuildContext context) {
//   return Alert(
//     context: context,
//     type: AlertType.error,
//     title: "An error occured",
//     style: AlertStyle(
//       descStyle: TextStyle(
//           color: kblack.withOpacity(0.6),
//           fontSize: 16,
//           fontWeight: FontWeight.w500),
//       titleStyle: const TextStyle(
//           color: kblack, fontSize: 18, fontWeight: FontWeight.w600),
//     ),
//     desc: errorMsg,
//     buttons: [
//       DialogButton(
//         color: kpurple,
//         onPressed: () => Navigator.pop(context),
//         width: 120.w,
//         child: const Text(
//           "Click to fix",
//           style: TextStyle(
//               color: kwhite, fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//       )
//     ],
//   ).show();
// }
