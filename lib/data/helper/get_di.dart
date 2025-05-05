/*
        ---------------------------------------
        Project: Monbesoin App
        Date: May 5, 2025
        Developer: Ameer
        ---------------------------------------
        Description: Dependency Injection
      */

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:monbesoin_app/controller/auth_controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection { // controllers DI
  static void init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences, fenix: true);
    Get.lazyPut(() => AuthController(sharedPreferences: sharedPreferences), fenix: true);

  }
}