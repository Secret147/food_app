import 'package:flutter/cupertino.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class PosIconText extends StatelessWidget {
  const PosIconText({super.key, required this.pos});
  final String pos;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.location_solid,
          color: AppColors.mainColor,
          size: 30,
        ),
        SizedBox(
          height: Dimensions.height50,
        ),
        TextNormal(
          text: pos,
          color: AppColors.textGrayColor,
        )
      ],
    );
  }
}
