  /*
          ---------------------------------------
          Project: Monbesoin App
          Date: May 5, 2025
          Developer: Ameer
          ---------------------------------------
          Description: Auth controller
  */

  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:shared_preferences/shared_preferences.dart';

  class AuthController extends GetxController {
    final SharedPreferences sharedPreferences;

    AuthController({required this.sharedPreferences});
    RxInt selectedIndex = 0.obs; // nav bar selected index
    TextEditingController loginEmailController = TextEditingController();
    TextEditingController passwordLoginController = TextEditingController();
    TextEditingController signUpPasswordController = TextEditingController();
    TextEditingController signUpEmailController = TextEditingController();

    RxBool isPasswordHidden = true.obs;
    final RxBool isPasswordVisible = false.obs;
    final RxBool isConfirmPasswordVisible = false.obs;
    final TextEditingController confirmPasswordController = TextEditingController();

    @override
    void onClose() {
      loginEmailController.clear();
      passwordLoginController.clear();
      signUpPasswordController.clear();
      signUpEmailController.clear();
      confirmPasswordController.clear();
      super.onClose();
    }

    void disposeControllers() {
      loginEmailController.dispose();
      passwordLoginController.dispose();
      signUpPasswordController.dispose();
      signUpEmailController.dispose();
      confirmPasswordController.dispose();
    }

  }