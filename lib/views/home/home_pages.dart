import 'package:flutter/material.dart';
import 'package:monbesoin_app/views/home/nav_bar.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBar(),
    );
  }
}
