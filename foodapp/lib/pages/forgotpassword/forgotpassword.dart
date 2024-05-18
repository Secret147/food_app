import 'package:flutter/material.dart';
import 'package:foodapp/local_notifications.dart';
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

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  void initState() {
    super.initState();
  }

  bool isAPICalled = false;
  @override
  Widget build(BuildContext context) {
    listenToNotifications(context) {
      print("Listening to notification");
      LocalNotifications.onClickNotification.stream.listen((event) {
        print(event);
        Navigator.pushNamed(context, '/home', arguments: event);
      });
    }

    final TextEditingController emailController = TextEditingController();

    @override
    void dispose() {
      emailController.dispose();
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                text: "Nhập email của bạn và Click chọn Enter. ",
                color: AppColors.textGrayColor,
              ),
              TextNormal(
                text: "Chúng tôi sẽ gửi lại mật khẩu qua email",
                color: AppColors.textGrayColor,
              ),
              TextNormal(
                text: "của bạn. Vui lòng kiểm tra và đăng nhập lại!",
                color: AppColors.textGrayColor,
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius10),
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
              isAPICalled == false
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isAPICalled = true;
                        });
                        context
                            .read<userProvider>()
                            .sendMailPassword(emailController.text)
                            .then((value) {
                          if (value == "Success") {
                            LocalNotifications.showSimpleNotification(
                                title: "Reset Password",
                                body:
                                    "Mật khẩu của bạn đã được reset và gửi qua email ${emailController.text}của bạn. Vui lòng kiểm tra email và tiến hành đăng nhập lại!",
                                payload: "This is simple data");
                            context.goNamed("signin");
                          } else {
                            setState(() {
                              isAPICalled = false;
                            });
                            return showDialog(
                                context: context,
                                builder: (context) {
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
                                                background:
                                                    AppColors.brightColor,
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
                                });
                          }
                        });
                      },
                      child: ButtonCustom(text: "Enter"),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              SizedBox(
                height: Dimensions.height10,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
