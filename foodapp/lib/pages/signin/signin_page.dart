import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/signup/widgets/header_signup.dart';
import 'package:foodapp/providers/userProvider.dart';
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
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

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
                  text: "Please enter your sign in details.",
                  color: AppColors.textGrayColor,
                ),
                SizedBox(
                  height: Dimensions.height40,
                ),
                InputCustom(
                  controller: emailController,
                  label: "Email",
                  icon: CupertinoIcons.mail,
                  focus: true,
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InputPasswordCustom(
                  controller: passwordController,
                  label: "Password",
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                GestureDetector(
                  onTap: () => context.goNamed("forgotpassword"),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextDarkMode(text: "Forgot Password?"),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: Dimensions.height150,
                          child: Column(
                            children: [
                              TextNormal(
                                text: "Sign in with gmail",
                                color: AppColors.textGrayColor,
                              ),
                              Text(
                                "(+91) 65485 8XX98",
                                style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.modeColor,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              TextNormal(
                                text: "We will send the authentication code",
                                color: AppColors.textGrayColor,
                                textSize: 14,
                              ),
                              TextNormal(
                                text: "to the phone number you entered",
                                color: AppColors.textGrayColor,
                                textSize: 14,
                              ),
                              TextNormal(
                                text: "Do you want to continue?",
                                color: AppColors.textGrayColor,
                                textSize: 14,
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: SizedBox(
                                  width: Dimensions.height100,
                                  child: ButtonCustom(
                                    text: "Cancel",
                                    color: AppColors.mainColor,
                                    background: AppColors.brightColor,
                                    textColor: AppColors.mainColor,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Map<String, dynamic> user = {
                                    "email": emailController.text,
                                    "password": passwordController.text,
                                  };
                                  context
                                      .read<userProvider>()
                                      .postLogin(user)
                                      .then(
                                    (status) {
                                      if (status == "Success") {
                                        context.goNamed("home");
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(status),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                                child: SizedBox(
                                  width: Dimensions.height100,
                                  child: ButtonCustom(
                                    text: "Next",
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  child: ButtonCustom(
                    text: "Sign in",
                    background: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InkWell(
                  onTap: () => context.goNamed("signup"),
                  child: ButtonCustom(
                    text: "Sign up",
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
