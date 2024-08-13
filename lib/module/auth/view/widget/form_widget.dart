import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutteranimation/core/colors/colors.dart';
import 'package:flutteranimation/core/utils/custom_textfild.dart';
import 'package:flutteranimation/module/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key});
  // final AuthController controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocus = FocusNode();
  @override
  Widget build(
    BuildContext context,
  ) {
    print("Matha 1");
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 50,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: GetBuilder<AuthController>(builder: (controller) {
          print("Matha 2");
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _textFilds(context, controller),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(color: blueColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6), // <-- Radius
                      ),
                      minimumSize: const Size(200, 40),
                    ),
                    child: Text(
                      "Login".toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  Widget _textFilds(BuildContext context, AuthController controller) {
    return Column(
      children: [
        CustomTextfield(
          controller: controller.emailController,
          name: "Enter Your Email",
          prefixIcon: Icons.email,
          inputType: TextInputType.emailAddress,
          // focusNode: controller.emailFocusNode,
          prefixIconColor: controller.emailPrefixIconColor.value,
          // onFieldSubmitted: (v) {
          //   FocusScope.of(context).requestFocus(controller.passwordFocuseNode);
          // },
        ),
        CustomTextfield(
          controller: controller.passwordController,
          name: "Enter Your Password",
          prefixIcon: Icons.password,
          inputType: TextInputType.text,
          // focusNode: controller.passwordFocuseNode,
          prefixIconColor: controller.passwordPrefixIconColor.value,
          obscureText: controller.passwordVisible,
          // onFieldSubmitted: (v) {
          //   if (_formKey.currentState!.validate()) {
          //     controller.handleDone(context);
          //   }
          // },
          suffixIcon: IconButton(
              onPressed: () {
                controller.passwordVisible = !controller.passwordVisible;
              },
              icon: controller.passwordVisible
                  ? const Icon(Icons.visibility_outlined)
                  : const Icon(Icons.visibility_off_outlined)),
        ),
      ],
    );
  }
}
