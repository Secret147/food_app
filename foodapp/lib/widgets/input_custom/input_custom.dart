import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';

class InputCustom extends StatelessWidget {
  const InputCustom({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: AppColors.brightColor,
        fontSize: Dimensions.font20,
      ),
      decoration: InputDecoration(
        focusColor: AppColors.brightColor,
        border: const OutlineInputBorder(),
        labelText: label,
        suffixIcon: Icon(
          icon,
        ),
      ),
    );
  }
}
