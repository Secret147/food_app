import 'package:flutter/material.dart';
import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/big_text/big_text.dart';
import 'package:foodapp/widgets/bigtextdarkmode/big_text_dark.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/input_custom/input_custom.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    @override
    void dispose() {
      emailController.dispose();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
              left: Dimensions.height30,
              right: Dimensions.height30,
              top: Dimensions.height50),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: Dimensions.height80,
              width: Dimensions.height80,
              child: Image.asset(
                "assets/icons/logo.png",
                color: AppColors.mainColor,
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Row(
              children: [
                BigTextDark(text: "Forgot "),
                BigText(
                  text: "Password",
                  color: AppColors.mainColor,
                )
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            TextNormal(
              text: "Enter your email we sent OTP ",
              color: AppColors.textGrayColor,
            ),
            TextNormal(
              text: "for verification.",
              color: AppColors.textGrayColor,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
              ),
              child: InputCustom(
                controller: emailController,
                icon: Icons.email,
                label: "Email",
                focus: true,
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return FutureBuilder(
                        future: context
                            .read<userProvider>()
                            .sendMailPassword(emailController.text),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return AlertDialog(
                              title: const Center(
                                child: CircularProgressIndicator(),
                              ),
                              content: SizedBox(
                                height: Dimensions.height80,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      TextDarkMode(
                                        text: 'Mật khẩu mới đang được gửi tới ',
                                      ),
                                      TextDarkMode(
                                        text:
                                            'gmail của bạn.Vui lòng kiểm tra ',
                                      ),
                                      TextDarkMode(
                                        text: 'và tiến hành đăng nhập lại ',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            if (snapshot.data == "Success") {
                              return AlertDialog(
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          context.goNamed("signin");
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
                                title: Center(
                                  child: Column(
                                    children: [
                                      TextDarkMode(
                                        text: "Mật khẩu mới đã được gửi ",
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      TextDarkMode(
                                        text:
                                            "tới email của bạn! Vui lòng kiểm tra",
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      TextDarkMode(
                                        text: " và đăng nhập lại.",
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return AlertDialog(
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
                                      GestureDetector(
                                        onTap: () {
                                          context.goNamed("signup");
                                        },
                                        child: SizedBox(
                                          width: Dimensions.height100,
                                          child: ButtonCustom(
                                            text: "Đăng ký",
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                                title: Center(
                                  child: Column(
                                    children: [
                                      TextDarkMode(
                                        text: "Email chưa được đăng kí!",
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      TextDarkMode(
                                        text:
                                            "Vui lòng nhập lại email chính xác",
                                      ),
                                      SizedBox(
                                        height: Dimensions.height5,
                                      ),
                                      TextDarkMode(
                                        text: "Hoặc đăng ký tài khoản mới",
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }
                        },
                      );
                    },
                  );
                },
                child: ButtonCustom(text: "Next")),
            SizedBox(
              height: Dimensions.height10,
            ),
          ]),
        ),
      ),
    );
  }
}
