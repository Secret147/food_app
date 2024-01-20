import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            "assets/images/IllustrationBright.png",
            fit: BoxFit.cover,
          ),
        ),
        InkWell(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: Dimensions.height140,
                width: Dimensions.height140,
                child: Image.asset(
                  "assets/icons/logo.png",
                  color: AppColors.brightColor,
                )),
          ),
          onTap: () => context.goNamed("introduction"),
        ),
      ]),
    );
  }
}
