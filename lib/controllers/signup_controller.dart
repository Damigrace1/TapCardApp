import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tapcard/utils/validators.dart';

class SignupController extends GetxController {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _repasswordcontroller = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore store = FirebaseFirestore.instance;
  RxBool _passwordVisible = true.obs;

  set passwordVisible(RxBool val) {
    _passwordVisible.value = val.value;
  }

  RxBool isloadingemail = false.obs;
  RxBool isloadinggoogle = false.obs;

  String? Function(String? email) get emailValidator =>
      Validators.emailValidator;

  String? Function(String? password) get passwordValidator =>
      Validators.passwordValidator;

  RxBool get passwordVisible => _passwordVisible;

  Future googleLogin() async {
    isloadinggoogle.value = true;
    final googlesignIn = GoogleSignIn();
    final googleUser = await googlesignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      await auth.signInWithCredential(credential);
      isloadinggoogle.value = false;
    }
    isloadinggoogle.value = false;
  }

  // Future<Map<String, dynamic>?> fetchdetails() async {
  //   var collection = store.collection('Usser');
  //   final user = auth.currentUser!;

  //   var docSnapshot = await collection.doc(user.uid).get();

  //   Map<String, dynamic>? data = docSnapshot.data();
  //   debugPrint('$data');
  //   return data;
  // }

  Future signUp(String email, String password) async {
    isloadingemail.value = true;

    await auth.createUserWithEmailAndPassword(email: email, password: password);
    isloadingemail.value = false;

    return true;
  }

  Future signIn(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
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
  TextEditingController get repasswordController => _repasswordcontroller;

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
