/*
        ---------------------------------------
        Project: Monbesoin App
        Date: May 5, 2025
        Developer: Ameer
        ---------------------------------------
        Description:  login widget screen
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:monbesoin_app/controller/auth_controller/auth_controller.dart';
import 'package:monbesoin_app/utils/extensions/extentions.dart';
import 'package:monbesoin_app/utils/values/my_color.dart';
import 'package:monbesoin_app/views/auth/signup_screen.dart';
import 'package:monbesoin_app/views/widget/custom_button_widget.dart';
import 'package:monbesoin_app/views/widget/custom_textfield_widget.dart';

class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // ✅ Add form key

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGround,
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: Form( // ✅ Wrap in Form
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                60.sbh,
                Image.asset(
                  'assets/images/logonobg.png',
                  width: 108.w,
                  height: 129.h,
                ),
                20.sbh,
                const Text("Welcome Back!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                10.sbh,
                const Text("Please login to continue", style: TextStyle(fontSize: 16)),
                30.sbh,
                // Email Field
                CustomTextField(
                  hintText: "Enter Your Email".tr,
                  controller: controller.loginEmailController,
                  textColor: Colors.black,
                  cursorColor: Colors.black,
                  borderColor: MyColors.darkWhite,
                  focusedBorderColor: MyColors.darkWhite,
                  width: 352.w,
                  height: 75.h,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                  preventSpaces: true,
                  allowedPattern: r'[a-zA-Z0-9@._-]',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty'.tr;
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email address'.tr;
                    }
                    return null;
                  },
                ),
                5.sbh,
                Obx(() => CustomTextField(
                  hintText: "Enter Your Password".tr,
                  controller: controller.passwordLoginController,
                  textColor: Colors.black,
                  cursorColor: Colors.black,
                  borderColor: MyColors.darkWhite,
                  focusedBorderColor: MyColors.darkWhite,
                  width: 352.w,
                  height: 75.h,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 50,
                  preventSpaces: true,
                  allowedPattern: r'[a-zA-Z0-9@._-]',
                  isObscureText: controller.isPasswordHidden.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPasswordHidden.value = !controller.isPasswordHidden.value;
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty'.tr;
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters'.tr;
                    }
                    return null;
                  },
                )),

                30.sbh,
                CustomButton( // Login Button
                  text: 'Login'.tr,
                  borderRadius: 12.0.r,
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                  textColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  width: 352.w,
                  height: 65.h,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                     // controller.login(); // ✅ Call login if valid
                    }
                  },
                ),
                20.sbh,
                Row(  // Sign Up Link
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                       Get.to(() => SignUpScreen(),);
                       controller.onClose();
                      },
                      child: const Text("Sign up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

