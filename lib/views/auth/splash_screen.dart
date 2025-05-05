/*
        ---------------------------------------
        Project: Monbesoin App
        Date: May 5, 2025
        Developer: Ameer
        ---------------------------------------
        Description: splash screen code
*/

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:monbesoin_app/utils/extensions/extentions.dart';
import 'package:monbesoin_app/utils/values/my_color.dart';
import 'package:monbesoin_app/views/auth/login_screen.dart';
import '../../utils/values/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (progress < 1.0) {
        setState(() {
          progress += 0.05;
        });
      } else {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 10), () {
          if (mounted) {
            Get.offAll(() => LoginScreen());
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logonobg.png',
            width: 308.w,
            height: 329.h,
          ),
          12.sbh,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Monbesoin",
                textAlign: TextAlign.center,
                style: kSize11DarkW500Text.copyWith(
                  fontSize: 64,
                )
            ),
          ),
          91.sbh,
          Stack(
            alignment: Alignment.center,
            children: [
              const SpinKitCircle(
                color: Colors.black,
                size: 100.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}