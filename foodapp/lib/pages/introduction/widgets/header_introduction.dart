import 'package:flutter/material.dart';
import 'package:foodapp/widgets/text_darkmode/text_dark_mode.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class HeaderIntroduction extends StatelessWidget {
  const HeaderIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 12, right: 12),
      child: TextDarkMode(
        text: "Skip",
      ),
    );
  }
}
