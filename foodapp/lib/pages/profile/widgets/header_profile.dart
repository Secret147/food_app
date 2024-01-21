import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/big_text/big_text.dart';
import 'package:foodapp/widgets/bigtextdarkmode/big_text_dark.dart';
import 'package:go_router/go_router.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height110,
      decoration: const BoxDecoration(),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => context.goNamed("signin"),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.modeColor,
              ),
            ),
            Expanded(
              child: Center(
                child: BigTextDark(
                  text: "Profile",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
