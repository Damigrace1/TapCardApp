import 'package:get/get.dart';
// import '../screens/signed_in_screen.dart';
import '../views/signed_in_screen.dart';

class SettingsController extends GetxController {
  void signOut() {
    Get.off(() => const SignedInScreen());
  }

  void signIn() {
    Get.off(() => const SignedInScreen());
  }
}
