import 'package:flutter/material.dart';
import 'package:flutteranimation/core/colors/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final FocusNode? focusNode;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Function(String)? onFieldSubmitted;

  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.name,
      required this.prefixIcon,
      this.obscureText = false,
      this.textCapitalization = TextCapitalization.none,
      required this.inputType,
      this.focusNode,
      this.prefixIconColor = cyanColor,
      this.suffixIcon,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        focusNode: focusNode,
        // enabled: true,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        textCapitalization: textCapitalization,
        maxLength: 32,
        maxLines: 1,
        obscureText: obscureText,
        keyboardType: inputType,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            prefixIcon: Icon(
              prefixIcon,
              color: prefixIconColor,
            ),
            suffixIcon: suffixIcon,
            hintText: name,
            hintStyle: const TextStyle(color: Colors.black45),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: cyanColor),
            ),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: blueColor))),
      ),
    );
  }
}
