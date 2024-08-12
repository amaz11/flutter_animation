import 'package:flutter/material.dart';
import 'package:flutteranimation/core/colors/colors.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocuseNode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Rx<Color> emailPrefixIconColor = blueColor.obs;
  Rx<Color> passwordPrefixIconColor = blueColor.obs;
  late bool result = false;
  final RxBool obscureText = true.obs;

  set passwordVisible(bool value) {
    obscureText.value = value;
    update();
  }

  bool get passwordVisible => obscureText.value;

  void onInt() {
    super.onInit();
    emailFocusNode.addListener(_handleEmailFocuseChange);
    passwordFocuseNode.addListener(_handlePasswordFocuseChange);
    result = passwordFocuseNode.hasFocus;
  }

  _handleEmailFocuseChange() {
    if (emailFocusNode.hasFocus) {
      emailPrefixIconColor.value = cyanColor;
    } else {
      emailPrefixIconColor.value = blueColor;
    }
  }

  _handlePasswordFocuseChange() {
    if (emailFocusNode.hasFocus) {
      passwordPrefixIconColor.value = cyanColor;
    } else {
      passwordPrefixIconColor.value = blueColor;
    }
  }

  // handleObscureText() {
  //   obscureText.value = !obscureText.value;
  // }

  // @override
  // void onClose() {
  //   // emailController.dispose();
  //   // passwordController.dispose();
  //   emailFocusNode.dispose();
  //   passwordFocuseNode.dispose();
  //   super.onClose();
  // }

  // void handleDone(BuildContext context) {
  //   FocusScope.of(context).unfocus(); // Dismiss the keyboard
  //   // Additional actions can be added here, like form submission
  // }
}
