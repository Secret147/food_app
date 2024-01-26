import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';

class InputCustom extends StatelessWidget {
  InputCustom({
    super.key,
    required this.label,
    required this.icon,
    this.focus = false,
    required this.controller,
  });
  final String label;
  final IconData icon;
  bool focus;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      controller: controller,
      style: TextStyle(
        color: AppColors.modeColor,
        fontSize: Dimensions.font20,
      ),
      autofocus: focus,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: AppColors.textGrayColor,
        ),
        focusColor: AppColors.brightColor,
        enabledBorder: outlineCustom(),
        focusedBorder: outlineCustom(),
        border: const OutlineInputBorder(),
        labelText: label,
        suffixIcon: Icon(
          icon,
        ),
      ),
    );
  }

  OutlineInputBorder outlineCustom() => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
      );
}
