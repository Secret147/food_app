import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/big_text/big_text.dart';
import 'package:foodapp/widgets/bigtextdarkmode/big_text_dark.dart';
import 'package:foodapp/widgets/button_custom/buttom_custom.dart';
import 'package:foodapp/widgets/input_custom/input_custom.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
                icon: Icons.email,
                label: "Email",
                focus: true,
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            GestureDetector(
                onTap: () => context.goNamed("otp"),
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
