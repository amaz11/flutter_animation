import 'package:flutter/material.dart';
import 'package:flutteranimation/core/colors/colors.dart';
import 'package:flutteranimation/module/auth/controller/auth_controller.dart';
import 'package:flutteranimation/module/auth/view/widget/form_widget.dart';

import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final AuthController loginController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: blueColor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_headLine(context), Expanded(child: FormWidget())],
      ),
    ));
  }

  Widget _headLine(BuildContext context) {
    return Container(
      // color: ,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 50),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Login",
            style: TextStyle(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Text(
            "Enter a beautiful world",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
