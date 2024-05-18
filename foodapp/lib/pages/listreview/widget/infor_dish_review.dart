import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodapp/models/dish.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widgets/bigtextdarkmode/big_text_dark.dart';
import 'package:foodapp/widgets/text_normal/text_normal.dart';

class InforDishReview extends StatelessWidget {
  const InforDishReview({super.key, required this.dish});
  final Dish dish;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.height20),
      child: Row(
        children: [
          BigTextDark(text: "${dish.rate}", textSize: Dimensions.font40),
          SizedBox(
            width: Dimensions.height20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Wrap(
                    children: List.generate(
                        dish.rate.toInt(),
                        (index) => const Icon(
                              Icons.star_border,
                              color: AppColors.buttonStartColor,
                            )),
                  ),
                  Wrap(
                    children: List.generate(
                        5 - dish.rate.toInt(),
                        (index) => Icon(
                              Icons.star_border,
                              color: AppColors.modeColor,
                            )),
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              TextNormal(
                text: "${dish.review} Reviews",
                color: AppColors.textGrayColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
