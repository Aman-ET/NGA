import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  // final IconData prefixIcon;
  final IconData iconData;   // icon left right
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.iconData,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      obscureText:  obscureText,
      keyboardType: keyboardType,
      validator:  validator,

      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(12),

        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  const BorderSide(
            color: Colors.grey,
          )
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.green,
            width:  2
          )
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        )
      ),
    );
  }
}