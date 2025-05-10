import 'package:flutter/material.dart';
import 'package:monbesoin_app/utils/values/my_color.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(backgroundColor: MyColors.white, title: Text("Account")),
    );
  }
}
