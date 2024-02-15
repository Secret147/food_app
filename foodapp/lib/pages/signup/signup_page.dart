import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/user.dart';
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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    super.dispose();
  }

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(Dimensions.height20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderSignUp(),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => context.goNamed("home"),
                        child: BigTextDark(text: "Welcome ")),
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
                InputCustom(
                  controller: emailController,
                  label: "Email",
                  icon: CupertinoIcons.mail,
                  focus: true,
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InputCustom(
                  controller: nameController,
                  label: "Name",
                  icon: CupertinoIcons.person,
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
                InputPasswordCustom(
                  controller: repasswordController,
                  label: "Re-Enter Password",
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                InkWell(
                  onTap: () {
                    if (passwordController.text == repasswordController.text) {
                      User user = User(
                          email: emailController.text,
                          name: nameController.text,
                          password: passwordController.text,
                          roles: {""});
                      context.read<userProvider>().postNewUser(user);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text("Sai mat khau nhap lai"),
                          );
                        },
                      );
                    }
                  },
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
