/*
  ---------------------------------------
   Project: Monbesoin App
   Date: May 5, 2025
   Developer: Ameer
  ---------------------------------------
  Description: Simplified Navigation Bar using StatelessWidget.
*/
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monbesoin_app/controller/auth_controller/auth_controller.dart';
import 'package:monbesoin_app/utils/values/my_color.dart';
import 'package:monbesoin_app/views/account/account.dart';
import 'package:monbesoin_app/views/explore/explore.dart';
import 'package:monbesoin_app/views/home/home.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final AuthController controller = Get.find();

  final List<Widget> _screens = const [
    Home(),
    Explore(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: _screens[controller.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.backGround,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.selectedIndex.value,
        onTap: (index) => controller.selectedIndex.value = index,
        selectedItemColor: MyColors.black,
        unselectedItemColor: const Color.fromRGBO(120, 130, 138, 1),
        items: [
          BottomNavigationBarItem(
            icon: const FaIcon(Icons.home_outlined),
            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list_alt_outlined),
            label: 'Listing'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: 'Account'.tr,
          ),
        ],
      ),
    ));
  }
}
