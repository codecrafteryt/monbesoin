/*
        ---------------------------------------
        Project: Monbesoin App
        Date: May 5, 2025
        Developer: Ameer
        ---------------------------------------
        Description:  Signup widget screen
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:monbesoin_app/controller/auth_controller/auth_controller.dart';
import 'package:monbesoin_app/utils/extensions/extentions.dart';
import 'package:monbesoin_app/utils/values/my_color.dart';
import 'package:monbesoin_app/views/home/home_pages.dart';
import 'package:monbesoin_app/views/widget/custom_button_widget.dart';
import 'package:monbesoin_app/views/widget/custom_textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  final AuthController controller = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGround,

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Form(
            key: _formKey,
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
                const Text("Create Account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                10.sbh,
                const Text("Please fill the form to continue", style: TextStyle(fontSize: 16)),
                30.sbh,
                CustomTextField( // Email
                  hintText: "Enter Your Email".tr,
                  controller: controller.signUpEmailController,
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
                Obx(() => CustomTextField( // Password Field with Toggle
                  hintText: "Enter Your Password".tr,
                  controller: controller.signUpPasswordController,
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
                  isObscureText: !controller.isPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => controller.isPasswordVisible.toggle(),
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
                5.sbh,
                Obx(() => CustomTextField( // Confirm Password Field with Toggle
                  hintText: "Confirm Your Password".tr,
                  controller: controller.confirmPasswordController,
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
                  isObscureText: !controller.isConfirmPasswordVisible.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => controller.isConfirmPasswordVisible.toggle(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm password cannot be empty'.tr;
                    }
                    if (value != controller.signUpPasswordController.text) {
                      return 'Passwords do not match'.tr;
                    }
                    return null;
                  },
                )),
                30.sbh,
                CustomButton(
                  text: 'Sign Up'.tr,
                  borderRadius: 12.0.r,
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
                  textColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  width: 352.w,
                  height: 65.h,
                  onPressed: () {
                    // if (_formKey.currentState?.validate() ?? false) {
                    //   // controller.register();
                    // }
                    Get.to(() => HomePages(),);
                  },
                ),
                20.sbh,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.back();
                        controller.onClose();
                      },
                      child: const Text("Login"),
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
