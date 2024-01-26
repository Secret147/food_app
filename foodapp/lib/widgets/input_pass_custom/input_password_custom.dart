import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';

class InputPasswordCustom extends StatefulWidget {
  InputPasswordCustom({
    super.key,
    required this.label,
    this.focus = false,
    required this.controller,
  });
  final String label;
  bool focus;
  final TextEditingController controller;

  @override
  State<InputPasswordCustom> createState() => _InputPasswordCustomState();
}

class _InputPasswordCustomState extends State<InputPasswordCustom> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      style: TextStyle(
        color: AppColors.modeColor,
        fontSize: Dimensions.font20,
      ),
      obscureText: _isObscure,
      autofocus: widget.focus,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: AppColors.textGrayColor,
        ),
        enabledBorder: outlineCustom(),
        focusedBorder: outlineCustom(),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          child: Container(
            child: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineCustom() => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
      );
}
