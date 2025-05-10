import 'package:flutter/material.dart';
import 'package:monbesoin_app/utils/values/my_color.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(backgroundColor: MyColors.white, title: Text("Explore")),
    );
  }
}
