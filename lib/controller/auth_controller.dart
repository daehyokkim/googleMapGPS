import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_google_map_app/view/login.dart';
import 'package:main_google_map_app/view/mainPage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(authentication.currentUser);
    _user.bindStream(authentication.userChanges());
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user) {
    print(user);
    if (user == null) {
      print("hi");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => MainPage());
    }
  }

  void onRegister(String email, String password) async {
    try {
      print('Registe..');
      await authentication.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("errorMessage", "User Message",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Registration is Filed"),
          messageText: Text(e.toString()));
    }
  }

  void onLogIn(String email, String password) async {
    try {
      print("wait Log In..");
      Get.dialog(
          Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false);

      await authentication.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.back();
      Get.snackbar("ErrorMessage", "User Message",
          backgroundColor: Colors.red,
          titleText: Text(
            "Login is failed",
          ),
          messageText: Text(e.toString()));
    } finally {}
  }

  void onLogOut() {
    authentication.signOut();
  }
}
