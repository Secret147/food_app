import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key,
      required this.text,
      required this.colorIcon,
      required this.icon});
  final String text;
  final Color colorIcon;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      decoration: BoxDecoration(
        color: AppColors.brightColor,
        borderRadius: BorderRadius.circular(Dimensions.borderRadius15),
        boxShadow: [
          BoxShadow(
            color: Dimensions.darkmode
                ? const Color.fromARGB(255, 127, 126, 126).withOpacity(0)
                : const Color.fromARGB(255, 127, 126, 126).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: Dimensions.height20,
          ),
          Container(
            height: Dimensions.height50,
            width: Dimensions.height50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorIcon,
            ),
            child: Icon(
              icon,
              color: AppColors.brightColor,
            ),
          ),
          SizedBox(
            width: Dimensions.height20,
          ),
          Expanded(
            child: TextNormal(
              text: text,
              color: AppColors.textColor,
              textSize: Dimensions.font20,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
