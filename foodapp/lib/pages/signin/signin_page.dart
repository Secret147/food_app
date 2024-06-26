import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/mail.dart';
import 'package:foodapp/pages/signup/widgets/header_signup.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/repositories/auth_service.dart';
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
                    if (emailController.text != "" &&
                        passwordController.text != "") {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: SizedBox(
                            height: Dimensions.height150,
                            child: Column(
                              children: [
                                TextNormal(
                                  text: "Sign in with email",
                                  color: AppColors.textGrayColor,
                                ),
                                Text(
                                  emailController.text,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: Dimensions.font16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.modeColor,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                TextNormal(
                                  text: "Chúng tôi sẽ gửi mã OTP đến",
                                  color: AppColors.textGrayColor,
                                  textSize: 14,
                                ),
                                TextNormal(
                                  text: "email của bạn. Vui lòng chọn Next",
                                  color: AppColors.textGrayColor,
                                  textSize: 14,
                                ),
                                TextNormal(
                                  text: "để tiếp tục quá trình đăng nhập",
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
                                    if (emailController.text != "" &&
                                        passwordController.text != "") {
                                      Map<String, dynamic> user = {
                                        "email": emailController.text,
                                        "password": passwordController.text,
                                      };
                                      context
                                          .read<userProvider>()
                                          .postLogin(user)
                                          .then(
                                        (status) async {
                                          if (status == "Success") {
                                            var rng = Random();
                                            int randomNumber =
                                                rng.nextInt(90000) + 10000;
                                            String otp =
                                                randomNumber.toString();
                                            Mail mail = Mail(
                                                subject: "OTP đăng nhập",
                                                message: otp);
                                            context
                                                .read<userProvider>()
                                                .sendMail(
                                                    emailController.text, mail);
                                            context.goNamed("otp", extra: {
                                              "otp": otp,
                                              "email": emailController.text
                                            });
                                          } else {
                                            Navigator.of(context).pop();
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Center(
                                                    child: Column(
                                                      children: [
                                                        TextDarkMode(
                                                          text:
                                                              "Tài khoản hoặc mật khẩu của bạn",
                                                          overflow:
                                                              TextOverflow.clip,
                                                        ),
                                                        SizedBox(
                                                          height: Dimensions
                                                              .height10,
                                                        ),
                                                        TextDarkMode(
                                                          text:
                                                              " không chính xác! Vui lòng nhập lại ",
                                                          overflow:
                                                              TextOverflow.clip,
                                                        ),
                                                        SizedBox(
                                                          height: Dimensions
                                                              .height10,
                                                        ),
                                                        TextDarkMode(
                                                          text:
                                                              " tài khoản và mật khẩu.",
                                                          overflow:
                                                              TextOverflow.clip,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: SizedBox(
                                                            width: Dimensions
                                                                .height100,
                                                            child: ButtonCustom(
                                                              text: "Cancel",
                                                              color: AppColors
                                                                  .mainColor,
                                                              background: AppColors
                                                                  .brightColor,
                                                              textColor:
                                                                  AppColors
                                                                      .mainColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AlertDialog(
                                            title: Text(
                                                "Vui lòng nhập đầy đủ các trường"),
                                          );
                                        },
                                      );
                                    }
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
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Center(
                              child: Text(
                                "Vui lòng nhập đầy đủ các trường",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                ],
                              )
                            ],
                          );
                        },
                      );
                    }
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
                    GestureDetector(
                      onTap: () => AuthService().signInWithGoogle(),
                      child: ButtonIconCustom(
                        icon: "assets/icons/google (2) 1.png",
                        text: "Google",
                        heightIcon: Dimensions.height170,
                        widthIcon: Dimensions.height50,
                      ),
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
