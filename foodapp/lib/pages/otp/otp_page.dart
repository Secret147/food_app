import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:foodapp/pages/signup/widgets/header_signup.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/big_text/big_text.dart';
import 'package:foodapp/widgets/bigtextdarkmode/big_text_dark.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key, required this.otp});
  final dynamic otp;

  @override
  Widget build(BuildContext context) {
    String result = "";
    final defaultPinTheme = PinTheme(
        width: Dimensions.height60,
        height: Dimensions.height60,
        textStyle: TextStyle(
          fontSize: Dimensions.font40,
          fontWeight: FontWeight.bold,
          color: AppColors.modeColor,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.borderRadius10),
            border: Border.all(color: AppColors.modeColorBorder)));
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
                BigTextDark(text: "Enter "),
                BigText(
                  text: "OTP",
                  color: AppColors.mainColor,
                )
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            TextNormal(
              text: "A verification code has been sent to",
              color: AppColors.textGrayColor,
            ),
            TextNormal(
              text: otp["email"],
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
              child: Pinput(
                autofocus: true,
                length: 5,
                defaultPinTheme: defaultPinTheme,
                onCompleted: (value) {
                  result = value;
                },
                focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!
                        .copyWith(border: Border.all(color: Colors.green))),
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            GestureDetector(
                onTap: () {
                  if (result == otp["otp"]) {
                    context.goNamed("home");
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
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
                              ],
                            )
                          ],
                          title: Center(
                            child: Column(
                              children: [
                                TextDarkMode(
                                  text: "Sai mã OTP",
                                ),
                                SizedBox(
                                  height: Dimensions.height5,
                                ),
                                TextDarkMode(
                                  text: "Vui lòng nhập lại OTP chính xác",
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
                child: ButtonCustom(text: "Next")),
            SizedBox(
              height: Dimensions.height10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextDarkMode(
                  text: "Didn’t receive the code?",
                  textSize: 14,
                ),
                Row(
                  children: [
                    TextNormal(
                      text: " Resend (",
                      color: AppColors.mainColor,
                      textSize: 14,
                    ),
                    TimerCountdown(
                      format: CountDownTimerFormat.secondsOnly,
                      timeTextStyle: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.font14,
                      ),
                      endTime: DateTime.now().add(
                        const Duration(
                          seconds: 30,
                        ),
                      ),
                      enableDescriptions: false,
                      onEnd: () {
                        print("Timer finished");
                      },
                    ),
                    TextNormal(
                      text: "s)",
                      color: AppColors.mainColor,
                      textSize: 14,
                    ),
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
