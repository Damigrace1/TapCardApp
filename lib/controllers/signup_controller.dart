import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupController extends GetxController {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  RxBool isloading = false.obs;

  Future googleLogin() async {
    isloading.value = true;
    final googlesignIn = GoogleSignIn();
    final googleUser = await googlesignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      await auth.signInWithCredential(credential);
      isloading.value = false;
    }
    isloading.value = false;
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  TextEditingController get emailController => _emailcontroller;
  TextEditingController get passwordController => _passwordcontroller;

  // String? Function(String? email) get emailValidator =>
  //     Validators.emailValidator;

  // String? Function(String? password) get passwordValidator =>
  //     Validators.passwordValidator;

  // set passwordVisible(bool val) {
  //   _passwordVisible = val;
  //   notifyListeners();
  // }

  // Future<void Function()?> gregister() async {
  //   _firebaseservice.googleLogin();
  //   return null;
  // }

  // Future<void Function()?> register() async {
  //   await _firebaseservice.signUp(
  //     _emailcontroller.text.trim(),
  //     _passwordcontroller.text,
  //   );

  //   return null;
  // }

  // Future<void Function()?> logout() async {
  //   await _firebaseservice.logOut();

  //   return null;
  // }
}
