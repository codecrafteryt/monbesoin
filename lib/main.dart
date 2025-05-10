/*
        ---------------------------------------
        Project: Monbesoin App
        Date: May 5, 2025
        Developer: Ameer
        ---------------------------------------
        Description: Main.dart code the entry point
      */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:monbesoin_app/data/helper/get_di.dart';
import 'package:monbesoin_app/views/auth/splash_screen.dart';

import 'views/views.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
        designSize: const Size(375, 880),
        minTextAdapt: false,
        splitScreenMode: false,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.leftToRight,
            home: const Views(),
          );
        });
  }
}
