import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';

class InputPasswordCustom extends StatefulWidget {
  const InputPasswordCustom({
    super.key,
    required this.label,
  });
  final String label;

  @override
  State<InputPasswordCustom> createState() => _InputPasswordCustomState();
}

class _InputPasswordCustomState extends State<InputPasswordCustom> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: AppColors.brightColor,
        fontSize: Dimensions.font20,
      ),
      obscureText: _isObscure,
      decoration: InputDecoration(
          labelText: widget.label,
          focusColor: AppColors.brightColor,
          border: const OutlineInputBorder(),
          // this button is used to toggle the password visibility
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              })),
    );
  }
}
