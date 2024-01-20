import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/signup/widgets/header_signup.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/big_text/big_text.dart';
import 'package:foodapp/widgets/bigtextdarkmode/big_text_dark.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/button_icon/button_icon.dart';
import 'package:foodapp/widgets/input_custom/input_custom.dart';
import 'package:foodapp/widgets/input_pass_custom/input_password_custom.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderSignUp(),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Row(
                  children: [
                    BigTextDark(text: "Welcome "),
                    BigText(
                      text: "PTIT",
                      color: AppColors.mainColor,
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                TextNormal(
                  text: "Please enter your sign up details.",
                  color: AppColors.textGrayColor,
                ),
                SizedBox(
                  height: Dimensions.height40,
                ),
                const InputCustom(
                  label: "Email",
                  icon: CupertinoIcons.mail,
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                const InputPasswordCustom(
                  label: "Password",
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                const InputPasswordCustom(
                  label: "Re-Enter Password",
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InkWell(
                  onTap: () => context.goNamed("signup"),
                  child: ButtonCustom(
                    text: "Sign up",
                    background: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InkWell(
                  onTap: () => context.goNamed("signin"),
                  child: ButtonCustom(
                    text: "Sign in",
                    color: AppColors.mainColor,
                    textColor: AppColors.mainColor,
                    background: Dimensions.darkmode
                        ? AppColors.darkColor
                        : AppColors.brightColor,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextNormal(
                    text: "Or Countinue With",
                    color: AppColors.textGrayColor,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonIconCustom(
                      icon: "assets/icons/google (2) 1.png",
                      text: "Google",
                      heightIcon: Dimensions.height170,
                      widthIcon: Dimensions.height50,
                    ),
                    ButtonIconCustom(
                      icon: "assets/icons/facebook (2) 1.png",
                      text: "Facebook",
                      heightIcon: Dimensions.height150,
                      widthIcon: Dimensions.height50,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
